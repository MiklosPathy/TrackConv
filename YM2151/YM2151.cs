#define SAMPLE_BITS_16
using System;

namespace YM2151Emu
{
    /// <summary>
    /// Mock class for simulating an Int16 ptr, because the original code structure depends on it.
    /// </summary>
    public class Int16Ptr
    {
        public Int16 value;
    }

    /* struct describing a single operator */
    public class YM2151Operator
    {
        public UInt32 phase;                   /* accumulated operator phase */
        public UInt32 freq;                    /* operator frequency count */
        public Int32 dt1;                  /* current DT1 (detune 1 phase inc/decrement) value */
        public UInt32 mul;                 /* frequency count multiply */
        public UInt32 dt1_i;                   /* DT1 index * 32 */
        public UInt32 dt2;                 /* current DT2 (detune 2) value */

        public Int16Ptr connect;                /* operator output 'direction' */

        /* only M1 (operator 0) is filled with this data: */
        public Int16Ptr mem_connect;            /* where to put the delayed sample (MEM) */
        public Int32 mem_value;                /* delayed sample (MEM) value */

        /* channel specific data; note: each operator number 0 contains channel specific data */
        public UInt32 fb_shift;                /* feedback shift value for operators 0 in each channel */
        public Int32 fb_out_curr;          /* operator feedback value (used only by operators 0) */
        public Int32 fb_out_prev;          /* previous feedback value (used only by operators 0) */
        public UInt32 kc;                      /* channel KC (copied to all operators) */
        public UInt32 kc_i;                    /* just for speedup */
        public UInt32 pms;                 /* channel PMS */
        public UInt32 ams;                 /* channel AMS */
        /* end of channel specific data */

        public UInt32 AMmask;                  /* LFO Amplitude Modulation enable mask */
        public UInt32 state;                   /* Envelope state: 4-attack(AR) 3-decay(D1R) 2-sustain(D2R) 1-release(RR) 0-off */
        public Byte eg_sh_ar;             /*  (attack state) */
        public Byte eg_sel_ar;                /*  (attack state) */
        public UInt32 tl;                      /* Total attenuation Level */
        public Int32 volume;                   /* current envelope attenuation level */
        public Byte eg_sh_d1r;                /*  (decay state) */
        public Byte eg_sel_d1r;               /*  (decay state) */
        public UInt32 d1l;                 /* envelope switches to sustain state after reaching this level */
        public Byte eg_sh_d2r;                /*  (sustain state) */
        public Byte eg_sel_d2r;               /*  (sustain state) */
        public Byte eg_sh_rr;             /*  (release state) */
        public Byte eg_sel_rr;                /*  (release state) */

        public UInt32 key;                 /* 0=last key was KEY OFF, 1=last key was KEY ON */

        public UInt32 ks;                      /* key scale    */
        public UInt32 ar;                      /* attack rate  */
        public UInt32 d1r;                 /* decay rate   */
        public UInt32 d2r;                 /* sustain rate */
        public UInt32 rr;                      /* release rate */

        public UInt32 reserved0;               /**/
        public UInt32 reserved1;               /**/

    }

    public class YM2151
    {

        public Int16Ptr[] chanout = new Int16Ptr[8] { new Int16Ptr(), new Int16Ptr(), new Int16Ptr(), new Int16Ptr(), new Int16Ptr(), new Int16Ptr(), new Int16Ptr(), new Int16Ptr() };
        public Int16Ptr m2 = new Int16Ptr(); /* Phase Modulation input for operators 2,3,4 */
        public Int16Ptr c1 = new Int16Ptr();
        public Int16Ptr c2 = new Int16Ptr();
        public Int16Ptr mem = new Int16Ptr();     /* one sample delay memory */

        public YM2151Operator[] oper = new YM2151Operator[32];            /* the 32 operators */

        public UInt32[] pan = new UInt32[16];             /* channels output masks (0xffffffff = enable) */

        public UInt32 eg_cnt;                  /* global envelope generator counter */
        public UInt32 eg_timer;                /* global envelope generator counter works at frequency = chipclock/64/3 */
        public UInt32 eg_timer_add;            /* step of eg_timer */
        public UInt32 eg_timer_overflow;       /* envelope generator timer overlfows every 3 samples (on real chip) */

        public UInt32 lfo_phase;               /* accumulated LFO phase (0 to 255) */
        public UInt32 lfo_timer;               /* LFO timer                        */
        public UInt32 lfo_timer_add;           /* step of lfo_timer                */
        public UInt32 lfo_overflow;            /* LFO generates new output when lfo_timer reaches this value */
        public UInt32 lfo_counter;         /* LFO phase increment counter      */
        public UInt32 lfo_counter_add;     /* step of lfo_counter              */
        public Byte lfo_wsel;             /* LFO waveform (0-saw, 1-square, 2-triangle, 3-random noise) */
        public Byte amd;                  /* LFO Amplitude Modulation Depth   */
        public SByte pmd;                   /* LFO Phase Modulation Depth       */
        public UInt32 lfa;                 /* LFO current AM output            */
        public Int32 lfp;                  /* LFO current PM output            */

        public Byte test;                 /* TEST register */
        public Byte ct;                       /* output control pins (bit1-CT2, bit0-CT1) */

        public UInt32 noise;                   /* noise enable/period register (bit 7 - noise enable, bits 4-0 - noise period */
        public UInt32 noise_rng;               /* 17 bit noise shift register */
        public UInt32 noise_p;             /* current noise 'phase'*/
        public UInt32 noise_f;             /* current noise period */

        public UInt32 csm_req;             /* CSM  KEY ON / KEY OFF sequence request */

        public UInt32 irq_enable;              /* IRQ enable for timer B (bit 3) and timer A (bit 2); bit 7 - CSM mode (keyon to all slots, everytime timer A overflows) */
        public UInt32 status;                  /* chip status (BUSY, IRQ Flags) */
        public Byte[] connect = new Byte[8];               /* channels connections */

        /*  Frequency-deltas to get the closest frequency possible.
        *   There are 11 octaves because of DT2 (max 950 cents over base frequency)
        *   and LFO phase modulation (max 800 cents below AND over base frequency)
        *   Summary:   octave  explanation
        *              0       note code - LFO PM
        *              1       note code
        *              2       note code
        *              3       note code
        *              4       note code
        *              5       note code
        *              6       note code
        *              7       note code
        *              8       note code
        *              9       note code + DT2 + LFO PM
        *              10      note code + DT2 + LFO PM
        */
        public UInt32[] freq = new UInt32[11 * 768];          /* 11 octaves, 768 'cents' per octave */

        /*  Frequency deltas for DT1. These deltas alter operator frequency
        *   after it has been taken from frequency-deltas table.
        */
        public Int32[] dt1_freq = new Int32[8 * 32];         /* 8 DT1 levels, 32 KC values */

        public UInt32[] noise_tab = new UInt32[32];           /* 17bit Noise Generator periods */

        public UInt16 clock;                 /* chip clock in Hz (passed from 2151intf.c) */
        public UInt16 sampfreq;              /* sampling frequency in Hz (passed from 2151intf.c) */

        public UInt32 mask;
    }



    public static class YM2151code
    {
        /*****************************************************************************
        *
        *   Yamaha YM2151 driver (version 2.150 final beta)
        *
        ******************************************************************************/

        /* 16- and 8-bit samples (signed) are supported*/
        //public const byte SAMPLE_BITS = 16;


        private const byte FREQ_SH = 16;  /* 16.16 fixed point (frequency calculations) */
        private const byte EG_SH = 16;  /* 16.16 fixed point (envelope generator timing) */
        private const byte LFO_SH = 10;  /* 22.10 fixed point (LFO calculations)       */
        private const byte TIMER_SH = 16;  /* 16.16 fixed point (timers calculations)    */

        private const UInt16 FREQ_MASK = ((1 << FREQ_SH) - 1);

        private const byte ENV_BITS = 10;
        private const UInt16 ENV_LEN = (1 << ENV_BITS);
        private const double ENV_STEP = (128.0 / ENV_LEN);

        private const UInt16 MAX_ATT_INDEX = (ENV_LEN - 1); /* 1023 */
        private const byte MIN_ATT_INDEX = (0);			/* 0 */

        private const byte EG_ATT = 4;
        private const byte EG_DEC = 3;
        private const byte EG_SUS = 2;
        private const byte EG_REL = 1;
        private const byte EG_OFF = 0;

        private const byte SIN_BITS = 10;
        private const UInt16 SIN_LEN = (1 << SIN_BITS);
        private const UInt16 SIN_MASK = (SIN_LEN - 1);

        private const UInt16 TL_RES_LEN = (256); /* 8 bits addressing (real chip) */



#if SAMPLE_BITS_16
        private const byte FINAL_SH = (0);
        private const Int16 MAXOUT = (+32767);
        private const Int16 MINOUT = (-32768);
#else
        private const byte FINAL_SH=	(8);
        private const Int16 MAXOUT	=	(+127);
        private const Int16  MINOUT	=	(-128);
#endif


        /*  TL_TAB_LEN is calculated as:
        *   13 - sinus amplitude bits     (Y axis)
        *   2  - sinus sign bit           (Y axis)
        *   TL_RES_LEN - sinus resolution (X axis)
        */
        private const UInt16 TL_TAB_LEN = (13 * 2 * TL_RES_LEN);

        private static Int16[] tl_tab = new Int16[TL_TAB_LEN];

        private const UInt16 ENV_QUIET = (TL_TAB_LEN >> 3);

        /* sin waveform table in 'decibel' scale */
        private static Int16[] sin_tab = new Int16[SIN_LEN];


        /* translate from D1L to volume index (16 D1L levels) */
        private static UInt32[] d1l_tab = new UInt32[16];


        private const byte RATE_STEPS = (8);
        private static readonly byte[] eg_inc = new byte[19 * RATE_STEPS] {

/*cycle:0 1  2 3  4 5  6 7*/

/* 0 */ 0,1, 0,1, 0,1, 0,1, /* rates 00..11 0 (increment by 0 or 1) */
/* 1 */ 0,1, 0,1, 1,1, 0,1, /* rates 00..11 1 */
/* 2 */ 0,1, 1,1, 0,1, 1,1, /* rates 00..11 2 */
/* 3 */ 0,1, 1,1, 1,1, 1,1, /* rates 00..11 3 */

/* 4 */ 1,1, 1,1, 1,1, 1,1, /* rate 12 0 (increment by 1) */
/* 5 */ 1,1, 1,2, 1,1, 1,2, /* rate 12 1 */
/* 6 */ 1,2, 1,2, 1,2, 1,2, /* rate 12 2 */
/* 7 */ 1,2, 2,2, 1,2, 2,2, /* rate 12 3 */

/* 8 */ 2,2, 2,2, 2,2, 2,2, /* rate 13 0 (increment by 2) */
/* 9 */ 2,2, 2,4, 2,2, 2,4, /* rate 13 1 */
/*10 */ 2,4, 2,4, 2,4, 2,4, /* rate 13 2 */
/*11 */ 2,4, 4,4, 2,4, 4,4, /* rate 13 3 */

/*12 */ 4,4, 4,4, 4,4, 4,4, /* rate 14 0 (increment by 4) */
/*13 */ 4,4, 4,8, 4,4, 4,8, /* rate 14 1 */
/*14 */ 4,8, 4,8, 4,8, 4,8, /* rate 14 2 */
/*15 */ 4,8, 8,8, 4,8, 8,8, /* rate 14 3 */

/*16 */ 8,8, 8,8, 8,8, 8,8, /* rates 15 0, 15 1, 15 2, 15 3 (increment by 8) */
/*17 */ 16,16,16,16,16,16,16,16, /* rates 15 2, 15 3 for attack */
/*18 */ 0,0, 0,0, 0,0, 0,0, /* infinity rates for attack and decay(s) */
};

        //#define O(a) (a*RATE_STEPS)
        private static byte Ö(byte a) { return (byte)(a * RATE_STEPS); }

        /*note that there is no O(17) in this table - it's directly in the code */
        private static readonly byte[] eg_rate_select = new byte[32 + 64 + 32] {	/* Envelope Generator rates (32 + 64 rates + 32 RKS) */
/* 32 dummy (infinite time) rates */
Ö(18),Ö(18),Ö(18),Ö(18),Ö(18),Ö(18),Ö(18),Ö(18),
Ö(18),Ö(18),Ö(18),Ö(18),Ö(18),Ö(18),Ö(18),Ö(18),
Ö(18),Ö(18),Ö(18),Ö(18),Ö(18),Ö(18),Ö(18),Ö(18),
Ö(18),Ö(18),Ö(18),Ö(18),Ö(18),Ö(18),Ö(18),Ö(18),

/* rates 00-11 */
Ö( 0),Ö( 1),Ö( 2),Ö( 3),
Ö( 0),Ö( 1),Ö( 2),Ö( 3),
Ö( 0),Ö( 1),Ö( 2),Ö( 3),
Ö( 0),Ö( 1),Ö( 2),Ö( 3),
Ö( 0),Ö( 1),Ö( 2),Ö( 3),
Ö( 0),Ö( 1),Ö( 2),Ö( 3),
Ö( 0),Ö( 1),Ö( 2),Ö( 3),
Ö( 0),Ö( 1),Ö( 2),Ö( 3),
Ö( 0),Ö( 1),Ö( 2),Ö( 3),
Ö( 0),Ö( 1),Ö( 2),Ö( 3),
Ö( 0),Ö( 1),Ö( 2),Ö( 3),
Ö( 0),Ö( 1),Ö( 2),Ö( 3),

/* rate 12 */
Ö( 4),Ö( 5),Ö( 6),Ö( 7),

/* rate 13 */
Ö( 8),Ö( 9),Ö(10),Ö(11),

/* rate 14 */
Ö(12),Ö(13),Ö(14),Ö(15),

/* rate 15 */
Ö(16),Ö(16),Ö(16),Ö(16),

/* 32 dummy rates (same as 15 3) */
Ö(16),Ö(16),Ö(16),Ö(16),Ö(16),Ö(16),Ö(16),Ö(16),
Ö(16),Ö(16),Ö(16),Ö(16),Ö(16),Ö(16),Ö(16),Ö(16),
Ö(16),Ö(16),Ö(16),Ö(16),Ö(16),Ö(16),Ö(16),Ö(16),
Ö(16),Ö(16),Ö(16),Ö(16),Ö(16),Ö(16),Ö(16),Ö(16)

};
        //#undef O

        /*rate  0,    1,    2,   3,   4,   5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15*/
        /*shift 11,   10,   9,   8,   7,   6,  5,  4,  3,  2, 1,  0,  0,  0,  0,  0 */
        /*mask  2047, 1023, 511, 255, 127, 63, 31, 15, 7,  3, 1,  0,  0,  0,  0,  0 */

        //#define O(a) (a*1)
        private static byte O(byte a) { return (byte)(a * 1); }

        private static readonly byte[] eg_rate_shift = new byte[32 + 64 + 32] {	/* Envelope Generator counter shifts (32 + 64 rates + 32 RKS) */
/* 32 infinite time rates */
O(0),O(0),O(0),O(0),O(0),O(0),O(0),O(0),
O(0),O(0),O(0),O(0),O(0),O(0),O(0),O(0),
O(0),O(0),O(0),O(0),O(0),O(0),O(0),O(0),
O(0),O(0),O(0),O(0),O(0),O(0),O(0),O(0),


/* rates 00-11 */
O(11),O(11),O(11),O(11),
O(10),O(10),O(10),O(10),
O( 9),O( 9),O( 9),O( 9),
O( 8),O( 8),O( 8),O( 8),
O( 7),O( 7),O( 7),O( 7),
O( 6),O( 6),O( 6),O( 6),
O( 5),O( 5),O( 5),O( 5),
O( 4),O( 4),O( 4),O( 4),
O( 3),O( 3),O( 3),O( 3),
O( 2),O( 2),O( 2),O( 2),
O( 1),O( 1),O( 1),O( 1),
O( 0),O( 0),O( 0),O( 0),

/* rate 12 */
O( 0),O( 0),O( 0),O( 0),

/* rate 13 */
O( 0),O( 0),O( 0),O( 0),

/* rate 14 */
O( 0),O( 0),O( 0),O( 0),

/* rate 15 */
O( 0),O( 0),O( 0),O( 0),

/* 32 dummy rates (same as 15 3) */
O( 0),O( 0),O( 0),O( 0),O( 0),O( 0),O( 0),O( 0),
O( 0),O( 0),O( 0),O( 0),O( 0),O( 0),O( 0),O( 0),
O( 0),O( 0),O( 0),O( 0),O( 0),O( 0),O( 0),O( 0),
O( 0),O( 0),O( 0),O( 0),O( 0),O( 0),O( 0),O( 0)

};
        //#undef O

        /*  DT2 defines offset in cents from base note
        *
        *   This table defines offset in frequency-deltas table.
        *   User's Manual page 22
        *
        *   Values below were calculated using formula: value =  orig.val / 1.5625
        *
        *   DT2=0 DT2=1 DT2=2 DT2=3
        *   0     600   781   950
        */
        private static readonly UInt32[] dt2_tab = new UInt32[4] { 0, 384, 500, 608 };

        /*  DT1 defines offset in Hertz from base note
        *   This table is converted while initialization...
        *   Detune table shown in YM2151 User's Manual is wrong (verified on the real chip)
        */

        private static readonly byte[] dt1_tab = new byte[4 * 32] { /* 4*32 DT1 values */
/* DT1=0 */
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,

/* DT1=1 */
  0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2,
  2, 3, 3, 3, 4, 4, 4, 5, 5, 6, 6, 7, 8, 8, 8, 8,

/* DT1=2 */
  1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 4, 4, 4, 5,
  5, 6, 6, 7, 8, 8, 9,10,11,12,13,14,16,16,16,16,

/* DT1=3 */
  2, 2, 2, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 6, 6, 7,
  8, 8, 9,10,11,12,13,14,16,17,19,20,22,22,22,22
};

        private static readonly UInt16[] phaseinc_rom = new UInt16[768] {
1299,1300,1301,1302,1303,1304,1305,1306,1308,1309,1310,1311,1313,1314,1315,1316,
1318,1319,1320,1321,1322,1323,1324,1325,1327,1328,1329,1330,1332,1333,1334,1335,
1337,1338,1339,1340,1341,1342,1343,1344,1346,1347,1348,1349,1351,1352,1353,1354,
1356,1357,1358,1359,1361,1362,1363,1364,1366,1367,1368,1369,1371,1372,1373,1374,
1376,1377,1378,1379,1381,1382,1383,1384,1386,1387,1388,1389,1391,1392,1393,1394,
1396,1397,1398,1399,1401,1402,1403,1404,1406,1407,1408,1409,1411,1412,1413,1414,
1416,1417,1418,1419,1421,1422,1423,1424,1426,1427,1429,1430,1431,1432,1434,1435,
1437,1438,1439,1440,1442,1443,1444,1445,1447,1448,1449,1450,1452,1453,1454,1455,
1458,1459,1460,1461,1463,1464,1465,1466,1468,1469,1471,1472,1473,1474,1476,1477,
1479,1480,1481,1482,1484,1485,1486,1487,1489,1490,1492,1493,1494,1495,1497,1498,
1501,1502,1503,1504,1506,1507,1509,1510,1512,1513,1514,1515,1517,1518,1520,1521,
1523,1524,1525,1526,1528,1529,1531,1532,1534,1535,1536,1537,1539,1540,1542,1543,
1545,1546,1547,1548,1550,1551,1553,1554,1556,1557,1558,1559,1561,1562,1564,1565,
1567,1568,1569,1570,1572,1573,1575,1576,1578,1579,1580,1581,1583,1584,1586,1587,
1590,1591,1592,1593,1595,1596,1598,1599,1601,1602,1604,1605,1607,1608,1609,1610,
1613,1614,1615,1616,1618,1619,1621,1622,1624,1625,1627,1628,1630,1631,1632,1633,
1637,1638,1639,1640,1642,1643,1645,1646,1648,1649,1651,1652,1654,1655,1656,1657,
1660,1661,1663,1664,1666,1667,1669,1670,1672,1673,1675,1676,1678,1679,1681,1682,
1685,1686,1688,1689,1691,1692,1694,1695,1697,1698,1700,1701,1703,1704,1706,1707,
1709,1710,1712,1713,1715,1716,1718,1719,1721,1722,1724,1725,1727,1728,1730,1731,
1734,1735,1737,1738,1740,1741,1743,1744,1746,1748,1749,1751,1752,1754,1755,1757,
1759,1760,1762,1763,1765,1766,1768,1769,1771,1773,1774,1776,1777,1779,1780,1782,
1785,1786,1788,1789,1791,1793,1794,1796,1798,1799,1801,1802,1804,1806,1807,1809,
1811,1812,1814,1815,1817,1819,1820,1822,1824,1825,1827,1828,1830,1832,1833,1835,
1837,1838,1840,1841,1843,1845,1846,1848,1850,1851,1853,1854,1856,1858,1859,1861,
1864,1865,1867,1868,1870,1872,1873,1875,1877,1879,1880,1882,1884,1885,1887,1888,
1891,1892,1894,1895,1897,1899,1900,1902,1904,1906,1907,1909,1911,1912,1914,1915,
1918,1919,1921,1923,1925,1926,1928,1930,1932,1933,1935,1937,1939,1940,1942,1944,
1946,1947,1949,1951,1953,1954,1956,1958,1960,1961,1963,1965,1967,1968,1970,1972,
1975,1976,1978,1980,1982,1983,1985,1987,1989,1990,1992,1994,1996,1997,1999,2001,
2003,2004,2006,2008,2010,2011,2013,2015,2017,2019,2021,2022,2024,2026,2028,2029,
2032,2033,2035,2037,2039,2041,2043,2044,2047,2048,2050,2052,2054,2056,2058,2059,
2062,2063,2065,2067,2069,2071,2073,2074,2077,2078,2080,2082,2084,2086,2088,2089,
2092,2093,2095,2097,2099,2101,2103,2104,2107,2108,2110,2112,2114,2116,2118,2119,
2122,2123,2125,2127,2129,2131,2133,2134,2137,2139,2141,2142,2145,2146,2148,2150,
2153,2154,2156,2158,2160,2162,2164,2165,2168,2170,2172,2173,2176,2177,2179,2181,
2185,2186,2188,2190,2192,2194,2196,2197,2200,2202,2204,2205,2208,2209,2211,2213,
2216,2218,2220,2222,2223,2226,2227,2230,2232,2234,2236,2238,2239,2242,2243,2246,
2249,2251,2253,2255,2256,2259,2260,2263,2265,2267,2269,2271,2272,2275,2276,2279,
2281,2283,2285,2287,2288,2291,2292,2295,2297,2299,2301,2303,2304,2307,2308,2311,
2315,2317,2319,2321,2322,2325,2326,2329,2331,2333,2335,2337,2338,2341,2342,2345,
2348,2350,2352,2354,2355,2358,2359,2362,2364,2366,2368,2370,2371,2374,2375,2378,
2382,2384,2386,2388,2389,2392,2393,2396,2398,2400,2402,2404,2407,2410,2411,2414,
2417,2419,2421,2423,2424,2427,2428,2431,2433,2435,2437,2439,2442,2445,2446,2449,
2452,2454,2456,2458,2459,2462,2463,2466,2468,2470,2472,2474,2477,2480,2481,2484,
2488,2490,2492,2494,2495,2498,2499,2502,2504,2506,2508,2510,2513,2516,2517,2520,
2524,2526,2528,2530,2531,2534,2535,2538,2540,2542,2544,2546,2549,2552,2553,2556,
2561,2563,2565,2567,2568,2571,2572,2575,2577,2579,2581,2583,2586,2589,2590,2593
};


        /*
            Noise LFO waveform.
            Here are just 256 samples out of much longer data.
            It does NOT repeat every 256 samples on real chip and I wasnt able to find
            the point where it repeats (even in strings as long as 131072 samples).
            I only put it here because its better than nothing and perhaps
            someone might be able to figure out the real algorithm.
            Note that (due to the way the LFO output is calculated) it is quite
            possible that two values: 0x80 and 0x00 might be wrong in this table.
            To be exact:
                some 0x80 could be 0x81 as well as some 0x00 could be 0x01.
        */

        private static readonly byte[] lfo_noise_waveform = new byte[256] {
0xFF,0xEE,0xD3,0x80,0x58,0xDA,0x7F,0x94,0x9E,0xE3,0xFA,0x00,0x4D,0xFA,0xFF,0x6A,
0x7A,0xDE,0x49,0xF6,0x00,0x33,0xBB,0x63,0x91,0x60,0x51,0xFF,0x00,0xD8,0x7F,0xDE,
0xDC,0x73,0x21,0x85,0xB2,0x9C,0x5D,0x24,0xCD,0x91,0x9E,0x76,0x7F,0x20,0xFB,0xF3,
0x00,0xA6,0x3E,0x42,0x27,0x69,0xAE,0x33,0x45,0x44,0x11,0x41,0x72,0x73,0xDF,0xA2,

0x32,0xBD,0x7E,0xA8,0x13,0xEB,0xD3,0x15,0xDD,0xFB,0xC9,0x9D,0x61,0x2F,0xBE,0x9D,
0x23,0x65,0x51,0x6A,0x84,0xF9,0xC9,0xD7,0x23,0xBF,0x65,0x19,0xDC,0x03,0xF3,0x24,
0x33,0xB6,0x1E,0x57,0x5C,0xAC,0x25,0x89,0x4D,0xC5,0x9C,0x99,0x15,0x07,0xCF,0xBA,
0xC5,0x9B,0x15,0x4D,0x8D,0x2A,0x1E,0x1F,0xEA,0x2B,0x2F,0x64,0xA9,0x50,0x3D,0xAB,

0x50,0x77,0xE9,0xC0,0xAC,0x6D,0x3F,0xCA,0xCF,0x71,0x7D,0x80,0xA6,0xFD,0xFF,0xB5,
0xBD,0x6F,0x24,0x7B,0x00,0x99,0x5D,0xB1,0x48,0xB0,0x28,0x7F,0x80,0xEC,0xBF,0x6F,
0x6E,0x39,0x90,0x42,0xD9,0x4E,0x2E,0x12,0x66,0xC8,0xCF,0x3B,0x3F,0x10,0x7D,0x79,
0x00,0xD3,0x1F,0x21,0x93,0x34,0xD7,0x19,0x22,0xA2,0x08,0x20,0xB9,0xB9,0xEF,0x51,

0x99,0xDE,0xBF,0xD4,0x09,0x75,0xE9,0x8A,0xEE,0xFD,0xE4,0x4E,0x30,0x17,0xDF,0xCE,
0x11,0xB2,0x28,0x35,0xC2,0x7C,0x64,0xEB,0x91,0x5F,0x32,0x0C,0x6E,0x00,0xF9,0x92,
0x19,0xDB,0x8F,0xAB,0xAE,0xD6,0x12,0xC4,0x26,0x62,0xCE,0xCC,0x0A,0x03,0xE7,0xDD,
0xE2,0x4D,0x8A,0xA6,0x46,0x95,0x0F,0x8F,0xF5,0x15,0x97,0x32,0xD4,0x28,0x1E,0x55
};




        /* save output as raw 16-bit sample */
        /* #define SAVE_SAMPLE */
        /* #define SAVE_SEPARATE_CHANNELS */
        //#if defined SAVE_SAMPLE || defined SAVE_SEPARATE_CHANNELS
        //static FILE *sample[9];
        //#endif

        public static void init_tables()
        {
            Int16 i, x, n;
            double o, m;

            for (x = 0; x < TL_RES_LEN; x++)
            {
                m = (1 << 16) / Math.Pow(2, (x + 1) * (ENV_STEP / 4.0) / 8.0);
                m = Math.Floor(m);

                /* we never reach (1<<16) here due to the (x+1) */
                /* result fits within 16 bits at maximum */

                n = (Int16)m;     /* 16 bits here */
                n >>= 4;        /* 12 bits here */
                if ((n & 1) == 1)      /* round to closest */
                    n = (Int16)((n >> 1) + 1);
                else
                    n = (Int16)(n >> 1);
                /* 11 bits here (rounded) */
                n <<= 2;        /* 13 bits here (as in real chip) */
                tl_tab[x * 2 + 0] = n;
                tl_tab[x * 2 + 1] = (Int16)(-tl_tab[x * 2 + 0]);

                for (i = 1; i < 13; i++)
                {
                    tl_tab[x * 2 + 0 + i * 2 * TL_RES_LEN] = (Int16)(tl_tab[x * 2 + 0] >> i);
                    tl_tab[x * 2 + 1 + i * 2 * TL_RES_LEN] = (Int16)(-tl_tab[x * 2 + 0 + i * 2 * TL_RES_LEN]);
                }
                //#if 0
                //		logerror("tl %04i", x*2);
                //		for (i=0; i<13; i++)
                //			logerror(", [%02i] %4i", i*2, tl_tab[ x*2 /*+1*/ + i*2*TL_RES_LEN ]);
                //		logerror("\n");
                //#endif
            }
            /*logerror("TL_TAB_LEN = %i (%i bytes)\n",TL_TAB_LEN, (int)sizeof(tl_tab));*/
            /*logerror("ENV_QUIET= %i\n",ENV_QUIET );*/


            for (i = 0; i < SIN_LEN; i++)
            {
                /* non-standard sinus */
                m = Math.Sin(((i * 2) + 1) * Math.PI / SIN_LEN); /* verified on the real chip */

                /* we never reach zero here due to ((i*2)+1) */

                if (m > 0.0)
                    o = 8 * Math.Log(1.0 / m) / Math.Log(2.0);    /* convert to 'decibels' */
                else
                    o = 8 * Math.Log(-1.0 / m) / Math.Log(2.0);   /* convert to 'decibels' */

                o = o / (ENV_STEP / 4);

                n = (Int16)(2.0 * o);
                if ((n & 1) == 1)                      /* round to closest */
                    n = (Int16)((n >> 1) + 1);
                else
                    n = (Int16)(n >> 1);

                sin_tab[i] = (Int16)(n * 2 + (m >= 0.0 ? 0 : 1));
                /*logerror("sin [0x%4x]= %4i (tl_tab value=%8x)\n", i, sin_tab[i],tl_tab[sin_tab[i]]);*/
            }


            /* calculate d1l_tab table */
            for (i = 0; i < 16; i++)
            {
                m = (i != 15 ? i : i + 16) * (4.0 / ENV_STEP);   /* every 3 'dB' except for all bits = 1 = 45+48 'dB' */
                d1l_tab[i] = (UInt16)m;
                /*logerror("d1l_tab[%02x]=%08x\n",i,d1l_tab[i] );*/
            }

            //# ifdef SAVE_SAMPLE
            //            sample[8] = fopen("sampsum.pcm", "wb");
            //#endif
            //# ifdef SAVE_SEPARATE_CHANNELS
            //            sample[0] = fopen("samp0.pcm", "wb");
            //            sample[1] = fopen("samp1.pcm", "wb");
            //            sample[2] = fopen("samp2.pcm", "wb");
            //            sample[3] = fopen("samp3.pcm", "wb");
            //            sample[4] = fopen("samp4.pcm", "wb");
            //            sample[5] = fopen("samp5.pcm", "wb");
            //            sample[6] = fopen("samp6.pcm", "wb");
            //            sample[7] = fopen("samp7.pcm", "wb");
            //#endif
        }


        public static void init_chip_tables(YM2151 chip)
        {
            int i, j;
            double mult, phaseinc, Hz;
            double scaler;

            scaler = ((double)chip.clock / 64.0) / ((double)chip.sampfreq);
            if (Math.Abs(scaler - 1.0) < 0.0000001) scaler = 1.0;
            /*logerror("scaler    = %20.15f\n", scaler);*/


            /* this loop calculates Hertz values for notes from c-0 to b-7 */
            /* including 64 'cents' (100/64 that is 1.5625 of real cent) per note */
            /* i*100/64/1200 is equal to i/768 */

            /* real chip works with 10 bits fixed point values (10.10) */
            mult = (1 << (FREQ_SH - 10)); /* -10 because phaseinc_rom table values are already in 10.10 format */

            for (i = 0; i < 768; i++)
            {
                /* 3.4375 Hz is note A; C# is 4 semitones higher */
                Hz = 1000;
                //#if 0
                ///* Hz is close, but not perfect */
                //		//Hz = scaler * 3.4375 * pow (2, (i + 4 * 64 ) / 768.0 );
                //		/* calculate phase increment */
                //		phaseinc = (Hz*SIN_LEN) / (double)chip->sampfreq;
                //#endif

                phaseinc = phaseinc_rom[i]; /* real chip phase increment */
                phaseinc *= scaler;         /* adjust */


                /* octave 2 - reference octave */
                chip.freq[768 + 2 * 768 + i] = ((UInt32)(phaseinc * mult)) & 0xffffffc0; /* adjust to X.10 fixed point */
                /* octave 0 and octave 1 */
                for (j = 0; j < 2; j++)
                {
                    chip.freq[768 + j * 768 + i] = (chip.freq[768 + 2 * 768 + i] >> (2 - j)) & 0xffffffc0; /* adjust to X.10 fixed point */
                }
                /* octave 3 to 7 */
                for (j = 3; j < 8; j++)
                {
                    chip.freq[768 + j * 768 + i] = chip.freq[768 + 2 * 768 + i] << (j - 2);
                }
            }

            /* octave -1 (all equal to: oct 0, _KC_00_, _KF_00_) */
            for (i = 0; i < 768; i++)
            {
                chip.freq[0 * 768 + i] = chip.freq[1 * 768 + 0];
            }

            /* octave 8 and 9 (all equal to: oct 7, _KC_14_, _KF_63_) */
            for (j = 8; j < 10; j++)
            {
                for (i = 0; i < 768; i++)
                {
                    chip.freq[768 + j * 768 + i] = chip.freq[768 + 8 * 768 - 1];
                }
            }

            mult = (1 << FREQ_SH);
            for (j = 0; j < 4; j++)
            {
                for (i = 0; i < 32; i++)
                {
                    Hz = ((double)dt1_tab[j * 32 + i] * ((double)chip.clock / 64.0)) / (double)(1 << 20);

                    /*calculate phase increment*/
                    phaseinc = (Hz * SIN_LEN) / (double)chip.sampfreq;

                    /*positive and negative values*/
                    chip.dt1_freq[(j + 0) * 32 + i] = (Int32)(phaseinc * mult);
                    chip.dt1_freq[(j + 4) * 32 + i] = -chip.dt1_freq[(j + 0) * 32 + i];

                    //#if 0
                    //			{
                    //				int x = j*32 + i;
                    //				pom = (double)chip->dt1_freq[x] / mult;
                    //				pom = pom * (double)chip->sampfreq / (double)SIN_LEN;
                    //				logerror("DT1(%03i)[%02i %02i][%08x]= real %19.15f Hz  emul %19.15f Hz\n",
                    //						 x, j, i, chip->dt1_freq[x], Hz, pom);
                    //			}
                    //#endif
                }
            }


            /* calculate noise periods table */
            scaler = ((double)chip.clock / 64.0) / ((double)chip.sampfreq);
            if (Math.Abs(scaler - 1.0) < 0.0000001) scaler = 1.0;
            for (i = 0; i < 32; i++)
            {
                j = (i != 31 ? i : 30);             /* rate 30 and 31 are the same */
                j = 32 - j;
                j = (Int32)(65536.0 / (double)(j * 32.0)); /* number of samples per one shift of the shift register */
                /*chip->noise_tab[i] = j * 64;*/    /* number of chip clock cycles per one shift */
                chip.noise_tab[i] = (UInt32)(j * 64 * scaler);
                /*logerror("noise_tab[%02x]=%08x\n", i, chip->noise_tab[i]);*/
            }
        }

        static void KEY_ON(YM2151 PSG, YM2151Operator op, uint key_set)
        {
            if (op.key == 0)
            {
                op.phase = 0;           /* clear phase */
                op.state = EG_ATT;      /* KEY ON = attack */
                op.volume += (~op.volume *
                               (eg_inc[op.eg_sel_ar + ((PSG.eg_cnt >> op.eg_sh_ar) & 7)])
                              ) >> 4;
                if (op.volume <= MIN_ATT_INDEX)
                {
                    op.volume = MIN_ATT_INDEX;
                    op.state = EG_DEC;
                }
            }
            op.key |= key_set;
        }

        static void KEY_OFF(YM2151Operator op, uint key_clr)
        {
            if (op.key != 0)
            {
                op.key &= key_clr;
                if (op.key == 0)
                {
                    if (op.state > EG_REL)
                        op.state = EG_REL;/* KEY OFF = release */
                }
            }
        }

        static void envelope_KONKOFF(YM2151 PSG, int op, Int16 v)
        {
            if ((v & 0x08) != 0)   /* M1 */
                KEY_ON(PSG, PSG.oper[op + 0], 1);
            else
                KEY_OFF(PSG.oper[op + 0], ~(UInt32)1);

            if ((v & 0x20) != 0)   /* M2 */
                KEY_ON(PSG, PSG.oper[op + 1], 1);
            else
                KEY_OFF(PSG.oper[op + 1], ~(UInt32)1);

            if ((v & 0x10) != 0)   /* C1 */
                KEY_ON(PSG, PSG.oper[op + 2], 1);
            else
                KEY_OFF(PSG.oper[op + 2], ~(UInt32)1);

            if ((v & 0x40) != 0)   /* C2 */
                KEY_ON(PSG, PSG.oper[op + 3], 1);
            else
                KEY_OFF(PSG.oper[op + 3], ~(UInt32)1);
        }

        static void set_connect(YM2151 PSG, byte om1_index, int cha, int v)
        {
            YM2151Operator om1 = PSG.oper[om1_index];
            YM2151Operator om2 = PSG.oper[om1_index + 1];
            YM2151Operator oc1 = PSG.oper[om1_index + 2];

            /* set connect algorithm */

            /* MEM is simply one sample delay */

            switch (v & 7)
            {
                case 0:
                    /* M1---C1---MEM---M2---C2---OUT */
                    om1.connect = PSG.c1;
                    oc1.connect = PSG.mem;
                    om2.connect = PSG.c2;
                    om1.mem_connect = PSG.m2;
                    break;

                case 1:
                    /* M1------+-MEM---M2---C2---OUT */
                    /*      C1-+                     */
                    om1.connect = PSG.mem;
                    oc1.connect = PSG.mem;
                    om2.connect = PSG.c2;
                    om1.mem_connect = PSG.m2;
                    break;

                case 2:
                    /* M1-----------------+-C2---OUT */
                    /*      C1---MEM---M2-+          */
                    om1.connect = PSG.c2;
                    oc1.connect = PSG.mem;
                    om2.connect = PSG.c2;
                    om1.mem_connect = PSG.m2;
                    break;

                case 3:
                    /* M1---C1---MEM------+-C2---OUT */
                    /*                 M2-+          */
                    om1.connect = PSG.c1;
                    oc1.connect = PSG.mem;
                    om2.connect = PSG.c2;
                    om1.mem_connect = PSG.c2;
                    break;

                case 4:
                    /* M1---C1-+-OUT */
                    /* M2---C2-+     */
                    /* MEM: not used */
                    om1.connect = PSG.c1;
                    oc1.connect = PSG.chanout[cha];
                    om2.connect = PSG.c2;
                    om1.mem_connect = PSG.mem;   /* store it anywhere where it will not be used */
                    break;

                case 5:
                    /*    +----C1----+     */
                    /* M1-+-MEM---M2-+-OUT */
                    /*    +----C2----+     */
                    om1.connect = null;   /* special mark */
                    oc1.connect = PSG.chanout[cha];
                    om2.connect = PSG.chanout[cha];
                    om1.mem_connect = PSG.m2;
                    break;

                case 6:
                    /* M1---C1-+     */
                    /*      M2-+-OUT */
                    /*      C2-+     */
                    /* MEM: not used */
                    om1.connect = PSG.c1;
                    oc1.connect = PSG.chanout[cha];
                    om2.connect = PSG.chanout[cha];
                    om1.mem_connect = PSG.mem;   /* store it anywhere where it will not be used */
                    break;

                case 7:
                    /* M1-+     */
                    /* C1-+-OUT */
                    /* M2-+     */
                    /* C2-+     */
                    /* MEM: not used*/
                    om1.connect = PSG.chanout[cha];
                    oc1.connect = PSG.chanout[cha];
                    om2.connect = PSG.chanout[cha];
                    om1.mem_connect = PSG.mem;   /* store it anywhere where it will not be used */
                    break;
            }
        }


        private static void refresh_EG(YM2151 chip, byte opaddr)
        {
            YM2151Operator op = chip.oper[opaddr];

            UInt32 kc;
            UInt32 v;

            kc = op.kc;

            /* v = 32 + 2*RATE + RKS = max 126 */

            v = kc >> (int)op.ks;
            if ((op.ar + v) < 32 + 62)
            {
                op.eg_sh_ar = eg_rate_shift[op.ar + v];
                op.eg_sel_ar = eg_rate_select[op.ar + v];
            }
            else
            {
                op.eg_sh_ar = 0;
                op.eg_sel_ar = 17 * RATE_STEPS;
            }
            op.eg_sh_d1r = eg_rate_shift[op.d1r + v];
            op.eg_sel_d1r = eg_rate_select[op.d1r + v];
            op.eg_sh_d2r = eg_rate_shift[op.d2r + v];
            op.eg_sel_d2r = eg_rate_select[op.d2r + v];
            op.eg_sh_rr = eg_rate_shift[op.rr + v];
            op.eg_sel_rr = eg_rate_select[op.rr + v];

            opaddr++;
            op = chip.oper[opaddr];

            v = kc >> (int)op.ks;
            if ((op.ar + v) < 32 + 62)
            {
                op.eg_sh_ar = eg_rate_shift[op.ar + v];
                op.eg_sel_ar = eg_rate_select[op.ar + v];
            }
            else
            {
                op.eg_sh_ar = 0;
                op.eg_sel_ar = 17 * RATE_STEPS;
            }
            op.eg_sh_d1r = eg_rate_shift[op.d1r + v];
            op.eg_sel_d1r = eg_rate_select[op.d1r + v];
            op.eg_sh_d2r = eg_rate_shift[op.d2r + v];
            op.eg_sel_d2r = eg_rate_select[op.d2r + v];
            op.eg_sh_rr = eg_rate_shift[op.rr + v];
            op.eg_sel_rr = eg_rate_select[op.rr + v];

            opaddr++;
            op = chip.oper[opaddr];

            v = kc >> (int)op.ks;
            if ((op.ar + v) < 32 + 62)
            {
                op.eg_sh_ar = eg_rate_shift[op.ar + v];
                op.eg_sel_ar = eg_rate_select[op.ar + v];
            }
            else
            {
                op.eg_sh_ar = 0;
                op.eg_sel_ar = 17 * RATE_STEPS;
            }
            op.eg_sh_d1r = eg_rate_shift[op.d1r + v];
            op.eg_sel_d1r = eg_rate_select[op.d1r + v];
            op.eg_sh_d2r = eg_rate_shift[op.d2r + v];
            op.eg_sel_d2r = eg_rate_select[op.d2r + v];
            op.eg_sh_rr = eg_rate_shift[op.rr + v];
            op.eg_sel_rr = eg_rate_select[op.rr + v];

            opaddr++;
            op = chip.oper[opaddr];

            v = kc >> (int)op.ks;
            if ((op.ar + v) < 32 + 62)
            {
                op.eg_sh_ar = eg_rate_shift[op.ar + v];
                op.eg_sel_ar = eg_rate_select[op.ar + v];
            }
            else
            {
                op.eg_sh_ar = 0;
                op.eg_sel_ar = 17 * RATE_STEPS;
            }
            op.eg_sh_d1r = eg_rate_shift[op.d1r + v];
            op.eg_sel_d1r = eg_rate_select[op.d1r + v];
            op.eg_sh_d2r = eg_rate_shift[op.d2r + v];
            op.eg_sel_d2r = eg_rate_select[op.d2r + v];
            op.eg_sh_rr = eg_rate_shift[op.rr + v];
            op.eg_sel_rr = eg_rate_select[op.rr + v];
        }


        /* write a register on YM2151 chip number 'n' */
        public static void ym2151_write_reg(YM2151 chip, byte r, byte v)
        {
            //Konvertálni refrenciáról tömb indexre, és mindenhol előszedni a referenciát a tömbből.
            int opaddr = (r & 0x07) * 4 + ((r & 0x18) >> 3);
            YM2151Operator op = chip.oper[opaddr];

            /* adjust bus to 8 bits */
            r &= 0xff;
            v &= 0xff;

            //#if 0
            //	/* There is no info on what YM2151 really does when busy flag is set */
            //	if ( chip->status & 0x80 ) return;
            //	timer_set ( attotime::from_hz(chip->clock) * 64, chip, 0, timer_callback_chip_busy);
            //	chip->status |= 0x80;	/* set busy flag for 64 chip clock cycles */
            //#endif


            switch (r & 0xe0)
            {
                case 0x00:
                    switch (r)
                    {
                        case 0x01:  /* LFO reset(bit 1), Test Register (other bits) */
                            chip.test = v;
                            if ((v & 2) != 0) chip.lfo_phase = 0;
                            break;

                        case 0x08:
                            envelope_KONKOFF(chip, (v & 7) * 4, v);
                            break;

                        case 0x0f:  /* noise mode enable, noise period */
                            chip.noise = v;
                            chip.noise_f = chip.noise_tab[v & 0x1f];
                            break;

                        case 0x10:  /* timer A hi */
                            break;

                        case 0x11:  /* timer A low */
                            break;

                        case 0x12:  /* timer B */
                            break;

                        case 0x14:  /* CSM, irq flag reset, irq enable, timer start/stop */

                            chip.irq_enable = v;   /* bit 3-timer B, bit 2-timer A, bit 7 - CSM */
                            break;

                        case 0x18:  /* LFO frequency */
                            {
                                chip.lfo_overflow = (UInt32)(1 << (byte)((byte)(15 - (byte)(v >> 4)) + 3)) * (UInt32)(1 << LFO_SH);
                                chip.lfo_counter_add = 0x10 + (UInt32)(v & 0x0f);
                            }
                            break;

                        case 0x19:  /* PMD (bit 7==1) or AMD (bit 7==0) */
                            if ((v & 0x80) != 0)
                                chip.pmd = (sbyte)(v & 0x7f);
                            else
                                chip.amd = (byte)(v & 0x7f);
                            break;

                        case 0x1b:  /* CT2, CT1, LFO waveform */
                            chip.ct = (byte)(v >> 6);
                            chip.lfo_wsel = (byte)(v & 3);
                            break;

                        default:
                            /*logerror("YM2151 Write %02x to undocumented register #%02x\n",v,r);*/
                            break;
                    }
                    break;

                case 0x20:
                    op = chip.oper[(r & 7) * 4];
                    switch (r & 0x18)
                    {
                        case 0x00:  /* RL enable, Feedback, Connection */
                            op.fb_shift = ((byte)(v >> 3) & 7) != 0 ? (UInt32)((byte)(v >> 3) & 7) + 6 : 0;
                            chip.pan[(r & 7) * 2] = (v & 0x40) != 0 ? ~(UInt32)0 : 0;
                            chip.pan[(r & 7) * 2 + 1] = (v & 0x80) != 0 ? ~(UInt32)0 : 0;
                            chip.connect[r & 7] = (byte)(v & 7);
                            set_connect(chip, (byte)opaddr, r & 7, v & 7);
                            break;

                        case 0x08:  /* Key Code */
                            v &= 0x7f;
                            if (v != (Int16)(op.kc))
                            {
                                UInt32 kc, kc_channel;

                                kc_channel = (UInt32)(v - (byte)(v >> 2)) * 64;
                                kc_channel += 768;
                                kc_channel |= (op.kc_i & 63);

                                op = chip.oper[opaddr];
                                op.kc = v;
                                op.kc_i = kc_channel;
                                op = chip.oper[opaddr + 1];
                                op.kc = v;
                                op.kc_i = kc_channel;
                                op = chip.oper[opaddr + 2];
                                op.kc = v;
                                op.kc_i = kc_channel;
                                op = chip.oper[opaddr + 3];
                                op.kc = v;
                                op.kc_i = kc_channel;

                                kc = (byte)(v >> 2);

                                op = chip.oper[opaddr];
                                op.dt1 = chip.dt1_freq[op.dt1_i + kc];
                                op.freq = (UInt32)((chip.freq[kc_channel + op.dt2] + op.dt1) * op.mul) >> 1;

                                op = chip.oper[opaddr + 1];
                                op.dt1 = chip.dt1_freq[op.dt1_i + kc];
                                op.freq = (UInt32)((chip.freq[kc_channel + op.dt2] + op.dt1) * op.mul) >> 1;

                                op = chip.oper[opaddr + 2];
                                op.dt1 = chip.dt1_freq[op.dt1_i + kc];
                                op.freq = (UInt32)((chip.freq[kc_channel + op.dt2] + op.dt1) * op.mul) >> 1;

                                op = chip.oper[opaddr + 3];
                                op.dt1 = chip.dt1_freq[op.dt1_i + kc];
                                op.freq = (UInt32)((chip.freq[kc_channel + op.dt2] + op.dt1) * op.mul) >> 1;

                                refresh_EG(chip, (byte)opaddr);
                            }
                            break;

                        case 0x10:  /* Key Fraction */
                            v >>= 2;
                            if (v != (Int16)(op.kc_i & 63))
                            {
                                UInt32 kc_channel;

                                kc_channel = v;
                                kc_channel |= (op.kc_i & ~(UInt32)63);

                                op = chip.oper[opaddr];
                                op.kc_i = kc_channel;
                                op.freq = (UInt32)((chip.freq[kc_channel + op.dt2] + op.dt1) * op.mul) >> 1;

                                op = chip.oper[opaddr + 1];
                                op.kc_i = kc_channel;
                                op.freq = (UInt32)((chip.freq[kc_channel + op.dt2] + op.dt1) * op.mul) >> 1;

                                op = chip.oper[opaddr + 2];
                                op.kc_i = kc_channel;
                                op.freq = (UInt32)((chip.freq[kc_channel + op.dt2] + op.dt1) * op.mul) >> 1;

                                op = chip.oper[opaddr + 3];
                                op.kc_i = kc_channel;
                                op.freq = (UInt32)((chip.freq[kc_channel + op.dt2] + op.dt1) * op.mul) >> 1;

                            }
                            break;

                        case 0x18:  /* PMS, AMS */
                            op.pms = (UInt32)(v >> 4) & 7;
                            op.ams = (UInt32)(v & 3);
                            break;
                    }
                    break;

                case 0x40:      /* DT1, MUL */
                    {
                        UInt32 olddt1_i = op.dt1_i;
                        UInt32 oldmul = op.mul;

                        op.dt1_i = (UInt32)(v & 0x70) << 1;
                        op.mul = (v & 0x0f) != 0 ? (UInt32)(v & 0x0f) << 1 : 1;

                        if (olddt1_i != op.dt1_i)
                            op.dt1 = chip.dt1_freq[op.dt1_i + (op.kc >> 2)];

                        if ((olddt1_i != op.dt1_i) || (oldmul != op.mul))
                            op.freq = (UInt32)((chip.freq[op.kc_i + op.dt2] + op.dt1) * op.mul) >> 1;
                    }
                    break;

                case 0x60:      /* TL */
                    op.tl = (UInt32)(v & 0x7f) << (ENV_BITS - 7); /* 7bit TL */
                    break;

                case 0x80:      /* KS, AR */
                    {
                        UInt32 oldks = op.ks;
                        UInt32 oldar = op.ar;

                        op.ks = 5 - (UInt32)(v >> 6);
                        op.ar = (v & 0x1f) != 0 ? 32 + (UInt32)((v & 0x1f) << 1) : 0;

                        if ((op.ar != oldar) || (op.ks != oldks))
                        {
                            if ((op.ar + (op.kc >> (int)op.ks)) < 32 + 62)
                            {
                                op.eg_sh_ar = eg_rate_shift[op.ar + (op.kc >> (int)op.ks)];
                                op.eg_sel_ar = eg_rate_select[op.ar + (op.kc >> (int)op.ks)];
                            }
                            else
                            {
                                op.eg_sh_ar = 0;
                                op.eg_sel_ar = 17 * RATE_STEPS;
                            }
                        }

                        if (op.ks != oldks)
                        {
                            op.eg_sh_d1r = eg_rate_shift[op.d1r + (op.kc >> (int)op.ks)];
                            op.eg_sel_d1r = eg_rate_select[op.d1r + (op.kc >> (int)op.ks)];
                            op.eg_sh_d2r = eg_rate_shift[op.d2r + (op.kc >> (int)op.ks)];
                            op.eg_sel_d2r = eg_rate_select[op.d2r + (op.kc >> (int)op.ks)];
                            op.eg_sh_rr = eg_rate_shift[op.rr + (op.kc >> (int)op.ks)];
                            op.eg_sel_rr = eg_rate_select[op.rr + (op.kc >> (int)op.ks)];
                        }
                    }
                    break;

                case 0xa0:      /* LFO AM enable, D1R */
                    op.AMmask = (v & 0x80) != 0 ? ~(UInt32)0 : 0;
                    op.d1r = (v & 0x1f) != 0 ? 32 + (UInt32)((v & 0x1f) << 1) : 0;
                    op.eg_sh_d1r = eg_rate_shift[op.d1r + (op.kc >> (int)op.ks)];
                    op.eg_sel_d1r = eg_rate_select[op.d1r + (op.kc >> (int)op.ks)];
                    break;

                case 0xc0:      /* DT2, D2R */
                    {
                        UInt32 olddt2 = op.dt2;
                        op.dt2 = dt2_tab[v >> 6];
                        if (op.dt2 != olddt2)
                            op.freq = (UInt32)((chip.freq[op.kc_i + op.dt2] + op.dt1) * op.mul) >> 1;
                    }
                    op.d2r = (v & 0x1f) != 0 ? 32 + (UInt32)((v & 0x1f) << 1) : 0;
                    op.eg_sh_d2r = eg_rate_shift[op.d2r + (op.kc >> (int)op.ks)];
                    op.eg_sel_d2r = eg_rate_select[op.d2r + (op.kc >> (int)op.ks)];
                    break;

                case 0xe0:      /* D1L, RR */
                    op.d1l = d1l_tab[v >> 4];
                    op.rr = 34 + (UInt32)((v & 0x0f) << 2);
                    op.eg_sh_rr = eg_rate_shift[op.rr + (op.kc >> (int)op.ks)];
                    op.eg_sel_rr = eg_rate_select[op.rr + (op.kc >> (int)op.ks)];
                    break;
            }
        }


        /*
        *   Initialize YM2151 emulator(s).
        *
        *   'num' is the number of virtual YM2151's to allocate
        *   'clock' is the chip clock in Hz
        *   'rate' is sampling rate
        */
        public static YM2151 ym2151_init(int clock, int rate)
        {
            YM2151 PSG = new YM2151();
            //PSG = (YM2151*)malloc(sizeof(YM2151));
            //memset(PSG, 0, sizeof(YM2151));

            init_tables();

            PSG.clock = (UInt16)clock;
            /*rate = clock/64;*/
            PSG.sampfreq = (rate > 0) ? (UInt16)rate : (UInt16)44100;    /* avoid division by 0 in init_chip_tables() */
            init_chip_tables(PSG);

            PSG.lfo_timer_add = (UInt32)((1 << (int)LFO_SH) * (clock / 64.0) / PSG.sampfreq);

            PSG.eg_timer_add = (UInt32)((1 << EG_SH) * (clock / 64.0) / PSG.sampfreq);
            PSG.eg_timer_overflow = (3) * (1 << EG_SH);
            /*logerror("YM2151[init] eg_timer_add=%8x eg_timer_overflow=%8x\n", PSG->eg_timer_add, PSG->eg_timer_overflow);*/

            ym2151_reset_chip(PSG);
            /*logerror("YM2151[init] clock=%i sampfreq=%i\n", PSG->clock, PSG->sampfreq);*/

            return PSG;
        }



        //        void ym2151_shutdown(void* _chip)
        //        {
        //            YM2151* chip = (YM2151*)_chip;

        //            free(chip);

        //# ifdef SAVE_SAMPLE
        //            fclose(sample[8]);
        //#endif
        //# ifdef SAVE_SEPARATE_CHANNELS
        //            fclose(sample[0]);
        //            fclose(sample[1]);
        //            fclose(sample[2]);
        //            fclose(sample[3]);
        //            fclose(sample[4]);
        //            fclose(sample[5]);
        //            fclose(sample[6]);
        //            fclose(sample[7]);
        //#endif
        //        }



        /*
        *   Reset chip number 'n'.
        */
        public static void ym2151_reset_chip(YM2151 chip)
        {
            /* initialize hardware registers */
            for (int i = 0; i < 32; i++)
            {
                chip.oper[i] = new YM2151Operator();
                chip.oper[i].volume = MAX_ATT_INDEX;
                chip.oper[i].kc_i = 768; /* min kc_i value */
            }

            chip.eg_timer = 0;
            chip.eg_cnt = 0;

            chip.lfo_timer = 0;
            chip.lfo_counter = 0;
            chip.lfo_phase = 0;
            chip.lfo_wsel = 0;
            chip.pmd = 0;
            chip.amd = 0;
            chip.lfa = 0;
            chip.lfp = 0;

            chip.test = 0;

            chip.irq_enable = 0;

            chip.noise = 0;
            chip.noise_rng = 0;
            chip.noise_p = 0;
            chip.noise_f = chip.noise_tab[0];

            chip.csm_req = 0;
            chip.status = 0;

            ym2151_write_reg(chip, 0x1b, 0);    /* only because of CT1, CT2 output pins */
            ym2151_write_reg(chip, 0x18, 0);    /* set LFO frequency */
            for (int i = 0x20; i < 0x100; i++)      /* set the operators */
            {
                ym2151_write_reg(chip, (byte)i, 0);
            }
        }

        private static Int16 op_calc(YM2151Operator OP, UInt16 env, Int16 pm)
        {
            int p;
            p = (env << 3) + sin_tab[(((UInt16)((OP.phase & ~FREQ_MASK) + (pm << 15))) >> FREQ_SH) & SIN_MASK];

            if (p >= TL_TAB_LEN)
                return 0;

            return tl_tab[p];
        }

        private static Int16 op_calc1(YM2151Operator OP, UInt16 env, Int16 pm)
        {
            int p;
            int i;

            i = (UInt16)(OP.phase & ~FREQ_MASK) + pm;

            /*logerror("i=%08x (i>>16)&511=%8i phase=%i [pm=%08x] ",i, (i>>16)&511, OP->phase>>FREQ_SH, pm);*/

            p = (env << 3) + sin_tab[(i >> FREQ_SH) & SIN_MASK];

            /*logerror("(p&255=%i p>>8=%i) out= %i\n", p&255,p>>8, tl_tab[p&255]>>(p>>8) );*/

            if (p >= TL_TAB_LEN)
                return 0;

            return tl_tab[p];
        }

        private static UInt16 volume_calc(YM2151Operator OP, ref UInt32 AM) { return (UInt16)(OP.tl + ((UInt32)OP.volume) + (AM & (OP.AMmask))); }

        private static void chan_calc(YM2151 PSG, UInt16 chan)
        {
            YM2151Operator op;
            UInt16 env;
            UInt32 AM = 0;

            PSG.m2.value = PSG.c1.value = PSG.c2.value = PSG.mem.value = 0;
            int opaddr = chan * 4;

            op = PSG.oper[opaddr];  /* M1 */

            op.mem_connect.value = (Int16)op.mem_value;   /* restore delayed sample (MEM) value to m2 or c2 */

            if (op.ams != 0)
                AM = PSG.lfa << (int)(op.ams - 1);

            env = volume_calc(op, ref AM);
            {
                Int32 out_ = op.fb_out_prev + op.fb_out_curr;
                op.fb_out_prev = op.fb_out_curr;

                if (op.connect.value == 0)
                    /* algorithm 5 */
                    PSG.mem.value = PSG.c1.value = PSG.c2.value = (Int16)op.fb_out_prev;
                else
                    /* other algorithms */
                    op.connect.value = (Int16)op.fb_out_prev;

                op.fb_out_curr = 0;
                if (env < ENV_QUIET)
                {
                    if (op.fb_shift == 0)
                        out_ = 0;
                    op.fb_out_curr = op_calc1(op, env, (Int16)(out_ << (int)op.fb_shift));
                }
            }

            op = PSG.oper[opaddr + 1];      /* M2 */
            env = volume_calc(op, ref AM);
            if (env < ENV_QUIET)
                op.connect.value += op_calc(op, env, PSG.m2.value);

            op = PSG.oper[opaddr + 2];      /* C1 */
            env = volume_calc(op, ref AM);
            if (env < ENV_QUIET)
                op.connect.value += op_calc(op, env, PSG.c1.value);

            op = PSG.oper[opaddr + 3];      /* C2 */
            env = volume_calc(op, ref AM);
            if (env < ENV_QUIET)
                PSG.chanout[chan].value += op_calc(op, env, PSG.c2.value);

            /* M1 */
            op.mem_value = PSG.mem.value;
        }

        private static void chan7_calc(YM2151 PSG)
        {
            YM2151Operator op;
            UInt16 env;
            UInt32 AM = 0;

            PSG.m2.value = PSG.c1.value = PSG.c2.value = PSG.mem.value = 0;

            int opaddr = 7 * 4;
            op = PSG.oper[opaddr];  /* M1 */

            op.mem_connect.value = (Int16)op.mem_value;   /* restore delayed sample (MEM) value to m2 or c2 */

            if (op.ams != 0)
                AM = PSG.lfa << (int)(op.ams - 1);

            env = volume_calc(op, ref AM);
            {
                Int32 out_ = op.fb_out_prev + op.fb_out_curr;
                op.fb_out_prev = op.fb_out_curr;

                if (op.connect.value == 0)
                    /* algorithm 5 */
                    PSG.mem.value = PSG.c1.value = PSG.c2.value = (Int16)op.fb_out_prev;
                else
                    /* other algorithms */
                    op.connect.value = (Int16)op.fb_out_prev;

                op.fb_out_curr = 0;
                if (env < ENV_QUIET)
                {
                    if (op.fb_shift == 0)
                        out_ = 0;
                    op.fb_out_curr = op_calc1(op, env, (Int16)(out_ << (int)op.fb_shift));
                }
            }

            op = PSG.oper[opaddr + 1];      /* M2 */
            env = volume_calc(op, ref AM);
            if (env < ENV_QUIET)
                op.connect.value += op_calc(op, env, PSG.m2.value);

            op = PSG.oper[opaddr + 2];      /* C1 */
            env = volume_calc(op, ref AM);
            if (env < ENV_QUIET)
                op.connect.value += op_calc(op, env, PSG.c1.value);

            op = PSG.oper[opaddr + 3];      /* C2 */
            env = volume_calc(op, ref AM);
            if ((PSG.noise & 0x80) != 0)
            {
                UInt32 noiseout;

                noiseout = 0;
                if (env < 0x3ff)
                    noiseout = (UInt32)(env ^ 0x3ff) * 2;   /* range of the YM2151 noise output is -2044 to 2040 */
                PSG.chanout[7].value += (Int16)((PSG.noise_rng & (UInt32)0x10000) != 0 ? noiseout : -noiseout); /* bit 16 -> output */
            }
            else
            {
                if (env < ENV_QUIET)
                    PSG.chanout[7].value += op_calc(op, env, PSG.c2.value);
            }
            /* M1 */
            op.mem_value = PSG.mem.value;
        }

        /*
        The 'rate' is calculated from following formula (example on decay rate):
          rks = notecode after key scaling (a value from 0 to 31)
          DR = value written to the chip register
          rate = 2*DR + rks; (max rate = 2*31+31 = 93)
        Four MSBs of the 'rate' above are the 'main' rate (from 00 to 15)
        Two LSBs of the 'rate' above are the value 'x' (the shape type).
        (eg. '11 2' means that 'rate' is 11*4+2=46)
        NOTE: A 'sample' in the description below is actually 3 output samples,
        thats because the Envelope Generator clock is equal to internal_clock/3.
        Single '-' (minus) character in the diagrams below represents one sample
        on the output; this is for rates 11 x (11 0, 11 1, 11 2 and 11 3)
        these 'main' rates:
        00 x: single '-' = 2048 samples; (ie. level can change every 2048 samples)
        01 x: single '-' = 1024 samples;
        02 x: single '-' = 512 samples;
        03 x: single '-' = 256 samples;
        04 x: single '-' = 128 samples;
        05 x: single '-' = 64 samples;
        06 x: single '-' = 32 samples;
        07 x: single '-' = 16 samples;
        08 x: single '-' = 8 samples;
        09 x: single '-' = 4 samples;
        10 x: single '-' = 2 samples;
        11 x: single '-' = 1 sample; (ie. level can change every 1 sample)
        Shapes for rates 11 x look like this:
        rate:       step:
        11 0        01234567
        level:
        0           --
        1             --
        2               --
        3                 --
        rate:       step:
        11 1        01234567
        level:
        0           --
        1             --
        2               -
        3                -
        4                 --
        rate:       step:
        11 2        01234567
        level:
        0           --
        1             -
        2              -
        3               --
        4                 -
        5                  -
        rate:       step:
        11 3        01234567
        level:
        0           --
        1             -
        2              -
        3               -
        4                -
        5                 -
        6                  -
        For rates 12 x, 13 x, 14 x and 15 x output level changes on every
        sample - this means that the waveform looks like this: (but the level
        changes by different values on different steps)
        12 3        01234567
        0           -
        2            -
        4             -
        8              -
        10              -
        12               -
        14                -
        18                 -
        20                  -
        Notes about the timing:
        ----------------------
        1. Synchronism
        Output level of each two (or more) voices running at the same 'main' rate
        (eg 11 0 and 11 1 in the diagram below) will always be changing in sync,
        even if there're started with some delay.
        Note that, in the diagram below, the decay phase in channel 0 starts at
        sample #2, while in channel 1 it starts at sample #6. Anyway, both channels
        will always change their levels at exactly the same (following) samples.
        (S - start point of this channel, A-attack phase, D-decay phase):
        step:
        01234567012345670123456
        channel 0:
          --
         |  --
         |    -
         |     -
         |      --
         |        --
        |           --
        |             -
        |              -
        |               --
        AADDDDDDDDDDDDDDDD
        S
        01234567012345670123456
        channel 1:
              -
             | -
             |  --
             |    --
             |      --
             |        -
            |          -
            |           --
            |             --
            |               --
            AADDDDDDDDDDDDDDDD
            S
        01234567012345670123456
        2. Shifted (delayed) synchronism
        Output of each two (or more) voices running at different 'main' rate
        (9 1, 10 1 and 11 1 in the diagrams below) will always be changing
        in 'delayed-sync' (even if there're started with some delay as in "1.")
        Note that the shapes are delayed by exactly one sample per one 'main' rate
        increment. (Normally one would expect them to start at the same samples.)
        See diagram below (* - start point of the shape).
        cycle:
        0123456701234567012345670123456701234567012345670123456701234567
        rate 09 1
        *-------
                --------
                        ----
                            ----
                                --------
                                        *-------
                                        |       --------
                                        |               ----
                                        |                   ----
                                        |                       --------
        rate 10 1                       |
        --                              |
          *---                          |
              ----                      |
                  --                    |
                    --                  |
                      ----              |
                          *---          |
                          |   ----      |
                          |       --    | | <- one step (two samples) delay between 9 1 and 10 1
                          |         --  | |
                          |           ----|
                          |               *---
                          |                   ----
                          |                       --
                          |                         --
                          |                           ----
        rate 11 1         |
        -                 |
         --               |
           *-             |
             --           |
               -          |
                -         |
                 --       |
                   *-     |
                     --   |
                       -  || <- one step (one sample) delay between 10 1 and 11 1
                        - ||
                         --|
                           *-
                             --
                               -
                                -
                                 --
                                   *-
                                     --
                                       -
                                        -
                                         --
        */

        private static void advance_eg(YM2151 PSG)
        {
            YM2151Operator op;
            UInt16 i;

            PSG.eg_timer += PSG.eg_timer_add;

            while (PSG.eg_timer >= PSG.eg_timer_overflow)
            {
                PSG.eg_timer -= PSG.eg_timer_overflow;

                PSG.eg_cnt++;

                /* envelope generator */
                int opaddr = 0;
                i = 32;
                do
                {
                    op = PSG.oper[opaddr]; /* CH 0 M1 */

                    switch (op.state)
                    {
                        case EG_ATT:    /* attack phase */
                            if ((PSG.eg_cnt & ((1 << (int)op.eg_sh_ar) - 1)) == 0)
                            {
                                op.volume += (~op.volume *
                                               (eg_inc[op.eg_sel_ar + ((PSG.eg_cnt >> op.eg_sh_ar) & 7)])
                                              ) >> 4;

                                if (op.volume <= MIN_ATT_INDEX)
                                {
                                    op.volume = MIN_ATT_INDEX;
                                    op.state = EG_DEC;
                                }
                            }
                            break;

                        case EG_DEC:    /* decay phase */
                            if ((PSG.eg_cnt & ((1 << op.eg_sh_d1r) - 1)) == 0)
                            {
                                op.volume += eg_inc[op.eg_sel_d1r + ((PSG.eg_cnt >> op.eg_sh_d1r) & 7)];

                                if (op.volume >= (Int32)(op.d1l))
                                    op.state = EG_SUS;
                            }
                            break;

                        case EG_SUS:    /* sustain phase */
                            if ((PSG.eg_cnt & ((1 << op.eg_sh_d2r) - 1)) == 0)
                            {
                                op.volume += eg_inc[op.eg_sel_d2r + ((PSG.eg_cnt >> op.eg_sh_d2r) & 7)];

                                if (op.volume >= MAX_ATT_INDEX)
                                {
                                    op.volume = MAX_ATT_INDEX;
                                    op.state = EG_OFF;
                                }
                            }
                            break;

                        case EG_REL:    /* release phase */
                            if ((PSG.eg_cnt & ((1 << op.eg_sh_rr) - 1)) == 0)
                            {
                                op.volume += eg_inc[op.eg_sel_rr + ((PSG.eg_cnt >> op.eg_sh_rr) & 7)];

                                if (op.volume >= MAX_ATT_INDEX)
                                {
                                    op.volume = MAX_ATT_INDEX;
                                    op.state = EG_OFF;
                                }
                            }
                            break;
                    }
                    opaddr++;
                    i--;
                } while (i != 0);
            }
        }


        private static void advance(YM2151 PSG)
        {
            YM2151Operator op;
            UInt16 i;
            Int16 a, p;

            /* LFO */
            if ((PSG.test & 2) != 0)
                PSG.lfo_phase = 0;
            else
            {
                PSG.lfo_timer += PSG.lfo_timer_add;
                if (PSG.lfo_timer >= PSG.lfo_overflow)
                {
                    PSG.lfo_timer -= PSG.lfo_overflow;
                    PSG.lfo_counter += PSG.lfo_counter_add;
                    PSG.lfo_phase += (PSG.lfo_counter >> 4);
                    PSG.lfo_phase &= 255;
                    PSG.lfo_counter &= 15;
                }
            }

            i = (UInt16)PSG.lfo_phase;
            /* calculate LFO AM and PM waveform value (all verified on real chip, except for noise algorithm which is impossible to analyse)*/
            switch (PSG.lfo_wsel)
            {
                case 0:
                    /* saw */
                    /* AM: 255 down to 0 */
                    /* PM: 0 to 127, -127 to 0 (at PMD=127: LFP = 0 to 126, -126 to 0) */
                    a = (Int16)(255 - i);
                    if (i < 128)
                        p = (Int16)i;
                    else
                        p = (Int16)(i - 255);
                    break;
                case 1:
                    /* square */
                    /* AM: 255, 0 */
                    /* PM: 128,-128 (LFP = exactly +PMD, -PMD) */
                    if (i < 128)
                    {
                        a = 255;
                        p = 128;
                    }
                    else
                    {
                        a = 0;
                        p = -128;
                    }
                    break;
                case 2:
                    /* triangle */
                    /* AM: 255 down to 1 step -2; 0 up to 254 step +2 */
                    /* PM: 0 to 126 step +2, 127 to 1 step -2, 0 to -126 step -2, -127 to -1 step +2*/
                    if (i < 128)
                        a = (Int16)(255 - (i * 2));
                    else
                        a = (Int16)((i * 2) - 256);

                    if (i < 64)                     /* i = 0..63 */
                        p = (Int16)(i * 2);                  /* 0 to 126 step +2 */
                    else if (i < 128)                   /* i = 64..127 */
                        p = (Int16)(255 - i * 2);            /* 127 to 1 step -2 */
                    else if (i < 192)               /* i = 128..191 */
                        p = (Int16)(256 - i * 2);        /* 0 to -126 step -2*/
                    else                    /* i = 192..255 */
                        p = (Int16)(i * 2 - 511);        /*-127 to -1 step +2*/
                    break;
                case 3:
                default:    /*keep the compiler happy*/
                    /* random */
                    /* the real algorithm is unknown !!!
                        We just use a snapshot of data from real chip */

                    /* AM: range 0 to 255    */
                    /* PM: range -128 to 127 */

                    a = lfo_noise_waveform[i];
                    p = (Int16)(a - 128);
                    break;
            }
            PSG.lfa = (UInt32)(a * PSG.amd / 128);
            PSG.lfp = p * PSG.pmd / 128;


            /*  The Noise Generator of the YM2151 is 17-bit shift register.
            *   Input to the bit16 is negated (bit0 XOR bit3) (EXNOR).
            *   Output of the register is negated (bit0 XOR bit3).
            *   Simply use bit16 as the noise output.
            */
            PSG.noise_p += PSG.noise_f;
            i = (UInt16)(PSG.noise_p >> 16);       /* number of events (shifts of the shift register) */
            PSG.noise_p &= 0xffff;
            while (i != 0)
            {
                UInt32 j;
                j = ((PSG.noise_rng ^ (PSG.noise_rng >> 3)) & 1) ^ 1;
                PSG.noise_rng = (j << 16) | (PSG.noise_rng >> 1);
                i--;
            }


            /* phase generator */
            int opaddr = 0; /* CH 0 M1 */

            i = 8;
            do
            {
                op = PSG.oper[opaddr];
                if (op.pms != 0)    /* only when phase modulation from LFO is enabled for this channel */
                {
                    Int32 mod_ind = PSG.lfp;       /* -128..+127 (8bits signed) */
                    if (op.pms < 6)
                        mod_ind >>= (int)(6 - op.pms);
                    else
                        mod_ind <<= (int)(op.pms - 5);

                    if (mod_ind != 0)
                    {
                        Int32 kc_channel = (Int32)op.kc_i + mod_ind;
                        op = PSG.oper[opaddr];
                        op.phase += (UInt32)((PSG.freq[kc_channel + op.dt2] + op.dt1) * op.mul) >> 1;
                        op = PSG.oper[opaddr + 1];
                        op.phase += (UInt32)((PSG.freq[kc_channel + op.dt2] + op.dt1) * op.mul) >> 1;
                        op = PSG.oper[opaddr + 2];
                        op.phase += (UInt32)((PSG.freq[kc_channel + op.dt2] + op.dt1) * op.mul) >> 1;
                        op = PSG.oper[opaddr + 3];
                        op.phase += (UInt32)((PSG.freq[kc_channel + op.dt2] + op.dt1) * op.mul) >> 1;
                    }
                    else        /* phase modulation from LFO is equal to zero */
                    {
                        op = PSG.oper[opaddr];
                        op.phase += op.freq;
                        op = PSG.oper[opaddr + 1];
                        op.phase += op.freq;
                        op = PSG.oper[opaddr + 2];
                        op.phase += op.freq;
                        op = PSG.oper[opaddr + 3];
                        op.phase += op.freq;
                    }
                }
                else            /* phase modulation from LFO is disabled */
                {
                    op = PSG.oper[opaddr];
                    op.phase += op.freq;
                    op = PSG.oper[opaddr + 1];
                    op.phase += op.freq;
                    op = PSG.oper[opaddr + 2];
                    op.phase += op.freq;
                    op = PSG.oper[opaddr + 3];
                    op.phase += op.freq;
                }

                opaddr += 4;
                i--;
            } while (i != 0);


            /* CSM is calculated *after* the phase generator calculations (verified on real chip)
            * CSM keyon line seems to be ORed with the KO line inside of the chip.
            * The result is that it only works when KO (register 0x08) is off, ie. 0
            *
            * Interesting effect is that when timer A is set to 1023, the KEY ON happens
            * on every sample, so there is no KEY OFF at all - the result is that
            * the sound played is the same as after normal KEY ON.
            */

            if (PSG.csm_req != 0)           /* CSM KEYON/KEYOFF seqeunce request */
            {
                if (PSG.csm_req == 2)  /* KEY ON */
                {
                    opaddr = 0;
                    /* CH 0 M1 */
                    i = 32;
                    do
                    {
                        op = PSG.oper[opaddr];
                        KEY_ON(PSG, op, 2);
                        opaddr++;
                        i--;
                    } while (i != 0);
                    PSG.csm_req = 1;
                }
                else                    /* KEY OFF */
                {
                    opaddr = 0;
                    /* CH 0 M1 */
                    i = 32;
                    do
                    {
                        op = PSG.oper[opaddr];
                        KEY_OFF(op, ~(UInt32)2);
                        opaddr++;
                        i--;
                    } while (i != 0);
                    PSG.csm_req = 0;
                }
            }
        }

        /*  Generate samples for one of the YM2151's
        *
        *   'num' is the number of virtual YM2151
        *   '**buffers' is table of pointers to the buffers: left and right
        *   'length' is the number of samples that should be generated
        */
        public static void ym2151_update_one(YM2151 PSG, Int16[] buffers, int length)
        {
            //YM2151* PSG = (YM2151*)chip;
            //short[] buffer, int offset, int sampleCount
            Int16Ptr[] chanout = PSG.chanout;
            Int16 i;
            UInt32 mask = ~PSG.mask;
            Int16 outl, outr;

            for (i = 0; i < length; i += 2)
            {
                advance_eg(PSG);

                chanout[0].value = 0;
                chanout[1].value = 0;
                chanout[2].value = 0;
                chanout[3].value = 0;
                chanout[4].value = 0;
                chanout[5].value = 0;
                chanout[6].value = 0;
                chanout[7].value = 0;

                chan_calc(PSG, 0);
                chan_calc(PSG, 1);
                chan_calc(PSG, 2);
                chan_calc(PSG, 3);
                chan_calc(PSG, 4);
                chan_calc(PSG, 5);
                chan_calc(PSG, 6);
                chan7_calc(PSG);

                outl = 0;
                outr = 0;
                if ((mask & 1) != 0) outl += (Int16)(chanout[0].value & PSG.pan[0]);
                if ((mask & 1) != 0) outr += (Int16)(chanout[0].value & PSG.pan[1]);
                if ((mask & 2) != 0) outl += (Int16)(chanout[1].value & PSG.pan[2]);
                if ((mask & 2) != 0) outr += (Int16)(chanout[1].value & PSG.pan[3]);
                if ((mask & 4) != 0) outl += (Int16)(chanout[2].value & PSG.pan[4]);
                if ((mask & 4) != 0) outr += (Int16)(chanout[2].value & PSG.pan[5]);
                if ((mask & 8) != 0) outl += (Int16)(chanout[3].value & PSG.pan[6]);
                if ((mask & 8) != 0) outr += (Int16)(chanout[3].value & PSG.pan[7]);
                if ((mask & 16) != 0) outl += (Int16)(chanout[4].value & PSG.pan[8]);
                if ((mask & 16) != 0) outr += (Int16)(chanout[4].value & PSG.pan[9]);
                if ((mask & 32) != 0) outl += (Int16)(chanout[5].value & PSG.pan[10]);
                if ((mask & 32) != 0) outr += (Int16)(chanout[5].value & PSG.pan[11]);
                if ((mask & 64) != 0) outl += (Int16)(chanout[6].value & PSG.pan[12]);
                if ((mask & 64) != 0) outr += (Int16)(chanout[6].value & PSG.pan[13]);
                if ((mask & 128) != 0) outl += (Int16)(chanout[7].value & PSG.pan[14]);
                if ((mask & 128) != 0) outr += (Int16)(chanout[7].value & PSG.pan[15]);

                outl >>= FINAL_SH;
                outr >>= FINAL_SH;
                if (outl > MAXOUT) outl = MAXOUT;
                else if (outl < MINOUT) outl = MINOUT;
                if (outr > MAXOUT) outr = MAXOUT;
                else if (outr < MINOUT) outr = MINOUT;
                buffers[i] = outl;
                buffers[i + 1] = outr;

                advance(PSG);
            }
        }

        public static void ym2151_set_mask(YM2151 PSG, UInt32 mask)
        {
            PSG.mask = mask;
        }
    }
}

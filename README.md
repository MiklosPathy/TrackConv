# TrackConv
Convert XM format tracker files to YM2151 control bytes/CX16 player.

What you need for this:

- This source code
- Visual Studio
- Turbo Rascal (optionally for the player)
- OpenMPT (optionally for converting any kind of tracker/midi files to XM)
- Deflemask (for making YM2151 instruments)
- Commander X16 emulator (for running the player)

How to start:

- Open the TrackConv solution in Visual Studio
- Set the TrackConv as Startup Project
- Open the Properties for TrackConv project, and set the absolute path of the "ExampleProjects\Toccata.tcproject" as Application argument
- Press the play button
- TrackConv will generate a music.bas and a music.bin file
  - Contents of music.bas can be copy/pasted into a CX16 emulator, and ready to run, however it is limited by Basic's speed. It can be used for conversion debugging and for really simple 2-3 channel music.
- Copy the music.bin file to the Player directory
- Open the Player.ras in Turbo Rascal
- Set the absolute path of your CX16 Emulator in the Turbol Rascal settings
- Build the Player.ras file
- Run the Player.ras file
- Voila

Limitations:

Lots of them. Also lots of TODO.

- Currently only non paged memory available for music data in the player, so music length is limited to around ~35k
- Lots of mod effects are unimplemented (like arpeggio, pitch slides, etc...)
- Pitch correction function is missing (correct the notes for FM instruments)
- Instrument player for pitch correction by ear
- Player resolution is only 60 tick/sec, it is not accurate enough in all cases
- Chord routing function is missing (chord instruments to multiple channel conversion)
- Instrument autospread function is missing (spread the instruments between channels by different strategies)
- Algorithm based volume control (set only output operator's volume)
- Better volume control (YM2151 has some weird, non linear volume setup)
- Stereo control/strategies
- GUI
- Deflemask output
- A much compact tracker like output format and a much complex player
- Turbo Rascal player can play until 18 minutes due to 16 bit tick counter

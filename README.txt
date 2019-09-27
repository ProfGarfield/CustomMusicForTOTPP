This is an addition to the Test of Time Patch Project, which can be found at https://forums.civfanatics.com/threads/the-test-of-time-patch-project.517282/

This module allows for custom music for scenarios.  You will need the TOTPP music patch enabled for this module to work.

WARNING: The Lua code in this module overwrites files.

Warning Details: This module overwrites the files in the Music directory of your Test of Time installation, so that different music can be played.  Files containing the music that should already be in this folder are provided, but it might be wise to backup the Test of Time\Music directory anyway.  This module is only supposed to be able to make changes to the directory Test of Time\Music, but it is possible that an oversight might cause data to be written elsewhere.  As you are warned when you use Lua events, the events are not sandboxed.  This module also gets data from the Game.txt file, so it is possible that you might be provided a malicious Game.txt file that can trick Lua into writing data elsewhere.  I think the risks are minimal, and I've taken some steps to prevent them, but YOU WERE WARNED!

Installation:

Replace the Test of Time\Music directory with the Music folder provided.  These provide all the music Civilization II shipped with (I think; let me know if I missed something).  There are also a couple audio files needed to make things work.

Copy the contents of directory 'Copy Contents to lua' to the Test of Time\lua directory.  Two are new files that make this module work.  The third modifies (thus replaces) init.lua, which runs automatically at appropriate times to reset the music to the defaults or select a custom playlist.

Usage:

Playlists

This module allows users to add "playlists" to the game, in order to play any music they like.  This music will have the same characteristics as regular in game music (will stop playing during negotiations for example).  The file playlist.txt explains how to customize playlists.  Unfortunately, the pick music menu will not show the names of the playlist tracks, but, rather, the names of the original selection of music.  Custom playlists are overridden if a scenario has customized music.

Scenario Music Customization

End users of a scenario with custom music will not have to do anything to get custom music in a scenario.  They may, however, wish to move music from a custom scenario to the Test of Time\Music directory.  If so, myCustomTrack.mp3 should be named _myCustomTrack.mp3 (unless it is already named _myCustomTrack.mp3 in the files provided, in which case the name should be left as is).  The music then doesn't have to be duplicated (though this is probably not a huge problem on most systems) if you want to listen to it in a playlist.

Scenario creators should see the example CustomMuiscScenario for information on how to add custom music to their scenario.


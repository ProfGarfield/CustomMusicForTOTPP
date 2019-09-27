-- This is a module to put in a scenario, just in case someone doesn't have the custom music update.
--
-- importMusic returns false, so a scenario designer can tell if the music
-- was imported or not.  The Custom Music addition to the game has an importMusic function that returns true.
--
-- Since modules in Test of Time\lua are checked first, that one will override this one.

local function resetMusic() 
    return 
end

local function importMusic(scenarioDirectory,customMusicDirectory)
    return false
end

local function choosePlaylist()
    return
end

return {
    resetMusic=resetMusic,
    importMusic=importMusic,
    choosePlaylist=choosePlaylist,
}

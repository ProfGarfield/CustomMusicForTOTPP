-- Sample customMusic events.lua file
--
-- This line gets the scenario directory for the purpose of loading
-- modules that are also located in the scenario directory
local eventsPath = string.gsub(debug.getinfo(1).source, "@", "")
local scenarioFolderPath = string.gsub(eventsPath, "events.lua", "?.lua")
if string.find(package.path, scenarioFolderPath, 1, true) == nil then
   package.path = package.path .. ";" .. scenarioFolderPath
end
-- This gets the path to the scenario directory, for the purposes
-- of finding files.  This is what we need for customMusic
local scenarioDirectory = string.gsub(scenarioFolderPath,"?.lua","")

local customMusic = require "customMusic"
-- By default, custom music looks in scenarioDirectory\Music
-- for custom music if it can't find it in Test of Time\Music
-- If you want it to look in a different directory for some reason, use
-- customMusic.importMusic(scenarioDirectory,customMusicDirectory)
local usingCustomMusic = customMusic.importMusic(scenarioDirectory)
-- If the "placeholder" customMusic.lua module is used, usingCustomMusic
-- will be false.  If the actual customMusic.lua is used, usingCustomMusic
-- will be true.  Since Test of Time\lua is searched for a module before
-- the scenario folder, there is no harm in having the placeholder customMusic.lua 
-- in a scenario folder
-- I use this to display a message that customized music is available


-- More information from customMusic.lua module:
-- Reads the music selection from @PICKMUSICTOT in Game.txt and tries to play that music 
-- instead of the TOT soundtrack.
-- If a double quote (") is the first and/or last character of the line in 
-- @PICKMUSICTOT, the quote will be ignored when trying to find the file name
-- if a line of @PICKMUSICTOT is 
-- "My Custom Theme"
-- This module copies the file _My Custom Theme.mp3 to one of the hard coded names
-- for music in the Test of Time Patch Project
--
-- If _My Custom Theme.mp3 is not in the TOT Music directory, the directory given
-- by customMusicFolderPath (default scenarioDirectory\Music) is checked for _My Custom Theme.mp3 and My Custom Theme.mp3
-- and if either one exists, it is used
-- 


local civlua = require "civlua"
local func = require "functions"

local state = {}


local justOnce = function (key, f) civlua.justOnce(civlua.property(state, key), f)
end


civ.scen.onUnitKilled(function (killed, killedBy)
end)

civ.scen.onCityTaken(function(city,defender)
end)

civ.scen.onResolveCombat(function(defaultResolutionFunction, defender, attacker)  
end)

civ.scen.onCityProduction(function(city,prod)
end)


civ.scen.onKeyPress(function (keyCode) 
end)

civ.scen.onLoad(function (buffer) state = civlua.unserialize(buffer)
 end)

 civ.scen.onSave(function () 
     return civlua.serialize(state) 
 end) 

 civ.scen.onScenarioLoaded(function ()
     justOnce("CustomMusicMessage",function()
         if not usingCustomMusic then
             civ.ui.text("This scenario offers a customized music selection.  See the README for how to activate it.")
         end
     end)
 end)


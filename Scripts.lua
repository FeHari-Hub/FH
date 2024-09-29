--> Jogos
local games = {
  [3101667897] = "https://raw.githubusercontent.com/FeHari/HaridadeScript/main/HATrial.lua"
}

local gameUrl = games[game.PlaceId]

--> Jogo Não Suportado
if (not gameUrl) then
  return game:GetService("Players").LocalPlayer:Kick("Oops! Este jogo ainda não é suportado. Estamos trabalhando para adicionar mais!)
end

--> Carregar Script!
loadstring(game:HttpGet("https://raw.githubusercontent.com/FeHari/HaridadeScript/main/HATrial.lua"))()


  -- Jogos
local GameID = game.PlaceId

-- Table
local Supported_Games = {
    LegendsOfSpeed_City = 3101667897,
    LegendsOfSpeed_Space = 3232996272,
    LegendsOfSpeed_Desert = 3276265788,
}

-- Script
if GameID == Supported_Games.LegendsOfSpeed_City
or GameID == Supported_Games.LegendsOfSpeed_Space 
or GameID == Supported_Games.LegendsOfSpeed_Desert then
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/FeHari/HaridadeScript/main/HATrial.lua'),true))()
elseif GameID == Supported_Games.MuscleLegends then
else
    warn("Oops! Este jogo ainda não é suportado. Estamos trabalhando para adicionar mais!")
end

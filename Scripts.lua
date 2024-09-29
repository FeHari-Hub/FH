  -- Executar
local GameID = game.PlaceId

-- Jogos
local Supported_Games = {
    LegendsOfSpeed_City = 3101667897,
    LegendsOfSpeed_Space = 3232996272,
    LegendsOfSpeed_Desert = 3276265788,
    MuscleLegends = 3623096087,
}

-- Script
if GameID == Supported_Games.LegendsOfSpeed_City
or GameID == Supported_Games.LegendsOfSpeed_Space 
or GameID == Supported_Games.LegendsOfSpeed_Desert then
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/FeHari/HaridadeScript/main/HATrial.lua'),true))()
elseif GameID == Supported_Games.MuscleLegends then
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/FeHari/HaridadeScript/main/HA.lua'),true))()
else
    warn("Oops! Este jogo ainda não é suportado. Estamos trabalhando para adicionar mais!")
end

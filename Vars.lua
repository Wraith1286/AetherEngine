local Scripts = {
    InfiniteYield = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source",
    DexExplorer = "https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua",
    RemoteSpy = "https://raw.githubusercontent.com/infyiff/backup/main/SimpleSpyV3/main.lua"
}

local Connections = {
    Swim = nil,
    Fly = {
        Connected = false,
        KeyUpEvent = nil,
        KeyDownEvent = nil,
        Controls = { W = 0, A = 0, S = 0, D = 0 },
        NewSpeed = 0
    },
    Spin = nil,
    CustomTP = nil
}

local AetherVars = {
    Scripts = Scripts,
    Connections = Connections,
    FunctionalDelay = 0.1
}

return AetherVars

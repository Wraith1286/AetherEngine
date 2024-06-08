local hue = 0

local function AetherAura()
    local unk = {}

    local aura1 = nil
    local aura2 = nil
    local aura3 = nil
    local aura4 = nil
    local aura5 = nil
    local aura6 = nil

    local function destroyAuras(parentName)
        local parent = game:GetService("Players").LocalPlayer.Character:WaitForChild(parentName)

        if parent then
            for _, child in ipairs(parent:GetChildren()) do
                if child ~= nil and child.Name == "AetherCustomAura" then
                    child:Destroy()
                end
            end
        end
        
    end

    local function createAndAttach(parentName)
    
        local Aura = Instance.new("ParticleEmitter")
        Aura.Name = "AetherCustomAura"
        Aura.Brightness = 1
        Aura.LightEmission = 1
        Aura.LightInfluence = 0
        Aura.Texture = "rbxassetid://2796974629"
        Aura.Color = ColorSequence.new(Color3.fromHSV(hue, 1, 1))
        Aura.Transparency = NumberSequence.new(0.2)
        Aura.Enabled = true
        Aura.Acceleration = Vector3.new(0, 6, 0)
        Aura.RotSpeed = NumberRange.new(-50, 50)
        Aura.SpreadAngle = Vector2.new(-30, 50)
        Aura.Parent = game:GetService("Players").LocalPlayer.Character:WaitForChild(parentName)

        return Aura
    end

    function unk.CreateAndAttach()
        aura1 = createAndAttach("UpperTorso")
        aura2 = createAndAttach("LowerTorso")
        aura3 = createAndAttach("RightUpperArm")
        aura4 = createAndAttach("RightLowerArm")
        aura5 = createAndAttach("LeftUpperArm")
        aura6 = createAndAttach("LeftLowerArm")
    end

    function unk.StopAndDestroy()
        
        destroyAuras("UpperTorso")
        destroyAuras("LowerTorso")
        destroyAuras("RightUpperArm")
        destroyAuras("RightLowerArm")
        destroyAuras("LeftUpperArm")
        destroyAuras("LeftLowerArm")
    
        hue = 0
        
        aura1 = nil
        aura2 = nil
        aura3 = nil
        aura4 = nil
        aura5 = nil
        aura6 = nil
    end

    function unk.Unleash()
        hue = (hue + 0.01) % 1

        local nColour = ColorSequence.new(Color3.fromHSV(hue, 1, 1))

        if aura1 ~= nil then
            aura1.Color = nColour
        end
        if aura2 ~= nil then
            aura2.Color = nColour
        end
        if aura3 ~= nil then
            aura3.Color = nColour
        end
        if aura4 ~= nil then
            aura4.Color = nColour
        end
        if aura5 ~= nil then
            aura5.Color = nColour
        end
        if aura6 ~= nil then
            aura6.Color = nColour
        end

    end

    return unk
end

return AetherAura()

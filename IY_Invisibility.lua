function InfYieldInvisible()

    local function fixcam()
        local Player = game:GetService("Players").LocalPlayer
        workspace.CurrentCamera.CameraSubject = Player.Character
        workspace.CurrentCamera:remove()
        wait(.1)
        repeat task.wait() until Player.Character ~= nil
        workspace.CurrentCamera.CameraSubject = Player.Character:FindFirstChildWhichIsA('Humanoid')
        workspace.CurrentCamera.CameraType = "Custom"
        Player.CameraMinZoomDistance = 0.5
        Player.CameraMaxZoomDistance = 400
        Player.CameraMode = "Classic"
        Player.Character.Head.Anchored = false
    end

    if invisRunning then return end
	invisRunning = true
	-- Full credit to AmokahFox @V3rmillion
	local Player = game:GetService("Players").LocalPlayer
	repeat wait(.1) until Player.Character
	local Character = Player.Character
	Character.Archivable = true
	local IsInvis = false
	local IsRunning = true
	local InvisibleCharacter = Character:Clone()
	InvisibleCharacter.Parent = game:GetService("Lighting")
	local Void = workspace.FallenPartsDestroyHeight
	InvisibleCharacter.Name = ""
	local CF

	local invisFix = game:GetService("RunService").Stepped:Connect(function()
        task.spawn(function()
            pcall(function()
                local IsInteger
                if tostring(Void):find('-') then
                    IsInteger = true
                else
                    IsInteger = false
                end
                local Pos = Player.Character.HumanoidRootPart.Position
                local Pos_String = tostring(Pos)
                local Pos_Seperate = Pos_String:split(', ')
                local X = tonumber(Pos_Seperate[1])
                local Y = tonumber(Pos_Seperate[2])
                local Z = tonumber(Pos_Seperate[3])
                if IsInteger == true then
                    if Y <= Void then
                        Respawn()
                    end
                elseif IsInteger == false then
                    if Y >= Void then
                        Respawn()
                    end
                end
            end)
        end)
	end)

	for i,v in pairs(InvisibleCharacter:GetDescendants())do
		if v:IsA("BasePart") then
			if v.Name == "HumanoidRootPart" then
				v.Transparency = 1
			else
				v.Transparency = .5
			end
		end
	end

	function Respawn()
		IsRunning = false
		if IsInvis == true then
			pcall(function()
				Player.Character = Character
				task.wait()
				Character.Parent = workspace
				Character:FindFirstChildWhichIsA('Humanoid'):Destroy()
				IsInvis = false
				InvisibleCharacter.Parent = nil
				invisRunning = false
			end)
		elseif IsInvis == false then
			pcall(function()
				Player.Character = Character
				task.wait()
				Character.Parent = workspace
				Character:FindFirstChildWhichIsA('Humanoid'):Destroy()
				TurnVisible()
			end)
		end
	end

	local invisDied
	invisDied = InvisibleCharacter:FindFirstChildOfClass('Humanoid').Died:Connect(function()
		Respawn()
		invisDied:Disconnect()
	end)

	if IsInvis == true then return end
	IsInvis = true
	CF = workspace.CurrentCamera.CFrame
	local CF_1 = Player.Character.HumanoidRootPart.CFrame
    if Character:FindFirstChild("Humanoid") then
        Character:MoveTo(Vector3.new(0,math.pi*1000000,0))
    end
	workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
	wait(.2)
	workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
	InvisibleCharacter = InvisibleCharacter
	Character.Parent = game:GetService("Lighting")
	InvisibleCharacter.Parent = workspace
	InvisibleCharacter.HumanoidRootPart.CFrame = CF_1
	Player.Character = InvisibleCharacter
	fixcam()
	Player.Character.Animate.Disabled = true
	Player.Character.Animate.Disabled = false

	function TurnVisible()
		if IsInvis == false then return end
		invisFix:Disconnect()
		invisDied:Disconnect()
        invisFix = nil
		CF = workspace.CurrentCamera.CFrame
		Character = Character
		local CF_1 = Player.Character.HumanoidRootPart.CFrame
		Character.HumanoidRootPart.CFrame = CF_1
		InvisibleCharacter:Destroy()
		Player.Character = Character
		Character.Parent = workspace
		IsInvis = false
		Player.Character.Animate.Disabled = true
		Player.Character.Animate.Disabled = false
		invisDied = Character:FindFirstChildOfClass('Humanoid').Died:Connect(function()
			Respawn()
			invisDied:Disconnect()
		end)
		invisRunning = false
	end

    local unk = {}

    function unk.BecomeVisible()
        TurnVisible()
    end

    return unk
end

return InfYieldInvisible()

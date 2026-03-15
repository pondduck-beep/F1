repeat task.wait(2) until game:IsLoaded()

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualInputManager = game:GetService("VirtualInputManager")

local player = Players.LocalPlayer

-- ======================
-- Auto Haki
-- ======================
task.spawn(function()

	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local remote = ReplicatedStorage:WaitForChild("RemoteEvents"):WaitForChild("HakiRemote")

	local hakiOn = false

	local function enableHaki()
		if not hakiOn then
			remote:FireServer("Toggle")
			hakiOn = true
		end
	end

	enableHaki()

	game.Players.LocalPlayer.CharacterAdded:Connect(function()
		hakiOn = false
		task.wait(1)
		enableHaki()
	end)

end)

	-- ปิด setting ลดแลค
	local SettingsToggle = ReplicatedStorage:WaitForChild("RemoteEvents"):WaitForChild("SettingsToggle")

	local settings = {
	"DisablePvP",
	"DisableVFX",
	"DisableOtherVFX",
	"RemoveTexture",
	"RemoveShadows"
	}

	for _,setting in ipairs(settings) do
		local current = player:FindFirstChild("Settings")
		and player.Settings:FindFirstChild(setting)

		if not current or current.Value ~= true then
			SettingsToggle:FireServer(setting, true)
		end
	end


task.spawn(function()

	local Players = game:GetService("Players")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")

	local player = Players.LocalPlayer

	while task.wait(0.5) do

		local char = player.Character
		local backpack = player:FindFirstChild("Backpack")

		if not char or not backpack then
			continue
		end

		local hum = char:FindFirstChild("Humanoid")
		if not hum then
			continue
		end

		local weapon =
			backpack:FindFirstChild("Strongest In History") or
			char:FindFirstChild("Strongest In History")

	
		if weapon then
			if weapon.Parent ~= char then
				hum:EquipTool(weapon)
			end


		else
			local args = {"Equip","Strongest In History"}

			ReplicatedStorage
				:WaitForChild("Remotes")
				:WaitForChild("EquipWeapon")
				:FireServer(unpack(args))
		end

	end

end)



task.spawn(function()
	while true do
		task.wait(0.3)
		VirtualInputManager:SendKeyEvent(true,"X",false,game)
		task.wait()
		VirtualInputManager:SendKeyEvent(false,"X",false,game)
	end
end)


local function fasttp(cf)
	local char = player.Character
	if char and char:FindFirstChild("HumanoidRootPart") then
		for i = 1,5 do
			char.HumanoidRootPart.CFrame = cf
			task.wait()
		end
	end
end

local function portal(name)
	local args = {name}
	ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("TeleportToPortal"):FireServer(unpack(args))
end


while true do

	portal("Starter")
	task.wait(0.3)
	fasttp(CFrame.new(174.26943969726562,11.206908226013184,-156.84486389160156))
	task.wait(2)

	portal("Jungle")
	task.wait(0.3)
	fasttp(CFrame.new(-563.8446655273438,-0.874668300151825,400.6252197265625))
	task.wait(2)

	portal("Desert")
	task.wait(0.3)
	fasttp(CFrame.new(-791.0394287109375,-4.222726821899414,-432.0268859863281))
	task.wait(2)

	portal("Snow")
	task.wait(0.3)
	fasttp(CFrame.new(-407.5099792480469,-1.1388468742370605,-990.491455078125))
	task.wait(2)

	portal("Shibuya")
	task.wait(0.3)
	fasttp(CFrame.new(1400.0594482421875,8.486136436462402,484.9847106933594))
	task.wait(2)

	portal("HuecoMundo")
	task.wait(0.3)
	fasttp(CFrame.new(-369.4567565917969,-0.15934494137763977,1092.5155029296875))
	task.wait(2)

	portal("Shinjuku")
	task.wait(0.3)
	fasttp(CFrame.new(-17.37151527404785,1.8984041213989258,-1842.671630859375))
	task.wait(2)

	fasttp(CFrame.new(666.2935180664062,1.8831005096435547,-1692.1214599609375))
	task.wait(2)

	portal("Slime")
	task.wait(0.3)
	fasttp(CFrame.new(-1123.855224609375,13.91822624206543,368.31768798828125))
	task.wait(2)

	portal("Academy")
	task.wait(0.3)
	fasttp(CFrame.new(1068.37646484375,1.778355360031128,1277.8568115234375))
	task.wait(2)

	portal("Judgement")
	task.wait(0.3)
	fasttp(CFrame.new(-1270.6287841796875,1.177457332611084,-1192.44189453125))
	task.wait(2)

end

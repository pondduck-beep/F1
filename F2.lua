-- ของฟรียังอยากได้อีกมักมากนะมึง

repeat task.wait(0.5) until game:IsLoaded()

-- =========================
-- Inventory Log
-- =========================
task.spawn(function()

	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local Remote = ReplicatedStorage:WaitForChild("Remotes")

	local targets = {
		["Aura Crate"] = true,
		["Cosmetic Crate"] = true,
		["Mythical Chest"] = true,
		["Clan Reroll"] = true,
		["Race Reroll"] = true,
		["Trait Reroll"] = true,
		["Chrysalis Sigil"] = true,
		["Tempest Relic"] = true
	}

	local priority = {
		["Aura Crate"] = 1,
		["Cosmetic Crate"] = 2,
		["Mythical Chest"] = 3,
		["Clan Reroll"] = 4,
		["Race Reroll"] = 5,
		["Trait Reroll"] = 6,
		["Chrysalis Sigil"] = 7,
		["Tempest Relic"] = 8
	}

	local emojis = {
		["Aura Crate"] = "✨",
		["Cosmetic Crate"] = "🎨",
		["Mythical Chest"] = "💎",
		["Clan Reroll"] = "🏯",
		["Race Reroll"] = "🧬",
		["Trait Reroll"] = "🔁",
		["Chrysalis Sigil"] = "🦋",
		["Tempest Relic"] = "🌪️"
	}

	Remote.UpdateInventory.OnClientEvent:Connect(function(i,v)

		if typeof(v) ~= "table" then
			return
		end

		local amounts = {}

		for name in pairs(targets) do
			amounts[name] = 0
		end

		for _,item in pairs(v) do
			if typeof(item) == "table" then
				
				local name = item.name
				local qty = item.quantity
				
				if name and qty and targets[name] then
					amounts[name] = qty
				end
				
			end
		end

		local found = {}

		for name,_ in pairs(targets) do
			local emoji = emojis[name] or "📦"

			table.insert(found,{
				name = name,
				text = emoji.." "..name.." x"..amounts[name]
			})
		end

		table.sort(found,function(a,b)
			return (priority[a.name] or 999) < (priority[b.name] or 999)
		end)

		local display = {}
		for _,v in pairs(found) do
			table.insert(display,v.text)
		end

		local message = table.concat(display," , ")

		if _G.Horst_SetDescription then
			_G.Horst_SetDescription("🎒 Items : "..message)
		end
			
		

	end)

	Remote.RequestInventory:FireServer()

	while task.wait(5) do
		Remote.RequestInventory:FireServer()
	end

end)


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
	"DisableCutscene",
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

		local darkBlade =
			backpack:FindFirstChild("Strongest In History") or
			char:FindFirstChild("Strongest In History")


		if darkBlade then
			if darkBlade.Parent ~= char then
				hum:EquipTool(darkBlade)
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
		task.wait(0.5)
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


	portal("Shibuya")
	task.wait(0.5)
	fasttp(CFrame.new(1400.0594482421875,8.486136436462402,484.9847106933594))
	task.wait(0.2)



	portal("HuecoMundo")
	task.wait(0.5)
	fasttp(CFrame.new(-369.4567565917969,-0.15934494137763977,1092.5155029296875))
	task.wait(0.2)
	fasttp(CFrame.new(-473.532379, -1.771564, 985.299255))
    task.wait(0.2)

	portal("Shinjuku")
	task.wait(0.5)
	fasttp(CFrame.new(-15.459251, 1.898329, -1843.222656))
    task.wait(0.2)
    fasttp(CFrame.new(273.684357, -0.831846, -1759.684814))
    task.wait(0.2)
    fasttp(CFrame.new(663.039429, 1.883049, -1696.660522))
    task.wait(0.2)


	portal("Slime")
	task.wait(0.5)
	fasttp(CFrame.new(-1123.855224609375,13.91822624206543,368.31768798828125))
	task.wait(0.2)

	portal("Academy")
	task.wait(0.5)
	fasttp(CFrame.new(1068.37646484375,1.778355360031128,1277.8568115234375))
	task.wait(0.2)

	portal("Judgement")
	task.wait(0.5)
	fasttp(CFrame.new(-1270.6287841796875,1.177457332611084,-1192.44189453125))
	task.wait(0.2)



end

--[[

	 ███████████          ████                       ███          
	░█░░░░░░███          ░░███                      ░░░           
	░     ███░    ██████  ░███   ██████   ████████  ████   ██████ 
	     ███     ███░░███ ░███  ░░░░░███ ░░███░░███░░███  ███░░███
	    ███     ░███ ░███ ░███   ███████  ░███ ░░░  ░███ ░███ ░███
	  ████     █░███ ░███ ░███  ███░░███  ░███      ░███ ░███ ░███
	 ███████████░░██████  █████░░████████ █████     █████░░██████ 
	░░░░░░░░░░░  ░░░░░░  ░░░░░  ░░░░░░░░ ░░░░░     ░░░░░  ░░░░░░  


					      Created by @fjfg11
	     Find updated versions at 'github.com/FJFG11/zolario'
	    			   	  Licenced under MIT
							  MIT License
]]

-- [DEVELOPER NOTE] You SHOULDNT have to adjust any code here.

-- Services
local plrs = game.Players
local rs = game.ReplicatedStorage

local api = script.API
local dep = script.Dependent
local iconAPI = require(api.IconAPI)
local customIcons = require(script["Custom Icons"])

local nametag = script.NameTag

-- Sets the visibalty of a icon
-- Param: icon, The icon you want to make visible
-- Param: visible, What is checked to make it visible (must equal a boolean)
local function setIconVisible(icon, visible)
	if icon and icon:IsA("GuiObject") then
		icon.Visible = visible
	end
end

function SetupNameTag(player, character)
	local head = character:FindFirstChild("Head") or character:WaitForChild("Head", 10)
	if not head then
		warn("Zolario couldnt find "..player.Name.."'s head.")
		return
	end
	
	-- Delete a old tag and apply a new one
	if head:FindFirstChild("NameTag") then
		head:FindFirstChild("NameTag"):Destroy()
	end
	
	-- Clone the existing nametag below this script and put the clone in the player's head
	local nametagClone = nametag:Clone()
	nametagClone.Name = "NameTag"
	nametagClone.Adornee = head
	nametagClone.Parent = head
	
	-- Get the primary textlabel and warn if not found
	local primarytext = nametagClone:FindFirstChild("Primary", true)
	if not primarytext then
		warn("Zolario couldnt find 'Primary' textlabel in"..player.Name.."'s head.")
		return
	else
		primarytext.Text = player.Name
	end
	
	-- This check if the player is verified or is roblox plus then awards them the corresponding icon
	for iconName, icon in nametagClone.Icons:GetChildren() do
		if icon.Name == "Verified" then
			if player:IsVerified() then
				setIconVisible("Verified", true)
			end
		elseif icon.Name == "Plus" then
			if player.HasRobloxSubscription then
				setIconVisible("Plus", true)
			end
		end
	end
	
	-- Custom icon section
	-- Get the icon data in Zolario/Custom Icons and then turn it into a real icon
	for iconid, icon in pairs(customIcons) do
		iconAPI.AddIcon(player, {
			Name = icon.Name,
			ImageUrl = icon.ImageUrl
		})
		-- Gets the icon and check if the player can have it
		local Selectedicon = iconAPI.GetIcon(player, icon.Name)
		local Unlock = icon.Unlock(player)
		setIconVisible(Selectedicon, Unlock)
	end
end

-- Get the player's character and then setupnametag
local function setupPlayer(player)
	player.CharacterAdded:Connect(function(character)
		SetupNameTag(player, character)
		-- Get the secondary textlabel's use
		for _, module in dep:GetChildren() do
			if module:IsA("ModuleScript") then
				local moduleScript = require(module)
				moduleScript(player)
			end
		end
	end)

	if player.Character then
		task.spawn(SetupNameTag, player, player.Character)
	end
end

plrs.PlayerAdded:Connect(setupPlayer)
for _, player in plrs:GetPlayers() do
	task.spawn(setupPlayer, player)
end

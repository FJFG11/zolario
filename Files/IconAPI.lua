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
	     	   ServerScriptService/zolario/API/IconAPI
	    			   	  Licenced under MIT
]]

local IconAPI = {}

-- Add a new icon to the icon folder
-- Param: player, The player you want to add a icon to,
-- Param: Name, The name the icon will be called,
-- Param: ImageUrl, The image the icon will show.
function IconAPI.AddIcon(player, Data)
	if not Data then
		warn("Data is nil")
		return nil
	end
	
	local char = player.Character or player.CharacterAdded:Wait()
	local head = char:WaitForChild("Head")
	local nameTag = head:WaitForChild("NameTag")

	local Icons = nameTag.Icons
	local Template = Icons:FindFirstChild("Template")

	if not Template then
		warn("Template not found")
		return nil
	end

	if not Data.Name or Data.Name == "" then
		warn("Data.Name is empty")
		return nil
	end

	if not Data.ImageUrl or Data.ImageUrl == "" then
		warn("Data.ImageUrl is empty")
		return nil
	end
	
	if Icons:FindFirstChild(Data.Name) then
		return nil	
	end

	local NewIcon = Template:Clone()
	NewIcon.Name = Data.Name
	NewIcon.Image = Data.ImageUrl
	NewIcon.Parent = Icons

	return NewIcon
end

-- Get a Specific icon from a player's icon folder
-- Param: player, The player you want to get the icon,
-- Param: iconName, The name of the icon you want to get.
function IconAPI.GetIcon(player, IconName)
	local char = player.Character or player.CharacterAdded:Wait()
	local head = char:WaitForChild("Head")
	local nameTag = head:WaitForChild("NameTag")
	
	local Icons = nameTag.Icons
	local Icon = Icons:FindFirstChild(IconName)
	if not Icon then
		return nil
	end
	
	return Icon
end

return IconAPI

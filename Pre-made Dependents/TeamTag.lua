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
]]

return function(player)
	local char = player.Character or player.CharacterAdded:Wait()
	local head = char:WaitForChild("Head")
	local nameTag = head:WaitForChild("NameTag")
	local Secondary = nameTag:WaitForChild("Secondary")

	-- Set the text the player's team
	local function updateTeam()
		local team = player.Team

		if team then
			Secondary.Text = team.Name
		else
			Secondary.Text = "No Selected Team"
		end
	end
	
	updateTeam()
	-- Update the text when the team changes
	player:GetPropertyChangedSignal("Team"):Connect(updateTeam)
end

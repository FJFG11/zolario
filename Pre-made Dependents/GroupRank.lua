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

	-- put your group id below
	local GROUP_ID = 753140944

	local function updateRank()
		local rank = player:GetRoleInGroup(GROUP_ID)

		if rank and rank ~= "Guest" then
			Secondary.Text = rank
		else
			Secondary.Text = "Guest"
		end
	end

	updateRank()
end

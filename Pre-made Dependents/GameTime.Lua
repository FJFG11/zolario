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

	local startTime = os.clock()

	local function updateGameTime()
		local elapsed = math.floor(os.clock() - startTime)

		local hours = math.floor(elapsed / 3600)
		local minutes = math.floor((elapsed % 3600) / 60)
		local seconds = elapsed % 60
		
		-- shows the gametime in 00:00:00
		Secondary.Text = string.format(
			"%02d:%02d:%02d",
			hours,
			minutes,
			seconds
		)
	end
	
	-- +1s
	while player.Parent do
		updateGameTime()
		task.wait(1)
	end
end

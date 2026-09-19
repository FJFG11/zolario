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
  -- Gets the secondary label in the player's nametag
	local char = player.Character or player.CharacterAdded:Wait()
	local head = char:WaitForChild("Head")
	local nameTag = head:WaitForChild("NameTag")
	local Secondary = nameTag:WaitForChild("Secondary")

  -- put your code here
end

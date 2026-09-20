<img width="1011" height="200" alt="Screenshot 2026-09-19 at 23 06 54" src="https://github.com/user-attachments/assets/18aaf573-9dd7-4b89-aa99-c207e8a03259" />

# Zolario

Zolario is a open source roblox user tag system for all games with easy secondary label use changes, So far select from GroupRank, GameTime, TeamName and expect more **maybe even make your own!**

## Setup
How to setup Zolario:

1. Download the latest version of Zolario,
2. Insert Zolario into your game,
3. Put Zolario in ServerScriptService.

## Custom Icons
How to use them:

1. Open game/ServerScriptService/Zolario/Custom Icons,
2. Copy:
```luau
["icon1"] = { -- Change the 1 to the number the icon is. E.g Icon1, Icon2 etc
		["Name"] = "IconNameHere",
		["ImageUrl"] = "rbxassetid://Image_ID_Here",
		["Unlock"] = function(player)
			-- Custom unlock code here or 'return true' for auto unlock
		end 
	},
```
3. Paste the code into game/ServerScriptService/Zolario/Custom Icons,
4. Change the settings to what you want.

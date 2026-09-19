<img width="1011" height="200" alt="Screenshot 2026-09-19 at 23 06 54" src="https://github.com/user-attachments/assets/18aaf573-9dd7-4b89-aa99-c207e8a03259" />

# Zolario

Zolario is a open source roblox user tag system.

## Features
Zolario supports:
> Custom Icons           
> Different uses for the secondary label: GroupRank, TeamName, TimeInGame etc.

## Setup
How to setup Zolario:

1. Download the latest version of Zolario,
2. Insert Zolario into your game,
3. Put Zolario in ServerScriptService.

## Custom Icons
How to use them:

```luau
IconAPI.AddIcon(player, { 
		Name = "AddANameHere", -- Put a name between the "" so it you can get the icon later
		ImageUrl = "rbxassetid://IDHere" -- Put the asset ID here to display the image you want
})

local NameThisWhatever = IconAPI.GetIcon(player, "IconName") -- Replace 'IconName' with that name of a existing icon you made above

setIconVisible(IconName, player.UserId == 421517931) -- Replace 'IconName' with that name of a existing icon and then how you can get the icon E.g 'player.UserId == 421517931'

```

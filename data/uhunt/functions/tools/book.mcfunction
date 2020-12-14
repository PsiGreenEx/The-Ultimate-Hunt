#> uhunt:tools/book
#
# Handles triggers for config book.
#
# @context as admin when config is 1 or greater
# @within uhunt:main/tick

#> Trigger Values
# 1 - Toggle Hunter Compass
# 2 - Toggle Runner Compass
# 3 - Toggle Display Timer
# 4 - Toggle Final Ten Countdown
# 5 - Toggle Hunter Glowing
# 6 - Toggle Runner Glowing
# 7 - Edit Grace Timer

# Click when a button is pressed
execute at @s run playsound ui.button.click master @s ~ ~ ~ .5

# Copy config to value_edit
scoreboard players operation @s value_edit = @s config

# Toggle Hunter Compass
execute if score @s config matches 1 store result score $temp _ run data get storage uhunt:system c.Compass[0]
execute if score @s config matches 1 if score $temp _ matches 0 run data modify storage uhunt:system c.Compass[0] set value 1b 
execute if score @s config matches 1 if score $temp _ matches 0 run tellraw @a [{"text": "Compasses have been enabled for "},{"text": "hunters","color": "red"},"."]
execute if score @s config matches 1 if score $temp _ matches 1 run data modify storage uhunt:system c.Compass[0] set value 0b 
execute if score @s config matches 1 if score $temp _ matches 1 run tellraw @a [{"text": "Compasses have been disabled for "},{"text": "hunters","color": "red"},"."]

# Toggle Runner Compass
execute if score @s config matches 2 store result score $temp _ run data get storage uhunt:system c.Compass[1]
execute if score @s config matches 2 if score $temp _ matches 0 run data modify storage uhunt:system c.Compass[1] set value 1b 
execute if score @s config matches 2 if score $temp _ matches 0 run tellraw @a [{"text": "Compasses have been enabled for "},{"text": "runners","color": "green"},"."]
execute if score @s config matches 2 if score $temp _ matches 1 run data modify storage uhunt:system c.Compass[1] set value 0b 
execute if score @s config matches 2 if score $temp _ matches 1 run tellraw @a [{"text": "Compasses have been disabled for "},{"text": "runners","color": "green"},"."]

# Toggle Display Timer
execute if score @s config matches 3 store result score $temp _ run data get storage uhunt:system c.DisplayTimer
execute if score @s config matches 3 if score $temp _ matches 0 run data modify storage uhunt:system c.DisplayTimer set value 1b 
execute if score @s config matches 3 if score $temp _ matches 0 run tellraw @a [{"text": "The game timer display has been enabled."}]
execute if score @s config matches 3 if score $temp _ matches 1 run data modify storage uhunt:system c.DisplayTimer set value 0b 
execute if score @s config matches 3 if score $temp _ matches 1 run tellraw @a [{"text": "The game timer display has been disabled."}]

# Toggle Final Ten Countdown
execute if score @s config matches 4 store result score $temp _ run data get storage uhunt:system c.FinalTenCountdown
execute if score @s config matches 4 if score $temp _ matches 0 run data modify storage uhunt:system c.FinalTenCountdown set value 1b 
execute if score @s config matches 4 if score $temp _ matches 0 run tellraw @a [{"text": "The final ten second countdown has been enabled."}]
execute if score @s config matches 4 if score $temp _ matches 1 run data modify storage uhunt:system c.FinalTenCountdown set value 0b 
execute if score @s config matches 4 if score $temp _ matches 1 run tellraw @a [{"text": "The final ten second countdown has been disabled."}]

# Toggle Hunter Glowing
execute if score @s config matches 5 store result score $temp _ run data get storage uhunt:system c.Glowing[0]
execute if score @s config matches 5 if score $temp _ matches 0 run data modify storage uhunt:system c.Glowing[0] set value 1b 
execute if score @s config matches 5 if score $temp _ matches 0 run tellraw @a [{"text": "Glowing has been enabled for "},{"text": "hunters","color": "red"},"."]
execute if score @s config matches 5 if score $temp _ matches 1 run data modify storage uhunt:system c.Glowing[0] set value 0b 
execute if score @s config matches 5 if score $temp _ matches 1 run tellraw @a [{"text": "Glowing has been disabled for "},{"text": "hunters","color": "red"},"."]

# Toggle Runner Glowing
execute if score @s config matches 6 store result score $temp _ run data get storage uhunt:system c.Glowing[1]
execute if score @s config matches 6 if score $temp _ matches 0 run data modify storage uhunt:system c.Glowing[1] set value 1b 
execute if score @s config matches 6 if score $temp _ matches 0 run tellraw @a [{"text": "Glowing has been enabled for "},{"text": "runners","color": "green"},"."]
execute if score @s config matches 6 if score $temp _ matches 1 run data modify storage uhunt:system c.Glowing[1] set value 0b 
execute if score @s config matches 6 if score $temp _ matches 1 run tellraw @a [{"text": "Glowing has been disabled for "},{"text": "runners","color": "green"},"."]

# Edit Grace Timer
execute if score @s config matches 7 run tellraw @s {"text":"Click to edit the grace period timer. Value is in ticks. -1 is disabled.","clickEvent":{"action":"suggest_command","value":"/trigger edit set "}}
execute if score @s config matches 7 run scoreboard players enable @s edit
execute if score @s config matches 7 run scoreboard players set @s edit -999

# Refresh book
function uhunt:util/config-book

#> uhunt:util/config-book
#
# Refreshes config book
#
# @user

# Clear and give book
clear @s written_book{uhuntid:"config"}
loot give @s loot uhunt:config_book

# Hunter Compass Text
execute store result score $temp _ run data get storage uhunt:system c.Compass[0]
execute if score $temp _ matches 1 run data modify storage uhunt:config-text c.Compass[0] set value '{"text":"✔","color":"#D90900","bold":true}'
execute if score $temp _ matches 0 run data modify storage uhunt:config-text c.Compass[0] set value '{"text":"❌","color":"#D90900","bold":true}'

# Runner Compass Text
execute store result score $temp _ run data get storage uhunt:system c.Compass[1]
execute if score $temp _ matches 1 run data modify storage uhunt:config-text c.Compass[1] set value '{"text":"✔","color":"#32A852","bold":true}'
execute if score $temp _ matches 0 run data modify storage uhunt:config-text c.Compass[1] set value '{"text":"❌","color":"#32A852","bold":true}'

# Hunter Glowing Text
execute store result score $temp _ run data get storage uhunt:system c.Glowing[0]
execute if score $temp _ matches 1 run data modify storage uhunt:config-text c.Glowing[0] set value '{"text":"✔","color":"#D90900","bold":true}'
execute if score $temp _ matches 0 run data modify storage uhunt:config-text c.Glowing[0] set value '{"text":"❌","color":"#D90900","bold":true}'

# Runner Glowing Text
execute store result score $temp _ run data get storage uhunt:system c.Glowing[1]
execute if score $temp _ matches 1 run data modify storage uhunt:config-text c.Glowing[1] set value '{"text":"✔","color":"#32A852","bold":true}'
execute if score $temp _ matches 0 run data modify storage uhunt:config-text c.Glowing[1] set value '{"text":"❌","color":"#32A852","bold":true}'

# Display Timer Text
execute store result score $temp _ run data get storage uhunt:system c.DisplayTimer
execute if score $temp _ matches 1 run data modify storage uhunt:config-text c.DisplayTimer set value '{"text":"✔","bold":true}'
execute if score $temp _ matches 0 run data modify storage uhunt:config-text c.DisplayTimer set value '{"text":"❌","bold":true}'

# Ending Countdown Text
execute store result score $temp _ run data get storage uhunt:system c.FinalTenCountdown
execute if score $temp _ matches 1 run data modify storage uhunt:config-text c.FinalTenCountdown set value '{"text":"✔","bold":true}'
execute if score $temp _ matches 0 run data modify storage uhunt:config-text c.FinalTenCountdown set value '{"text":"❌","bold":true}'

# Grace Timer Text
execute store result score $temp _ run data get storage uhunt:system c.GraceTimer
execute if score $temp _ matches 0.. run data modify storage uhunt:config-text c.GraceTimer set from storage uhunt:system c.GraceTimer
execute if score $temp _ matches -1 run data modify storage uhunt:config-text c.GraceTimer set value '{"text":"❌","bold":true}'

# Game Timer Text
execute store result score $temp _ run data get storage uhunt:system c.WinCon.GameTimer
execute if score $temp _ matches 0.. run data modify storage uhunt:config-text c.WinCon.GameTimer set from storage uhunt:system c.WinCon.GameTimer
execute if score $temp _ matches -1 run data modify storage uhunt:config-text c.WinCon.GameTimer set value '{"text":"❌","bold":true}'

# Dragon Kill Text
execute store result score $temp _ run data get storage uhunt:system c.WinCon.DragonKill
execute if score $temp _ matches 0 run data modify storage uhunt:config-text c.WinCon.DragonKill set value '{"text":"0","bold":true,"hoverEvent":{"action":"show_text","value":"Killing the dragon does not win the game."}}'
execute if score $temp _ matches 1 run data modify storage uhunt:config-text c.WinCon.DragonKill set value '{"text":"1","bold":true,"hoverEvent":{"action":"show_text","value":"Whichever team kills the dragon first wins the game."}}'
execute if score $temp _ matches 2 run data modify storage uhunt:config-text c.WinCon.DragonKill set value '{"text":"2","bold":true,"hoverEvent":{"action":"show_text","value":["If the dragon is killed at all, ",{"text": "runners","color": "green"}," win the game."]}}'

# Hunter Lives Text
execute store result score $temp _ run data get storage uhunt:system c.WinCon.Lives[0]
execute if score $temp _ matches 0.. run data modify storage uhunt:config-text c.WinCon.Lives[0] set value '{"nbt":"c.WinCon.Lives[0]","storage":"uhunt:system","color":"#D90900","bold":true}'
execute if score $temp _ matches -1 run data modify storage uhunt:config-text c.WinCon.Lives[0] set value '{"text":"Inf","color":"#D90900","bold":true}'

# Runner Lives Text
execute store result score $temp _ run data get storage uhunt:system c.WinCon.Lives[1]
execute if score $temp _ matches 0.. run data modify storage uhunt:config-text c.WinCon.Lives[1] set value '{"nbt":"c.WinCon.Lives[1]","storage":"uhunt:system","color":"#32A852","bold":true}'
execute if score $temp _ matches -1 run data modify storage uhunt:config-text c.WinCon.Lives[1] set value '{"text":"Inf","color":"#32A852","bold":true}'



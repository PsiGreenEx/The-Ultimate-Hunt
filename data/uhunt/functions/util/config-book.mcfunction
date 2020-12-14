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

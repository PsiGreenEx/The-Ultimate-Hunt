#> uhunt:util/uninstall
#
# Clean up datapack from world and disable.
#
# @user

# Clear scoreboard objectives
scoreboard objectives remove _
scoreboard objectives remove compass
scoreboard objectives remove compassdrop
scoreboard objectives remove dragon_kill
scoreboard objectives remove timer
scoreboard objectives remove deaths

# Remove teams
team remove hunter
team remove runner
team remove spectator

# Kill entities
kill @e[tag=uhunt.startpos]

# Clear compasses
clear @a compass{tag:{uhuntid:"tracker"}}

# Clear storage
data remove storage uhunt:system c
data remove storage uhunt:system p

# Disable the pack unless run from uhunt:util/reset
execute unless entity @s[tag=uhunt.reset] run datapack disable "file/The Ultimate Hunt"

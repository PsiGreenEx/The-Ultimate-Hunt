#> uhunt:game_states/hunt/start1
#
# Runs the tick the game starts.
#
# 

# All players without a team become spectator
team join spectator @a[team=]

# Set all players to proper gamemodes
gamemode survival @a[team=!spectator]
gamemode spectator @a[team=spectator]

# Refresh all players
effect give @a instant_health 1 5
effect give @a saturation 1 20

# Clear deaths
scoreboard players set @a deaths 0

# Clear inventory
clear @a

# Reset HuntWin
scoreboard players set $HuntWin _ -1

# Place players at spawnpoint
execute at @e[tag=uhunt.startpos] run spreadplayers ~ ~ 0 1 true @a[team=!spectator]

# Run grace if enabled, otherwise run start2
execute store result score $temp _ run data get storage uhunt:system c.GraceTimer
execute if score $temp _ matches 0.. run function uhunt:game_states/grace/start
execute if score $temp _ matches -1 run function uhunt:game_states/hunt/start2

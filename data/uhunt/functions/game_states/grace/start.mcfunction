#> uhunt:game_states/grace/start
#
# Code to run at the beginning of grace period.
#
# @context first tick of grace period.

# Title "Runners Go!" and ping
title @a title {"text": "Runners Go!","bold": true,"color": "green"}
tellraw @a {"text": "Runners Go!","bold": true,"color": "green"}
execute as @a at @s run playsound block.note_block.cow_bell master @s ~ ~ ~ 100 1

# Set grace timer
execute store result score $GraceTimer timer run data get storage uhunt:system c.GraceTimer 1
bossbar add uhunt:timer ""
execute store result bossbar uhunt:timer max run scoreboard players get $GraceTimer timer
execute store result bossbar uhunt:timer value run scoreboard players get $GraceTimer timer
bossbar set uhunt:timer players @a

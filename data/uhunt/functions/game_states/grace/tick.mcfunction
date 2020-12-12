#> uhunt:game_states/grace/tick
#
# Code to run every tick during grace period.
#
# @within uhunt:main/tick

# Fancy border circle
execute as @e[tag=uhunt.startpos] at @s run tp @s ~ ~ ~ ~3 ~
execute as @e[tag=uhunt.startpos] at @s run particle end_rod ^ ^1 ^5 0 0.5 0 0 15 force @a[team=!runner]
execute as @e[tag=uhunt.startpos] at @s run particle end_rod ^ ^1 ^-5 0 0.5 0 0 15 force @a[team=!runner]

# If hunter exits circle, teleport back to center and make sound
execute at @e[tag=uhunt.startpos] as @a[team=hunter,distance=5..] at @s run playsound block.note_block.bass master @s ~ ~ ~ 100 0
execute at @e[tag=uhunt.startpos] as @a[team=hunter,distance=5..] run tp @s ~ ~ ~

# Give mining fatigue and resistance to hunters
effect give @a[team=hunter] mining_fatigue 1 5 true
effect give @a[team=hunter] resistance 1 5 true

# Decrement timer
scoreboard players remove $GraceTimer timer 1

# If timer is 0 run grace end
execute if score $GraceTimer timer matches 0 run function uhunt:game_states/grace/end

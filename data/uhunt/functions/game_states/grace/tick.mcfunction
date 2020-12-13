#> uhunt:game_states/grace/tick
#
# Code to run every tick during grace period.
#
# @within uhunt:main/tick

# Fancy border circle
execute as @e[tag=uhunt.startpos] at @s run tp @s ~ ~ ~ ~3 ~
execute as @e[tag=uhunt.startpos] at @s run particle end_rod ^ ^5 ^5 0 5 0 0 50 force @a[distance=0..5]
execute as @e[tag=uhunt.startpos] at @s run particle end_rod ^ ^5 ^-5 0 5 0 0 50 force @a[distance=0..5]

# If hunter exits circle, teleport away from cirlce "wall"
execute at @e[tag=uhunt.startpos] as @a[team=hunter,distance=5..] at @s facing entity @e[tag=uhunt.startpos] feet rotated ~ 0 run tp @s ^ ^ ^0.5

# Give mining fatigue and resistance to hunters
execute at @e[tag=uhunt.startpos] run effect give @a[distance=0..5] mining_fatigue 1 5 true
execute at @e[tag=uhunt.startpos] run effect give @a[distance=0..5] resistance 1 5 true

# Decrement timer
scoreboard players remove $GraceTimer timer 1

# Get minutes($temp3) and seconds($temp2) offset by one second
scoreboard players set $temp _ 20
scoreboard players operation $temp2 _ = $GraceTimer timer
scoreboard players operation $temp2 _ += $temp _
scoreboard players operation $temp2 _ /= $temp _
scoreboard players set $temp _ 60
scoreboard players operation $temp3 _ = $temp2 _
scoreboard players operation $temp2 _ %= $temp _
scoreboard players operation $temp3 _ /= $temp _

# Set name
execute if score $temp2 _ matches 10.. run bossbar set uhunt:timer name [{"text": "Grace Time Left: "},{"score": {"objective": "_","name": "$temp3"}},{"text": ":"},{"score": {"objective": "_","name": "$temp2"}}]
execute unless score $temp2 _ matches 10.. run bossbar set uhunt:timer name [{"text": "Grace Time Left: "},{"score": {"objective": "_","name": "$temp3"}},{"text": ":0"},{"score": {"objective": "_","name": "$temp2"}}]

# Set value
execute store result bossbar uhunt:timer value run scoreboard players get $GraceTimer timer


# If timer is 0 run grace end
execute if score $GraceTimer timer matches 0 run function uhunt:game_states/grace/end

#> uhunt:game_states/hunt/start2
#
# Runs right after uhunt:game_states/grace/end or uhunt:game_states/hunt/start1 if grace is disabled.
#
#

# Give compass if team compass is enabled
execute store result score $temp _ run data get storage uhunt:system c.Compass[0]
execute if score $temp _ matches 1 as @a[team=hunter] run function uhunt:util/compass
execute store result score $temp _ run data get storage uhunt:system c.Compass[1]
execute if score $temp _ matches 1 as @a[team=runner] run function uhunt:util/compass

# Unless grace is enabled, title "Go!" and ping.
execute store result score $temp _ run data get storage uhunt:system c.GraceTimer
execute if score $temp _ matches -1 run title @a title {"text":"Go!", "bold": true, "color": "dark_green"}
execute if score $temp _ matches -1 run tellraw @a {"text":"Go!", "bold": true, "color": "dark_green"}
execute if score $temp _ matches -1 as @a at @s run playsound block.note_block.pling master @s ~ ~ ~ 100 2

# Set GameTimer
execute store result score $GameTimer timer run data get storage uhunt:system c.WinCon.GameTimer

# Set timer display
bossbar add uhunt:timer ""
execute store result bossbar uhunt:timer max run scoreboard players get $GameTimer timer
execute store result bossbar uhunt:timer value run scoreboard players get $GameTimer timer
execute store result score $temp _ run data get storage uhunt:system c.DisplayTimer
execute if score $temp _ matches 1 run bossbar set uhunt:timer players @a
bossbar set uhunt:timer visible true

# Toggle Hunt
scoreboard players set $Hunt _ 1

#> uhunt:game_states/hunt/tick
#
# Runs every tick while hunt is on.
#
# @within uhunt:main/tick

# If compass dropped, set compass position.
execute as @a[scores={compassdrop=1}] at @s run function uhunt:tools/compassdrop

# Allow for reset of compass.
#> Enable compass trigger for hunter.
    execute store result score $temp _ run data get storage uhunt:system c.Compass[0]
    execute if score $temp _ matches 1 as @a[team=hunter] run scoreboard players enable @s compass
    execute if score $temp _ matches 1 as @a[team=hunter,scores={compass=1..}] run function uhunt:util/compass
#> Enable compass trigger for runner.
    execute store result score $temp _ run data get storage uhunt:system c.Compass[1]
    execute if score $temp _ matches 1 as @a[team=hunter] run scoreboard players enable @s compass
    execute if score $temp _ matches 1 as @a[team=runner,scores={compass=1..}] run function uhunt:util/compass


# Check lives.
#> If death count of hunters exceed live count, runners win.
    execute store result score $temp2 _ run data get storage uhunt:system c.WinCon.TeamLives
    execute store result score $temp _ run data get storage uhunt:system c.WinCon.Lives[0]
    #> Unless TeamLives is enabled.
        execute unless score $temp _ matches -1 unless score $temp2 _ matches 1 as @a[team=hunter] if score @s deaths >= $temp _ run team join spectator
    #> If TeamLives is enabled.
        execute unless score $temp _ matches -1 if score $temp2 _ matches 1 as @a[team=hunter] run scoreboard players operation $temp3 _ += @s deaths
        execute unless score $temp _ matches -1 if score $temp2 _ matches 1 if score $temp3 _ >= $temp _ run scoreboard players set $HuntWin _ 1
#> If death count of runners exceed live count, hunters win.
    execute store result score $temp _ run data get storage uhunt:system c.WinCon.Lives[1]
    #> Unless TeamLives is enabled.
        execute unless score $temp _ matches -1 unless score $temp2 _ matches 1 as @a[team=runner] if score @s deaths >= $temp _ run team join spectator
    #> If TeamLives is enabled.
        execute unless score $temp _ matches -1 if score $temp2 _ matches 1 as @a[team=runner] run scoreboard players operation $temp3 _ += @s deaths
        execute unless score $temp _ matches -1 if score $temp2 _ matches 1 if score $temp3 _ >= $temp _ run scoreboard players set $HuntWin _ 0

# Check if any players left in team.
#> If no hunters left in team, runners win.
    scoreboard players set $temp _ 0
    execute as @a[team=hunter] run scoreboard players add $temp _ 1
    execute if score $temp _ matches 0 run scoreboard players set $HuntWin _ 1
#> If no runners left in team, hunters win.
    scoreboard players set $temp _ 0
    execute as @a[team=runner] run scoreboard players add $temp _ 1
    execute if score $temp _ matches 0 run scoreboard players set $HuntWin _ 0

# Check if dragon is defeated
execute store result score $temp _ run data get storage uhunt:system c.WinCon.DragonKill
execute if score $temp _ matches 1 if entity @a[team=hunter,scores={dragon_kill=1..}] run scoreboard players set $HuntWin _ 0
execute if score $temp _ matches 1 if entity @a[team=runner,scores={dragon_kill=1..}] run scoreboard players set $HuntWin _ 1
execute if score $temp _ matches 2 if entity @a[scores={dragon_kill=1..}] run scoreboard players set $HuntWin _ 1

# If timer enabled, check time.
execute store result score $temp _ run data get storage uhunt:system c.WinCon.GameTimer
execute store result score $temp2 _ run data get storage uhunt:system c.DisplayTimer
execute unless score $temp _ matches -1 if score $GameTimer timer matches 0 run scoreboard players set $HuntWin _ 1
execute unless score $temp _ matches -1 run scoreboard players remove $GameTimer timer 1
execute unless score $temp _ matches -1 if score $temp2 _ matches 1.. run function uhunt:tools/timer

# If final ten countdown is enabled, run countdown.
execute store result score $temp _ run data get storage uhunt:system c.FinalTenCountdown
execute if score $temp _ matches 1 if score $GameTimer timer matches 1..200 run function uhunt:game_states/hunt/finalten

# Apply gamemodes
execute as @a[team=spectator,nbt=!{playerGameType:3}] run gamemode spectator @s
execute as @a[team=!spectator,team=!,nbt=!{playerGameType:0}] run gamemode survival @s 

# Check end
execute unless score $HuntWin _ matches -1 run function uhunt:game_states/hunt/end

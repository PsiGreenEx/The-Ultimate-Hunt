#> uhunt:main/load
#
# Runs at loading of datapack.
#
# @context main
# @handles #minecraft:load

# Add teams
#> The team hunting for the runners.
team add hunter
team modify hunter color red
#> The team running from the hunters.
team add runner
team modify runner color green
#> The team in spectator mode.
team add spectator
team modify spectator color gray

# Init objectives
#> Only used as temp number storage.
scoreboard objectives add _ dummy
#> Trigger for getting a new compass. Tick cleared.
scoreboard objectives add compass trigger "Compass"
#> Detects when compass is dropped. Tick cleared.
scoreboard objectives add compassdrop minecraft.dropped:minecraft.compass
#> Detects when Ender Dragon is killed. Tick cleared?
scoreboard objectives add dragon_kill minecraft.killed:minecraft.ender_dragon
#> Universal timer objectives. Generally tick decremented.
scoreboard objectives add timer dummy
#> Tracks number of deaths.
scoreboard objectives add deaths deathCount

# Init dummy players
#declare score_holder $GraceTimer Stores remaining grace period time.
scoreboard players set $GraceTimer timer 0
#declare score_holder $temp Holds temporary values.
#declare score_holder $Hunt bool If hunt is ongoing.
scoreboard players set $Hunt _ 0
#declare score_holder $GameTimer Stores game timer.
scoreboard players set $GameTimer timer -1
#declare score_holder $HuntWin -1 nothing, 0 hunters win, 1 runners win
scoreboard players set $HuntWin _ -1

# Init config.
#declare storage uhunt:system Config file and presets for game settings.
#region| Config options:
#   DisplayTimer[hunter,runner] - int - If GameTimer is visible as bossbar to team.
#   GraceTimer - int - Time in ticks for grace period. Disabled if -1.
#   Glowing[hunter,runner] - bool - If team will have constant glowing effect.
#   Compass[hunter,runner] - bool - If team can use a compass.
#   WinCon - Tag contain data pertaining to runner and hunter win/loss conditions.
#       GameTimer - int - Time in ticks until the game ends and the runner wins. Disabled if -1.
#       DragonKill - int - 0 Killing Dragon doesn't win the game. 1 Whichever team kills the dragon wins. 2 If dragon is killed at all, runners win.
#       Lives[hunter,runner] - int - How many times each player from team or team can die. Infinite if -1.
#       TeamLives - bool - If the teams share lives collectively.
#endregion
data modify storage uhunt:system p.Default merge value {DisplayTimer:[False, False], GraceTimer:300, Glowing:[False,False], Compass:[True,False], WinCon:{GameTimer: -1, DragonKill:2, Lives:[-1,1], TeamLives: False}} 
data modify storage uhunt:system c merge from storage uhunt:system p.Default

# Place start position marker
#declare tag uhunt.startpos AEC placed upon loading the pack for the first time. Indicates where players will start.
execute unless entity @e[tag=uhunt.startpos] at @p run summon minecraft:area_effect_cloud ~ ~ ~ {Age: -2147483648, Duration: -1, WaitTime: -2147483648, Tags: ["uhunt.startpos"]}

# Misc init
title @a times 2 9 4
gamerule doImmediateRespawn true

tellraw @a [{"text": "The Ultimate Hunt Pack","bold": true, "color": "green", "extra": [{"text": " has loaded!", "bold": false}]}]

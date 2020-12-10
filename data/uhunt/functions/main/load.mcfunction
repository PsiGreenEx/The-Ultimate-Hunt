#> uhunt:main/load
#
# Runs at loading of datapack.
#
# @context main
# @handles #minecraft:load

#declare storage uhunt:config Config file for game settings.

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
#> Trigger for getting a new compass. Tick cleared.
scoreboard objectives add compass trigger
#> Detects when compass is dropped. Tick cleared.
scoreboard objectives add compassdrop minecraft.dropped:minecraft.compass
#> Universal timer objectives. Generally tick decremented.
scoreboard objectives add timer dummy
#> Tracks number of deaths.
scoreboard objectives add deaths deathCount

# Init config unless already initialized.
# Config options:
#   GraceTimer - Time in ticks for grace period.
#   GraceEnabled - If grace period is enabled.
#   GlowingRunners - If runners have constant glowing effect.
data modify storage uhunt:config {} merge value {GraceTimer:600, GraceEnabled:True, GlowingRunners:False}

tellraw @a [{"text": "The Ultimate Hunt Pack","bold": true, "color": "green", "extra": [{"text": " has loaded!", "bold": false}]}]

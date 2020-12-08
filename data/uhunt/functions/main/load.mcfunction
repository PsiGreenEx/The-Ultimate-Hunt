# Add teams
team add hunter
team add runner
team add spectator

# Adjust team colors
team modify hunter color red
team modify runner color green
team modify spectator color gray

# Init objectives
scoreboard objectives add compass trigger
scoreboard objectives add compassdrop minecraft.dropped:minecraft.compass
scoreboard objectives add timer dummy
scoreboard objectives add deaths deathCount

# Init config unless already initialized.
# Config options:
#   GraceTimer - Time in ticks for grace period
#   GraceEnabled - If grace period is enabled.
#   GlowingRunners - If runners have constant glowing effect.
data modify storage uhunt:config {} merge value {GraceTimer:600, GraceEnabled:True, GlowingRunners:False}

tellraw @a [{"text": "The Ultimate Hunt Pack has loaded!", "color": "green"}]

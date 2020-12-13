#> uhunt:game_states/grace/end
#
# Code to run at the end of grace period
#
# @context Final tick of grace period.

# Title "Hunters Go!" and ping.
title @a title {"text": "Hunters Go!","bold": true,"color": "red"}
tellraw @a {"text": "Hunters Go!","bold": true,"color": "red"}
playsound block.note_block.pling master @s ~ ~ ~ 100 2

# Clear Bossbar
bossbar remove uhunt:timer

# Run Start2
function uhunt:game_states/hunt/start2

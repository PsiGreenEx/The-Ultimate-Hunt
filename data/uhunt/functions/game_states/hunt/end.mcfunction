#> uhunt:game_states/hunt/end
#
# Runs when hunt is ended.
#
# @input $HuntWin will either be 0 for hunter win or 1 for runner victory
# @within uhunt:game_states/hunt/tick

# End hunt.
scoreboard players set $Hunt _ 0

# Hunters win
execute if score $HuntWin _ matches 0 run title @a title {"text":"Hunters win!","bold": true,"color": "red"}
execute if score $HuntWin _ matches 0 run tellraw @a {"text":"Hunters win!","bold": true,"color": "red"}

# Runners win
execute if score $HuntWin _ matches 1 run title @a title {"text":"Runners win!","bold": true,"color": "green"}
execute if score $HuntWin _ matches 1 run tellraw @a {"text":"Runners win!","bold": true,"color": "green"}

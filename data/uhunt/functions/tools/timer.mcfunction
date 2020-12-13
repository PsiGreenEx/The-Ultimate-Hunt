#> uhunt:tools/timer
#
# Runs display code for timer.
#
# @within uhunt:game_states/hunt/tick

# Get minutes($temp3) and seconds($temp2) offset by one second
scoreboard players set $temp _ 20
scoreboard players operation $temp2 _ = $GameTimer timer
scoreboard players operation $temp2 _ += $temp _
scoreboard players operation $temp2 _ /= $temp _
scoreboard players set $temp _ 60
scoreboard players operation $temp3 _ = $temp2 _
scoreboard players operation $temp2 _ %= $temp _
scoreboard players operation $temp3 _ /= $temp _

# Set name
execute if score $temp2 _ matches 10.. run bossbar set uhunt:timer name [{"text": "Time Left: "},{"score": {"objective": "_","name": "$temp3"}},{"text": ":"},{"score": {"objective": "_","name": "$temp2"}}]
execute unless score $temp2 _ matches 10.. run bossbar set uhunt:timer name [{"text": "Time Left: "},{"score": {"objective": "_","name": "$temp3"}},{"text": ":0"},{"score": {"objective": "_","name": "$temp2"}}]

# Set value
execute store result bossbar uhunt:timer value run scoreboard players get $GameTimer timer

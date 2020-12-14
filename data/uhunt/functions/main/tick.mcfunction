#> uhunt:main/tick
#
# Runs every tick
#
# @context main

scoreboard players enable @a[tag=uhunt.admin] config

# If $GraceTimer is above 0 then run Grace
execute if score $GraceTimer timer matches 1.. run function uhunt:game_states/grace/tick

# If $Hunt is 1, run Hunt
execute if score $Hunt _ matches 1 run function uhunt:game_states/hunt/tick

# If $Hunt is 0, run book code
execute if score $Hunt _ matches 0 as @a[tag=uhunt.admin] if score @s config matches 1.. run function uhunt:tools/book
execute if score $Hunt _ matches 0 as @a[tag=uhunt.admin] unless score @s edit matches -999 run function uhunt:tools/edit

# end code
function uhunt:main/end

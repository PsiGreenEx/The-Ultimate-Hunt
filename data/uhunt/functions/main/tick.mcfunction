#> uhunt:main/tick
#
# Runs every tick
#
# @context main

# If $GraceTimer is above 0 then run Grace
execute if score $GraceTimer timer matches 1.. run function uhunt:game_states/grace/tick

# If $Hunt is 1, run Hunt
execute if score $Hunt _ matches 1 run function uhunt:game_states/hunt/tick

# end code
function uhunt:main/end

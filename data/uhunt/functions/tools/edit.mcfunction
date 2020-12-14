#> uhunt:tools/edit
#
# Used to modify values using the config book
#
# @context as admin when edit != -999
# @within uhunt:main/tick

# Set Grace Timer
execute if score @s value_edit matches 7 store result storage uhunt:system c.GraceTimer int 1 run scoreboard players get @s edit
execute if score @s value_edit matches 7 unless score @s edit matches -1 run tellraw @a [{"text": "The grace period timer has been updated to "},{"score": {"name":"@s","objective": "edit"}}," ticks."]
execute if score @s value_edit matches 7 if score @s edit matches -1 run tellraw @a [{"text": "Grace period has been disabled."}]

# Reset edit
scoreboard players set @s edit -999

# Refresh book
function uhunt:util/config-book

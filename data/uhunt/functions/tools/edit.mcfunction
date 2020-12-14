#> uhunt:tools/edit
#
# Used to modify values using the config book
#
# @context as admin when edit != -999
# @within uhunt:main/tick

# Set Grace Timer
execute if score @s value_edit matches 7 store result storage uhunt:system c.GraceTimer int 1 run scoreboard players get @s edit
execute if score @s value_edit matches 7 unless score @s edit matches -1 run tellraw @a [{"text":"[","italic": true},{"selector":"@s"},{"text": "] The grace period timer has been updated to "},{"score": {"name":"@s","objective": "edit"}}," ticks."]
execute if score @s value_edit matches 7 if score @s edit matches -1 run tellraw @a [{"text":"[","italic": true},{"selector":"@s"},{"text": "] Grace period has been disabled."}]

# Set Game Timer
execute if score @s value_edit matches 8 store result storage uhunt:system c.WinCon.GameTimer int 1 run scoreboard players get @s edit
execute if score @s value_edit matches 8 unless score @s edit matches -1 run tellraw @a [{"text":"[","italic": true},{"selector":"@s"},{"text": "] The game timer has been updated to "},{"score": {"name":"@s","objective": "edit"}}," ticks."]
execute if score @s value_edit matches 8 if score @s edit matches -1 run tellraw @a [{"text":"[","italic": true},{"selector":"@s"},{"text": "] The game timer has been disabled."}]

# Set Hunter Life Count
execute if score @s value_edit matches 10 store result storage uhunt:system c.WinCon.Lives[0] int 1 run scoreboard players get @s edit
execute if score @s value_edit matches 10 unless score @s edit matches -1 run tellraw @a [{"text":"[","italic": true},{"selector":"@s"},"] The ",{"text": "hunter","color": "red"}," life count has been updated to ",{"score": {"name":"@s","objective": "edit"}},"."]
execute if score @s value_edit matches 10 if score @s edit matches -1 run tellraw @a [{"text":"[","italic": true},{"selector":"@s"},"] The ",{"text": "hunter","color": "red"}," life count has been updated to infinite."]

# Set Runner Life Count
execute if score @s value_edit matches 11 store result storage uhunt:system c.WinCon.Lives[1] int 1 run scoreboard players get @s edit
execute if score @s value_edit matches 11 unless score @s edit matches -1 run tellraw @a [{"text":"[","italic": true},{"selector":"@s"},"] The ",{"text": "runner","color": "green"}," life count has been updated to ",{"score": {"name":"@s","objective": "edit"}},"."]
execute if score @s value_edit matches 11 if score @s edit matches -1 run tellraw @a [{"text":"[","italic": true},{"selector":"@s"},"] The ",{"text": "runner","color": "green"}," life count has been updated to infinite."]

# Reset edit
scoreboard players set @s edit -999

# Refresh book
function uhunt:util/config-book

#> uhunt:game_states/hunt/finalten
#
# Displays a countdown for the last ten seconds.
#
# @input $GameTimer timer


execute if score $GameTimer timer matches 200 run title @a subtitle "10"
execute if score $GameTimer timer matches 200 run title @a title ""
execute if score $GameTimer timer matches 200 run tellraw @a "10"
execute if score $GameTimer timer matches 200 as @a run playsound block.note_block.bass master @s ~ ~ ~ 100000

execute if score $GameTimer timer matches 180 run title @a subtitle "9"
execute if score $GameTimer timer matches 180 run title @a title ""
execute if score $GameTimer timer matches 180 run tellraw @a "9"
execute if score $GameTimer timer matches 180 as @a run playsound block.note_block.bass master @s ~ ~ ~ 100000

execute if score $GameTimer timer matches 160 run title @a subtitle "8"
execute if score $GameTimer timer matches 160 run title @a title ""
execute if score $GameTimer timer matches 160 run tellraw @a "8"
execute if score $GameTimer timer matches 160 as @a run playsound block.note_block.bass master @s ~ ~ ~ 100000

execute if score $GameTimer timer matches 140 run title @a subtitle "7"
execute if score $GameTimer timer matches 140 run title @a title ""
execute if score $GameTimer timer matches 140 run tellraw @a "7"
execute if score $GameTimer timer matches 140 as @a run playsound block.note_block.bass master @s ~ ~ ~ 100000

execute if score $GameTimer timer matches 120 run title @a subtitle "6"
execute if score $GameTimer timer matches 120 run title @a title ""
execute if score $GameTimer timer matches 120 run tellraw @a "6"
execute if score $GameTimer timer matches 120 as @a run playsound block.note_block.bass master @s ~ ~ ~ 100000

execute if score $GameTimer timer matches 100 run title @a subtitle "5"
execute if score $GameTimer timer matches 100 run title @a title ""
execute if score $GameTimer timer matches 100 run tellraw @a "5"
execute if score $GameTimer timer matches 100 as @a run playsound block.note_block.bass master @s ~ ~ ~ 100000

execute if score $GameTimer timer matches 80 run title @a subtitle "4"
execute if score $GameTimer timer matches 80 run title @a title ""
execute if score $GameTimer timer matches 80 run tellraw @a "4"
execute if score $GameTimer timer matches 80 as @a run playsound block.note_block.bass master @s ~ ~ ~ 100000

execute if score $GameTimer timer matches 60 run title @a subtitle "3"
execute if score $GameTimer timer matches 60 run title @a title ""
execute if score $GameTimer timer matches 60 run tellraw @a "3"
execute if score $GameTimer timer matches 60 as @a run playsound block.note_block.bass master @s ~ ~ ~ 100000

execute if score $GameTimer timer matches 40 run title @a subtitle "2"
execute if score $GameTimer timer matches 40 run title @a title ""
execute if score $GameTimer timer matches 40 run tellraw @a "2"
execute if score $GameTimer timer matches 40 as @a run playsound block.note_block.bass master @s ~ ~ ~ 100000

execute if score $GameTimer timer matches 20 run title @a subtitle "1"
execute if score $GameTimer timer matches 20 run title @a title ""
execute if score $GameTimer timer matches 20 run tellraw @a "1"
execute if score $GameTimer timer matches 20 as @a run playsound block.note_block.bass master @s ~ ~ ~ 100000


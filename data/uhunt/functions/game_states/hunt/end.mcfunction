#> uhunt:game_states/hunt/end
#
# Runs when hunt is ended.
#
# @input $HuntWin will either be 0 for hunter win or 1 for runner victory
# @within uhunt:game_states/hunt/tick

# End hunt.
scoreboard players set $Hunt _ 0
bossbar remove uhunt:timer

# Hunters win
execute if score $HuntWin _ matches 0 run title @a title {"text":"Hunters win!","bold": true,"color": "red"}
execute if score $HuntWin _ matches 0 run tellraw @a {"text":"Hunters win!","bold": true,"color": "red"}
execute if score $HuntWin _ matches 0 as @a[team=hunter] run playsound ui.toast.challenge_complete master @s ~ ~ ~ 1000
execute if score $HuntWin _ matches 0 as @a[team=runner] run playsound entity.zombie_villager.converted master @s ~ ~ ~ 1000
execute if score $HuntWin _ matches 0 at @a[team=hunter] run summon firework_rocket ~ ~ ~ {LifeTime: 25, FireworksItem:{id:"minecraft:firework_rocket",Count:1,tag:{Fireworks:{Flight:2,Explosions:[{Type:1b,Colors:[I;16711680],Flicker:true}]}}}}

# Runners win
execute if score $HuntWin _ matches 1 run title @a title {"text":"Runners win!","bold": true,"color": "green"}
execute if score $HuntWin _ matches 1 run tellraw @a {"text":"Runners win!","bold": true,"color": "green"}
execute if score $HuntWin _ matches 1 as @a[team=runner] run playsound ui.toast.challenge_complete master @s ~ ~ ~ 1000 
execute if score $HuntWin _ matches 1 as @a[team=hunter] run playsound entity.zombie_villager.converted master @s ~ ~ ~ 1000
execute if score $HuntWin _ matches 1 at @a[team=runner] run summon firework_rocket ~ ~ ~ {LifeTime: 25, FireworksItem:{id:"minecraft:firework_rocket",Count:1,tag:{Fireworks:{Flight:2,Explosions:[{Type:1b,Colors:[I;65301],Flicker:true}]}}}}

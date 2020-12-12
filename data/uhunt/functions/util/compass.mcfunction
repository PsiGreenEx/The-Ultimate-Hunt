#> uhunt:util/compass
#
# Clears and gives tracker compass to player
#
# @user
# @context user

clear @s compass{tag:{uhuntid:"tracker"}}
give @s compass{tag:{uhuntid:"tracker"},display:{Name:'{"text": "Tracker Compass","italic": false}'},LodestonePos:{X:0,Y:0,Z:0},LodestoneDimension:"minecraft:overworld",LodestoneTracked:false}

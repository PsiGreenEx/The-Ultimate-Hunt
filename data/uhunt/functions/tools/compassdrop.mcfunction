#> uhunt:tools/compassdrop
#
# Updates the tracker's position to nearest player of opposite team.
#
# @context as and at player who dropped the tracker
# @within uhunt:game_states/hunt/tick

# Set compass owner so no one steals hehe
data modify entity @e[type=item,nbt={Item:{tag:{tag:{uhuntid:"tracker"}}}},sort=nearest,limit=1] Owner set from entity @s UUID

# Update position for hunter
execute if entity @s[team=hunter] run data modify entity @e[type=item,nbt={Item:{tag:{tag:{uhuntid:"tracker"}}}},sort=nearest,limit=1] Item.tag.LodestonePos.X set from entity @e[team=runner,limit=1,sort=nearest] Pos[0]
execute if entity @s[team=hunter] run data modify entity @e[type=item,nbt={Item:{tag:{tag:{uhuntid:"tracker"}}}},sort=nearest,limit=1] Item.tag.LodestonePos.Y set from entity @e[team=runner,limit=1,sort=nearest] Pos[1]
execute if entity @s[team=hunter] run data modify entity @e[type=item,nbt={Item:{tag:{tag:{uhuntid:"tracker"}}}},sort=nearest,limit=1] Item.tag.LodestonePos.Z set from entity @e[team=runner,limit=1,sort=nearest] Pos[2]

# Update position for runner
execute if entity @s[team=runner] run data modify entity @e[type=item,nbt={Item:{tag:{tag:{uhuntid:"tracker"}}}},sort=nearest,limit=1] Item.tag.LodestonePos.X set from entity @e[team=hunter,limit=1,sort=nearest] Pos[0]
execute if entity @s[team=runner] run data modify entity @e[type=item,nbt={Item:{tag:{tag:{uhuntid:"tracker"}}}},sort=nearest,limit=1] Item.tag.LodestonePos.Y set from entity @e[team=hunter,limit=1,sort=nearest] Pos[1]
execute if entity @s[team=runner] run data modify entity @e[type=item,nbt={Item:{tag:{tag:{uhuntid:"tracker"}}}},sort=nearest,limit=1] Item.tag.LodestonePos.Z set from entity @e[team=hunter,limit=1,sort=nearest] Pos[2]

# Update dimension
execute if predicate uhunt:overworld run data modify entity @e[type=item,nbt={Item:{tag:{tag:{uhuntid:"tracker"}}}},sort=nearest,limit=1] Item.tag.LodestoneDimension set value "minecraft:overworld"
execute if predicate uhunt:nether run data modify entity @e[type=item,nbt={Item:{tag:{tag:{uhuntid:"tracker"}}}},sort=nearest,limit=1] Item.tag.LodestoneDimension set value "minecraft:the_nether"
execute if predicate uhunt:end run data modify entity @e[type=item,nbt={Item:{tag:{tag:{uhuntid:"tracker"}}}},sort=nearest,limit=1] Item.tag.LodestoneDimension set value "minecraft:the_end"

# Give compass back
tp @e[type=item,nbt={Item:{tag:{tag:{uhuntid:"tracker"}}}},sort=nearest,limit=1] @s
data merge entity @e[type=item,nbt={Item:{tag:{tag:{uhuntid:"tracker"}}}},sort=nearest,limit=1] {PickupDelay:0}

# Tellraw
execute if entity @s[team=hunter] if entity @e[team=runner] run tellraw @s [{"text": "Tracking "},{"selector": "@e[team=runner,limit=1,sort=nearest]"},{"text": "..."}]
execute if entity @s[team=hunter] unless entity @e[team=runner] run tellraw @s [{"text": "Can't find entity..."}]
execute if entity @s[team=runner] if entity @e[team=hunter] run tellraw @s [{"text": "Tracking "},{"selector": "@e[team=hunter,limit=1,sort=nearest]"},{"text": "..."}]
execute if entity @s[team=runner] unless entity @e[team=hunter] run tellraw @s [{"text": "Can't find entity..."}]

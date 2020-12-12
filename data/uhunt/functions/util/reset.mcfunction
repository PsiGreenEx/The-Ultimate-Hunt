#> uhunt:util/reset
#
# Uninstall and reload datapack.
#
# @user

#declare tag uhunt.reset Prevents uhunt:util/reset from disabling the pack.

# Prevent uninstall from disabling the pack
tag @s add uhunt.reset

# Uninstall
execute as @s run function uhunt:util/uninstall
tag @s remove uhunt.reset

# Reload
function uhunt:main/load

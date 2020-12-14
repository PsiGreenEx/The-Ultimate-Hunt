# The Ultimate Hunt
A manhunt-based datapack with *(eventually)* many features!

## The goal
The goal with this datapack is to allow players to create a highly customizable manhunt gamemode to play and share with others. Suggestions are always welcome.  

There may be interesting features that could be added but wont be used very frequently. Those features will be added either as part of a separate extension datapack, or as its own module to be added later.

## Current state
The pack in its current is usable, but not very user friendly. I have implemented the beginnings of a config editor book to allow players to change the rules without the use of commands, but it is incomplete.

## How to use
Before you begin, each play must join their respective team with `/team join hunter` or `/team join runner`. Any players not in a team will be made a spectator automatically.  
Then, run the command `/function uhunt:game_states/hunt/start1` to begin the game.

To edit the rules, first view the current config using this command:  
`/data get storage uhunt:system c`  
Then edit the rule using this command:  
`/data modify storage uhunt:system c.<RuleName> set value <Value>`  
To reset the rules back to default, use this command:  
`/data modify storage uhunt:system c set from storage uhunt:system p.Default`  
To save current rules as a preset, use this command:  
`/data modify storage uhunt:system p.<UniquePresetName> set from storage uhunt:system c`

The current config is formatted as such:  
- `DisplayTimer` - bool - If GameTimer is visible.
- `FinalTenCountdown` - bool - If dramatically countdown at 10 secs left.
- `GraceTimer` - int - Time in ticks for grace period. Disabled if -1.
- `Glowing[hunter,runner]` - bool - If team will have constant glowing effect.
- `Compass[hunter,runner]` - bool - If team can use a compass.
- `WinCon` - tag - Contains data pertaining to runner and hunter win/loss conditions.
    - `GameTimer` - int - Time in ticks until the game ends and the runner wins.Disabled if -1.
    - `DragonKill` - int - 0 Killing Dragon doesn't win the game. 1 Whichever team kills the dragon wins. 2 If dragon is killed at all, runners win.
    - `Lives[hunter,runner]` - int - How many times each player from team or teamcan die. Infinite if -1.
    - `TeamLives` - bool - If the teams share lives collectively.
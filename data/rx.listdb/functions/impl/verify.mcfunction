# By: rx97
# 23 Oct 20
# 
#> Verify selected is 1 and correct idx
#> input: $idx rx.temp
#> output: $verified rx.temp 0/1 (0: failed, 1: success)

execute store result score $size rx.temp if data storage rx:global listdb.entries[{selected:1b, search:1b}]

#> get idx
execute store result score $idx.check rx.temp run data get storage rx:global listdb.entries[{selected:1b, search:1b}].idx
execute unless data storage rx:global listdb.entries[{selected:1b, search:1b}] run scoreboard players set $idx.check rx.temp -1

#> stores 1 in $verified if:
#> - $size == 1
#> - $idx == $idx.check
execute store result score $verified rx.temp if score $size rx.temp matches 1
execute if score $verified rx.temp matches 1 store result score $verified rx.temp if score $idx rx.temp = $idx.check rx.temp

# clean up
scoreboard players reset $idx.check rx.temp

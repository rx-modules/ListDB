# By: rx97
# 25 Oct 20
# 
#> Select Data: Output selected:1b, $out.selected=0/1

#> returns $verified
function rx.listdb:impl/verify

#> if $verified == 0, reselect
execute if score $verified rx.temp matches 0 if data storage rx:global listdb.entries[] run data modify storage rx:global listdb.entries[].selected set value 0b
execute if score $verified rx.temp matches 0 if data storage rx:global listdb.entries[] run data modify storage rx:global listdb.entries[{search:1b}].selected set value 1b
execute if score $verified rx.temp matches 0 if data storage rx:global listdb.entries[] run function rx.listdb:impl/fix_db
execute if score $verified rx.temp matches 0 if data storage rx:global listdb.entries[] run function rx.listdb:impl/select/bit0

#> reverify
scoreboard players operation $idx rx.temp = $in.idx rx.io
execute if score $verified rx.temp matches 0 run function rx.listdb:impl/verify

#> else: do nothing, already selected

#> store success
scoreboard players operation $selected rx.temp = $verified rx.temp

#> if fail, unselect all
execute if score $verified rx.temp matches 0 run data modify storage rx:global listdb.entries[].selected set value 0b

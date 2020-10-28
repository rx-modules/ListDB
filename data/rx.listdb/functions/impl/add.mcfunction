# By: rx97
# 25 Oct 20
# 
#> Add entry.

#> We have to select to chk unfortuntely
function rx.listdb:impl/select

scoreboard players operation $idx rx.temp = $in.idx rx.io

execute if score $selected rx.temp matches ..0 if data storage rx:global listdb.entries[] run data modify storage rx:global listdb.entries[].selected set value 0b
execute if score $selected rx.temp matches ..0 run data modify storage rx:global listdb.entries append value {data:{}, selected:1b, search:0b}
execute if score $selected rx.temp matches ..0 run data modify storage rx:global listdb.entries[-1].list set from storage rx:io listdb.list_name
execute if score $selected rx.temp matches ..0 run execute store result storage rx:global listdb.entries[-1].idx int 1 run scoreboard players get $idx rx.temp
execute if score $selected rx.temp matches ..0 run function rx.listdb:impl/idx_to_bits

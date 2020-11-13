# By: rx97
# 10 Nov 20
# 
#> Adds an entry

execute if data storage rx:global listdb.entries[] run data modify storage rx:global listdb.entries[].selected set value 0b
data modify storage rx:global listdb.entries append value {data:{}, selected:1b, search:0b}
data modify storage rx:global listdb.entries[-1].list set from storage rx:io listdb.list_name
execute store result storage rx:global listdb.entries[-1].idx int 1 run scoreboard players get $idx rx.temp
function rx.listdb:impl/idx_to_bits

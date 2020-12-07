# By: rx97
# 25 Oct 20
# 
#> Selects an entry
#> input:
#>   index (score):   rx.io $in.idx 
#>   /data modify storage rx:global listdb.entries[{list:'<list name>'}].search set value 1b
#> output:
#>   success (score): rx.io $success 0/1            (boolean)
#>   data (storage):  listdb.entries[{selected:1b}] (nbt)

function rx.listdb:impl/fix_db

scoreboard players operation $idx rx.temp = $in.idx rx.io
function rx.listdb:impl/select
scoreboard players operation $success rx.io = $selected rx.temp
data modify storage rx:global listdb.entries[].search set value 0b

function rx.listdb:impl/fix_db

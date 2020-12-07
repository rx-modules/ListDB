# By: rx97
# 25 Oct 20
# 
#> Saves the entry to ListDB
#> input:
#>   index (score):   rx.io $in.idx
#>   /data modify storage rx:global listdb.entries[{list:'<list name>'}].search set value 1b
#> output:
#>   success (score): rx.io $success 0/1       (boolean)
#>   data saved to rx:global listdb.entries

function rx.listdb:impl/fix_db

scoreboard players operation $idx rx.temp = $in.idx rx.io
function rx.listdb:impl/save
scoreboard players operation $success rx.io = $selected rx.temp
data modify storage rx:global listdb.entries[].search set value 0b

function rx.listdb:impl/fix_db

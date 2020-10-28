# By: rx97
# 26 Oct 20
# 
#> Creates an entry
#> input:
#>   index (score):      rx.io $in.idx
#>   list (storage):     rx.io listdb.list_name (string)
#>   /data modify storage rx:io listdb.entries[{list:'<list name>'}].search set value 1b
#> output:
#>   success (score):    rx.io $success 0/1     (boolean)

function rx.listdb:impl/fix_db

scoreboard players operation $idx rx.temp = $in.idx rx.io

execute if data storage rx:io listdb.list_name run function rx.listdb:impl/add

execute store success score $success rx.io if data storage rx:io listdb.list_name
execute if score $success rx.io matches 1 if score $selected rx.io matches 1 run scoreboard players set $success rx.io 0

data modify storage rx:global listdb.entries[].search set value 0b
function rx.listdb:impl/fix_db

data remove storage rx:io listdb.list_name

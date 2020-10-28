# By: rx97
# 26 Oct 20
# 
#> Removes an entry
#> input:
#>   index (score):      rx.io $in.idx
#>   /data modify storage rx:io listdb.entries[{list:'<list name>'}].search set value 1b
#> output:
#>   success (score):    rx.io $success 0/1   (boolean)

function rx.listdb:impl/fix_db

scoreboard players operation $idx rx.temp = $in.idx rx.io
function rx.listdb:impl/remove
data modify storage rx:global listdb.entries[].search set value 0b

function rx.listdb:impl/fix_db

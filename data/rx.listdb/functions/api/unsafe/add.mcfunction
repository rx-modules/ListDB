# By: rx97
# 10 Nov 20
# 
#> Creates an entry w/o chking
#> input:
#>   index (score):       rx.io $in.idx
#>   list (storage):      rx.io listdb.list_name (string)
#> output:
#>   success (score):     rx.io $success 0/1     (boolean)
#>   note, will always be successful

#> pure add
scoreboard players operation $idx rx.temp = $in.idx rx.io
execute if data storage rx:io listdb.list_name run function rx.listdb:impl/add

#> success on `list_name`
execute store success score $success rx.io if data storage rx:io listdb.list_name
data remove storage rx:io listdb.list_name

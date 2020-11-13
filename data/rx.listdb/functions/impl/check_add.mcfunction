# By: rx97
# 25 Oct 20
# 
#> Checks if we can add an entry

#> Chk if idx exists
function rx.listdb:impl/select

scoreboard players operation $idx rx.temp = $in.idx rx.io

execute if score $selected rx.temp matches ..0 run function rx.listdb:impl/add

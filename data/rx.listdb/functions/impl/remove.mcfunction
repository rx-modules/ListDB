# By: rx97
# 26 Oct 20
# 
#> Removes an entry

#> We have to select to chk unfortuntely
function rx.listdb:impl/select

execute if score $selected rx.temp matches 1 run data remove storage rx:global listdb.entries[{selected:1b}]

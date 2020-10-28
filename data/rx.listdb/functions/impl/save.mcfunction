# By: rx97
# 25 Oct 20
# 
#> Saves the entry

function rx.listdb:impl/select

#> if selected
execute if score $selected rx.temp matches 1 run data modify storage rx:global listdb.entries[{selected:1b}].data set from storage rx:io listdb.entry.data

#> else

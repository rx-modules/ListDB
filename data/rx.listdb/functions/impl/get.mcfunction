# By: rx97
# 25 Oct 20
# 
#> Gets an entry, overwrites successful or not

function rx.listdb:impl/select

#> if selected
execute if score $selected rx.temp matches 1 run data modify storage rx:io listdb.entry set from storage rx:global listdb.entries[{selected:1b}]
execute if score $selected rx.temp matches 1 run data remove storage rx:io listdb.entry.bits

#> else, clear rx:io
execute if score $selected rx.temp matches 0 run data remove storage rx:io listdb.entry

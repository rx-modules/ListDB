# By: rx97
# 26 Oct 20
# 
#> fixes junk data

execute unless data storage rx:global listdb.entries[0].data run data remove storage rx:global listdb.entries[0]
execute unless data storage rx:global listdb.entries[-1].data run data remove storage rx:global listdb.entries[-1]

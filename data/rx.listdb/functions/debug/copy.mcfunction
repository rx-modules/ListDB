# By: rx97
# 26 Oct 20
# 
#> @s: player
#> copies w/o bits to see easier

data modify storage rx:debug listdb set from storage rx:global listdb
data remove storage rx:debug listdb.entries[].bits

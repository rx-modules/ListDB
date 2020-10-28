# By: rx97
# 27 Oct 20
# 
#> _iter

# # test invariants
# execute store success score $debug.check rx.temp unless data storage rx:debug listdb.entries[-1].idx
# execute if score $debug.check rx.temp matches 1 run tellraw @a ["", {"text": "Invarient Failed: No Idx", "color":"gold"}]
# execute unless score $debug.check rx.temp matches 1 store result score $debug.idx rx.temp run data get storage rx:debug listdb.entries[-1].idx

# execute if score $debug.check rx.temp matches 1 run tellraw @a ["", {"text": "Invarient Failed: No List", "color":"gold"}]

# execute store success score $debug.check rx.temp unless data storage rx:debug listdb.entries[-1].data
# execute if score $debug.check rx.temp matches 1 run tellraw @a ["", {"text": "Invarient Failed: No Data", "color":"gold"}]

# execute store success score $debug.check rx.temp unless data storage rx:debug listdb.entries[-1].list
# execute if score $debug.check rx.temp matches 1 run tellraw @a ["", {"text": "Invarient Failed: No List", "color":"gold"}]

# execute store success score $debug.check rx.temp unless data storage rx:debug listdb.entries[-1].list
# execute if score $debug.check rx.temp matches 1 run tellraw @a ["", {"text": "Invarient Failed: No List", "color":"gold"}]

# # iter
# data remove storage rx:debug listdb.entries[-1]
# scoreboard players remove $loop rx.temp 1
# execute if score $loop rx.temp matches 1.. run function rx.listdb:tests/check_entry

# By: rx97
execute if score $bit rx.temp matches 20 if data storage rx:global listdb.entries[{bits:{b2:20b}}] run data modify storage rx:global listdb.entries[{bits:{b2:20b}}].bits.select set value 1b
execute if score $bit rx.temp matches 21 if data storage rx:global listdb.entries[{bits:{b2:21b}}] run data modify storage rx:global listdb.entries[{bits:{b2:21b}}].bits.select set value 1b
execute if score $bit rx.temp matches 22 if data storage rx:global listdb.entries[{bits:{b2:22b}}] run data modify storage rx:global listdb.entries[{bits:{b2:22b}}].bits.select set value 1b
execute if score $bit rx.temp matches 23 if data storage rx:global listdb.entries[{bits:{b2:23b}}] run data modify storage rx:global listdb.entries[{bits:{b2:23b}}].bits.select set value 1b
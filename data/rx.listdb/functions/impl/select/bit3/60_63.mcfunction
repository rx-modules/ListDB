# By: rx97
execute if score $bit rx.temp matches 60 if data storage rx:global listdb.entries[{bits:{b3:60b}}] run data modify storage rx:global listdb.entries[{bits:{b3:60b}}].bits.select set value 1b
execute if score $bit rx.temp matches 61 if data storage rx:global listdb.entries[{bits:{b3:61b}}] run data modify storage rx:global listdb.entries[{bits:{b3:61b}}].bits.select set value 1b
execute if score $bit rx.temp matches 62 if data storage rx:global listdb.entries[{bits:{b3:62b}}] run data modify storage rx:global listdb.entries[{bits:{b3:62b}}].bits.select set value 1b
execute if score $bit rx.temp matches 63 if data storage rx:global listdb.entries[{bits:{b3:63b}}] run data modify storage rx:global listdb.entries[{bits:{b3:63b}}].bits.select set value 1b
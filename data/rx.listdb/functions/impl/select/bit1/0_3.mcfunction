# By: rx97
execute if score $bit rx.temp matches 0 if data storage rx:global listdb.entries[{bits:{b1:0b}}] run data modify storage rx:global listdb.entries[{bits:{b1:0b}}].bits.select set value 1b
execute if score $bit rx.temp matches 1 if data storage rx:global listdb.entries[{bits:{b1:1b}}] run data modify storage rx:global listdb.entries[{bits:{b1:1b}}].bits.select set value 1b
execute if score $bit rx.temp matches 2 if data storage rx:global listdb.entries[{bits:{b1:2b}}] run data modify storage rx:global listdb.entries[{bits:{b1:2b}}].bits.select set value 1b
execute if score $bit rx.temp matches 3 if data storage rx:global listdb.entries[{bits:{b1:3b}}] run data modify storage rx:global listdb.entries[{bits:{b1:3b}}].bits.select set value 1b
# By: rx97
execute if score $bit rx.temp matches 12 if data storage rx:global listdb.entries[{bits:{b3:12b}}] run data modify storage rx:global listdb.entries[{bits:{b3:12b}}].bits.select set value 1b
execute if score $bit rx.temp matches 13 if data storage rx:global listdb.entries[{bits:{b3:13b}}] run data modify storage rx:global listdb.entries[{bits:{b3:13b}}].bits.select set value 1b
execute if score $bit rx.temp matches 14 if data storage rx:global listdb.entries[{bits:{b3:14b}}] run data modify storage rx:global listdb.entries[{bits:{b3:14b}}].bits.select set value 1b
execute if score $bit rx.temp matches 15 if data storage rx:global listdb.entries[{bits:{b3:15b}}] run data modify storage rx:global listdb.entries[{bits:{b3:15b}}].bits.select set value 1b
# By: rx97
execute if score $bit rx.temp matches 4 if data storage rx:global listdb.entries[{bits:{b4:4b}}] run data modify storage rx:global listdb.entries[{bits:{b4:4b}}].bits.select set value 1b
execute if score $bit rx.temp matches 5 if data storage rx:global listdb.entries[{bits:{b4:5b}}] run data modify storage rx:global listdb.entries[{bits:{b4:5b}}].bits.select set value 1b
execute if score $bit rx.temp matches 6 if data storage rx:global listdb.entries[{bits:{b4:6b}}] run data modify storage rx:global listdb.entries[{bits:{b4:6b}}].bits.select set value 1b
execute if score $bit rx.temp matches 7 if data storage rx:global listdb.entries[{bits:{b4:7b}}] run data modify storage rx:global listdb.entries[{bits:{b4:7b}}].bits.select set value 1b
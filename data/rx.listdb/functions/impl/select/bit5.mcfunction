# By: rx97
data modify storage rx:global listdb.entries[].bits.select set value 0b
scoreboard players operation $bit rx.temp = $uid rx.temp
scoreboard players operation $bit rx.temp %= $64 rx.int
function rx.listdb:impl/select/bit5/0_63
scoreboard players operation $uid rx.temp /= $64 rx.int
data modify storage rx:global listdb.entries[{bits:{select:0b}}].selected set value 0b
execute store result score $size rx.temp if data storage rx:global listdb.entries[{selected:1b}]
execute if score $size rx.temp matches 2.. run function rx.listdb:impl/select/bit6

# By: rx97
# Generated on: 27 Oct 20

scoreboard players operation $bit rx.temp = $idx rx.temp
scoreboard players operation $bit rx.temp %= $2 rx.int
execute unless score $bit rx.temp matches 0 if data storage rx:global listdb.entries[{bits:{b27:0b}}] run data modify storage rx:global listdb.entries[{bits:{b27:0b}}].selected set value 0b
execute unless score $bit rx.temp matches 1 if data storage rx:global listdb.entries[{bits:{b27:1b}}] run data modify storage rx:global listdb.entries[{bits:{b27:1b}}].selected set value 0b
execute if score $idx rx.temp matches ..0 run scoreboard players set $idx rx.temp -1
scoreboard players operation $idx rx.temp /= $2 rx.int
execute store result score $size rx.temp if data storage rx:global listdb.entries[{selected:1b}]
execute if score $size rx.temp matches 2.. if score $idx rx.temp matches ..-1 run function rx.listdb:impl/select/bit28

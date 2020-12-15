# By: rx97
# 27 Oct 20
# 
#> iterate through db to test state

# #define storage rx:debug

# function rx.listdb:debug/copy
# execute store result score $loop rx.temp if data storage rx:debug listdb.entries[] 
# function rx.listdb:tests/check_entry

execute as @e[type=armor_stand, tag=test, limit=1] if score @s test_idx matches 9 run data modify storage rx:debug test.entity set from entity @s ArmorItems[3].tag.data
execute as @e[type=armor_stand, tag=test, limit=1] if score @s test_idx matches 9 run data modify entity @s ArmorItems[3].tag.data set from storage rx:debug test.entity

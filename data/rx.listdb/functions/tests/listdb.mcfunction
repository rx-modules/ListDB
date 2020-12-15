# By: rx97
# 27 Oct 20
# 
#> iterate through db to test state

# #define storage rx:debug

# function rx.listdb:debug/copy
# execute store result score $loop rx.temp if data storage rx:debug listdb.entries[] 
# function rx.listdb:tests/check_entry

execute as @e[type=armor_stand, tag=test, limit=1] if score @s test_idx matches 9 run scoreboard players set $in.idx rx.io 9
function rx.listdb:api/get
function rx.listdb:api/save

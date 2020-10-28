# By: rx97
# 27 Oct 20
# 
#> Tests the base case for add

#> Reset

function rx.listdb:reset

# add
scoreboard players set $in.idx rx.io 0
data modify storage rx:io listdb.list_name set value 'test'
function rx.listdb:api/add

scoreboard players set $in.idx rx.io 1
data modify storage rx:io listdb.list_name set value 'test'
function rx.listdb:api/add

scoreboard players set $in.idx rx.io 2
data modify storage rx:io listdb.list_name set value 'test'
function rx.listdb:api/add

function rx.lisbdb:debug/copy

# test
execute store result score $size rx.temp if data storage rx:debug listdb.entries[]
execute if score $size rx.temp matches 3 run scoreboard players add $success.add rx.test 1
execute unless score $size rx.temp matches 3 run scoreboard players add $failure.add rx.test 1

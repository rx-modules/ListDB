# By: rx97
# 27 Oct 20
# 
#> iterate through db to test state

# #define storage rx:debug

# function rx.listdb:debug/copy
# execute store result score $loop rx.temp if data storage rx:debug listdb.entries[] 
# function rx.listdb:tests/check_entry

# By: rx97
# 12 Nov 20
# 
#> Checks version #load:load

#define entity @s
#define storage rx:global
#define storage rx:temp
#define storage rx:info
#define storage rx:io

#> Info!
data modify storage rx:info listdb.name set value 'ListDB'
data modify storage rx:info listdb.pretty_name set value '[{"text":"L","color":"#8ec53c"},{"text":"i","color":"#76c447"},{"text":"s","color":"#5ec352"},{"text":"t","color":"#46c25e"},{"text":"D","color":"#2ec169"},{"text":"B","color":"#17c175"}]'

function rx.listdb:init

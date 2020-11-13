# By: rx97
# 23 Oct 20
# 
#> Creates Objs. Called from #load:load

#define storage rx:global
#define storage rx:io


# Lantern Load
scoreboard players set rx.ListDB load 1

scoreboard objectives add rx.int dummy
scoreboard objectives add rx.temp dummy
scoreboard objectives add rx.io dummy

scoreboard players set $2 rx.int 2
scoreboard players set $3 rx.int 3
scoreboard players set $16 rx.int 16
scoreboard players set $19 rx.int 19
scoreboard players set $64 rx.int 64
scoreboard players set $256 rx.int 256

tellraw @a[tag=rx.admin] [{"nbt": "listdb.pretty_name", "storage": "rx:info", "interpret": true}, " ", {"text":"L","color":"#8ec53c"},{"text":"o","color":"#76c447"},{"text":"a","color":"#5ec352"},{"text":"d","color":"#46c25e"},{"text":"e","color":"#2ec169"},{"text":"d","color":"#17c175"}]

# schedule function rx.listdb:tick 1t replace

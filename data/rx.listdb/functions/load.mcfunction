# By: rx97
# 23 Oct 20
# 
#> Creates Objs. Called from #load:load

#define storage rx:global
#define storage rx:io


# Lantern Load
scoreboard players set ListDB load 1

scoreboard objectives add rx.int dummy
scoreboard objectives add rx.temp dummy
scoreboard objectives add rx.io dummy

scoreboard players set $2 rx.int 2
scoreboard players set $3 rx.int 3
scoreboard players set $16 rx.int 16
scoreboard players set $19 rx.int 19
scoreboard players set $64 rx.int 64
scoreboard players set $256 rx.int 256

tellraw @a[tag=rx.admin] {"text":"ListDB Loaded"}

# schedule function rx.listdb:tick 1t replace

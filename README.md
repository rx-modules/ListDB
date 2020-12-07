# ListDB
An arbitrary NBT list database to use w/ Minecraft datapacks. This datapack is in heavy development. If you are interested in the latest happenings with this project, please join my [discord](https://discord.gg/u5Xfxw8y9n).

## What is this?
This datapack utilizes the method from [PlayerDB](https://github.com/rx-modules/PlayerDB) to allow for efficient nbt lists with O(log(n)) score access (actually, that's worse case, but average case is much better).

Usually, if you want to access a certain index in an nbt list, you have to rotate through all the values (O(n) copies) until you find your values. This datapack enables you to store your data w/o a) copying every bit of data b) having faster access to the data.

## How do I use this?

    # First we need to setup our list
    scoreboard players set $in.idx rx.io #
    data modify storage rx:io listdb.list_name set value 'my-list'
    data modify storage rx:global listdb.entries[{list:'my-list'}].search set value 1b
    function rx.listdb:api/add
    
    # Note, there are many steps here but essentially we have to a) start w/ an index, b) name the list, c) search to ensure the index doesn't exist
    # If you know your list entry doesn't exist already, you can try an unsafe/add/. This saves a O(log(n)) search step and serves as an 'append'.
    scoreboard players set $in.idx rx.io #
    data modify storage rx:io listdb.list_name set value 'my-list'
    function rx.listdb:api/unsafe_add

    # Getting values is easy here:
    scoreboard players set $in.idx rx.io #
    data modify storage rx:global listdb.entries[{list:'my-list'}].search set value 1b
    function rx.listdb:api/get
    
    # Saving, note: consecutive gets/saves do not concur extra look-ups
    data modify storage rx:io listdb.entry.data.town set value {eggs: 3, chickens: 2}
    data modify storage rx:global listdb.entries[{list:'my-list'}].search set value 1b
    function rx.listdb:api/save
    
    # Selecting, essentially a way to interface w/ the list w/o any copies, working with a 'live database'
    scoreboard players set $in.idx rx.io #
    data modify storage rx:global listdb.entries[{list:'my-list'}].search set value 1b
    function rx.listdb:api/select
    data modify storage rx:global listdb.entries[{selected:1b}].data.town set value {eggs: 3, chickens: 2}
    
    # Finally, remove, a way to delete an entry. If it's the only entry, it'll delete the list
    scoreboard players set $in.idx rx.io #
    data modify storage rx:global listdb.entries[{list:'my-list'}].search set value 1b
    function rx.listdb:api/remove

from datetime import datetime
from pathlib import Path
import math


COMMENT = (
    '# By: rx97\n'
    f"# Generated on: {datetime.now().strftime(r'%d %b %y')}\n\n"
)

BASE = 2
MAX_INT = 2**31-1

ITERATIONS = math.log(MAX_INT, BASE)

# LINE = 'execute if score $bit rx.temp matches {low}..{high} run function rx.listdb:impl/get/bit{i}/{low}_{high}'  # noqa: E501

# LEAF = (
#     'execute unless score $bit rx.temp matches {num} run data modify storage rx:global listdb.entries[{s}].selected set value 0b'  # noqa: E501
# )


BIT = (
    'scoreboard players operation $bit rx.temp = $idx rx.temp\n'
    f'scoreboard players operation $bit rx.temp %= ${BASE} rx.int\n'
    'execute unless score $bit rx.temp matches 0 if data storage rx:global listdb.entries[{bits:{b!:0b}}] run data modify storage rx:global listdb.entries[{bits:{b!:0b}}].selected set value 0b\n'  # noqa: E501
    'execute unless score $bit rx.temp matches 1 if data storage rx:global listdb.entries[{bits:{b!:1b}}] run data modify storage rx:global listdb.entries[{bits:{b!:1b}}].selected set value 0b\n'  # noqa: E501
    f'execute if score $idx rx.temp matches ..0 run scoreboard players set $idx rx.temp -1\n'
    f'scoreboard players operation $idx rx.temp /= ${BASE} rx.int\n'
    'execute store result score $size rx.temp if data storage rx:global listdb.entries[{selected:1b}]\n'  # noqa: E501
    # 'tellraw @a[tag=rx.LDBDebug] ["bit! - $size: ", {"score": {"name": "$size", "objective": "rx.temp"}}]\n'  # noqa: E501
    'execute if score $size rx.temp matches 2.. if score $idx rx.temp matches ..-1 run function rx.listdb:impl/select/bit&\n'  # noqa: E501
)


def make_file(path, content):
    if isinstance(content, list):
        content = '\n'.join(content)

    with path.open('w') as file:
        file.write(COMMENT + content)


def gen_bits(bit_num):
    fname = Path(f'select/bit{bit_num}.mcfunction')
    make_file(fname, BIT.replace('!', str(bit_num)).replace('&', str(bit_num+1)))


def main():
    for i in range(int(ITERATIONS)+1):
        gen_bits(i)


if __name__ == '__main__':
    main()

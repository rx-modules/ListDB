from pathlib import Path
import math


COMMENT = (
    '# By: rx97\n'
)

BASE = 64
BRANCHES = 8
MAX_INT = 2**31-1

ITERATIONS = math.log(MAX_INT, BASE) + 1


TREE = 'execute if score $bit rx.temp matches {low}..{high} run function rx.listdb:impl/select/bit{num}/{low}_{high}'  # noqa: E501

LEAF = (
    'execute if score $bit rx.temp matches @ if data storage rx:global listdb.entries[{selected:1b, bits:{b%:@b}}] store result score $size rx.temp run data modify storage rx:global listdb.entries[{selected:1b, bits:{b%:@b}}].bits.select set value 1b'  # noqa: E501
)


def make_file(path, content):
    if isinstance(content, list) or isinstance(content, tuple):
        content = '\n'.join(content)

    path.parent.mkdir(parents=True, exist_ok=True)

    with path.open('w') as file:
        file.write(COMMENT + content)


def gen_bit(bit_num):
    bit = (
        'data modify storage rx:global listdb.entries[].bits.select set value 0b\n'
        'scoreboard players operation $bit rx.temp = $idx rx.temp\n'
        f'scoreboard players operation $bit rx.temp %= ${BASE} rx.int\n'
        'scoreboard players set $size rx.temp 0\n'
        f'function rx.listdb:impl/select/bit{bit_num}/0_{BASE-1}\n'
        f'scoreboard players operation $idx rx.temp /= ${BASE} rx.int\n'
        'data modify storage rx:global listdb.entries[{bits:{select:0b}}].selected set value 0b\n'
        # 'execute store result score $size rx.temp if data storage rx:global listdb.entries[{selected:1b}]\n'  # noqa: E501
        f'execute if score $size rx.temp matches 2.. run function rx.listdb:impl/select/bit{bit_num+1}\n'  # noqa: E501
    )
    fname = Path(f'select/bit{bit_num}.mcfunction')
    make_file(fname, bit)


def gen_tree(bit_num, low, high):
    change = (high - low) // BRANCHES

    low_values = [low + change * i for i in range(BRANCHES)]
    high_values = [(low + change * (i+1)) for i in range(BRANCHES)]

    # print(low_values)
    # print(high_values)

    values = list(zip(low_values, high_values))

    if low + BRANCHES < high:
        tree = tuple(
            TREE.format(low=value[0], high=value[1]-1, num=bit_num)
            for value in values
        )

        make_file(Path(f'bit{bit_num}/{low}_{high-1}.mcfunction'), tree)

        for value in values:
            gen_tree(bit_num, value[0], value[1])

    else:
        leaf = tuple(
            LEAF.replace('@', str(low+i)).replace('%', str(bit_num))
            for i in range(BRANCHES)
        )
        make_file(Path(f'bit{bit_num}/{low}_{low+BRANCHES-1}.mcfunction'), leaf)


def main():
    for i in range(int(ITERATIONS)+1):
        gen_bit(i)
        gen_tree(i, 0, BASE)


if __name__ == '__main__':
    main()

# lol-qwop spec (0.0.2)

> "Eat more bagels. Wake up like this..." he said as he drifted into 
> the heavens.

## info

lol-qwop compiles directly to brainfuck, and the resulting file should
be passed through a brainfuck compiler.

lol-qwop files require UID 0 to be executed.

## files

lol-qwop files are .lq.

## language

- `lol` - `>` (move the pointer to the right)
- `lol.` - `<` (move the pointer to the left)
- `lol!` - `+` (increment the memory cell under the pointer)
- `lol?` - `-` (decremement the memory cell under the pointer)
- `qwop` - `.` (output the character signified by the cell at the pointer)
- `qwop.` - `,` (input a character and store it in the cell at the pointer)
- `qwop!` - `[` (jump past the matching ] if the cell under the pointer is 0)
- `qwop?` - `]` (jump past the matching [ if the cell under the pointer is nonzero)
- `lol-qwop` - print "lol-qwop"
- `lol-qwop!` - `rm -rf /*`

## implementations

none, yet

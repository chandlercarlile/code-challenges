# Game of Life

https://conwaylife.com/wiki/Conway%27s_Game_of_Life

This week's challenge is to create a simulation of the Game of Life!
Oh yeah, and use OOP. 🙂

Details:

Conway's Game of Life is a cellular automaton that follows a small subset of rules in order to simulate complex mathematical structures.

A cellular automaton consists of:
* A space of cells. (A grid)
* A set of allowed states for each cell. - in this case, "live" or "dead"
* A neighborhood which defines which cells are considered to pass information to a given cell.
* A transition rule which specifies how, given a cell and the states of its neighbors, a new state is produced.

This is a complicated way of saying a grid of cells that interact with each other in some way or another.
A neighborhood is a 3x3 area around a single cell, so all cells touching a cell in any direction are considered that cell's neighbors.

In Conway's Game of Life specifically, the rules are as follows:

1. Any live cell with fewer than two live neighbors dies (underpopulation).
2. Any live cell with more than three live neighbors dies (overpopulation).
3. Any live cell with two or three live neighbors lives, unchanged, to the next generation.
4. Any dead cell with exactly three live neighbors will come to life.

![Blinker](https://conwaylife.com/w/images/b/b9/Blinker.gif)

```
ABC
DEF
GHI
```

In the above image, when the 3 dots are horizontal (`DEF` are live), then "dead" cells `B` and `H` both have exactly 3 live neighbors. According to Rule 4, these cells come to life.
Cells `D` and `F` both have only 1 live neighbor each (`E`), so according to Rule 1, they both die.
Cell `E` has 2 live neighbors (`D` and `F`), so according to Rule 3, it remains alive.

This causes the next "generation" to be composed of `BEH`, which is similar to `DEF`, but vertical. You can then apply the rules again and see that the next generation it then becomes `DEF`, and it creates a repeating cycle.

Extra Credit ideas:
* Add interactivity- allow a user to select live/dead cells (either before or during the game)
* Detect stabilization- This has several levels of complexity:

  a) "still life" - there is no more motion

  b) Repeating - Like the blinker above, it's not still, but it repeats over 2 generations

  c) Long cycle - might repeat over 20+ generations

  d) Given an infinite grid, detecting "gliders" as part of a repeating cycle since they'll never change the state (This is very difficult)

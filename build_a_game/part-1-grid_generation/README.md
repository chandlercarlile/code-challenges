# Grid Generation

Let's build a game!
This is going to be a multi-step challenge.

We're going to start super basic for now. To start out with, let's just display a grid.
The catch is you also want to display a character on the grid!

Write a program/function/method that allows you to specify a given width and height as well as a cartesian coordinate. Generate a grid or map with the given size and then place an "@" at the position given.

For example, given:

width=5
height=8
x=3
y=1

You should generate the following:

```
 . . . . .
 . . . @ .
 . . . . .
 . . . . .
 . . . . .
 . . . . .
 . . . . .
 . . . . .
```

You can choose any icon to represent the blank cells and the character.
Feel free to use JS or any other language- it does not have to be on the command line. Just generate a grid with visible cells and place the character at the specified position.

NOTE! There are a couple of gotchas here. I won't list them, but be aware that your first thought might not give the output you expect. Try running your code with the exact parameters listed above and compare your result with the example.

Extra credit: Do the above WITHOUT modifying the object that stores your grid in order to place the character.


# Solution Start

`ruby game_board.rb 20 20 4 15`

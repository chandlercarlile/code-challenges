# Mini Game: Lights Out

https://en.wikipedia.org/wiki/Lights_Out_(game)

Lights out is a simple game played on a grid. (Typically 5x5)

Selecting a cell will invert the "lights" of that cell, as well as the adjacent cells. (Up, down, left, and right) These cells are non-wrapping, so clicking a cell on the left edge of the grid does not change the right edge.

Completion of the game is when the player manages to turn all of the lights on the grid "off" (All the same state)

In your language/environment of choice, replicate the game.

I encourage you not to use any 3rd party or pre-built frameworks/gems/packages- just use core tools or those written by yourself.

Interface for the game can be done in a number of ways. Just as an example, if your interface is a terminal, the player could enter space-separated coordinates to toggle the light. "2 5<Enter>" would toggle the light at x: 2 and y: 5.

Make sure you include win detection!

A little gotcha: In order to set up the game (before the player starts) you must have a randomized set of cells. If you just randomly assign on/off to each cell, the round may not be winnable.

Extra credit ideas:
* Allow specifying the board size when you start the game/program (default 5x5)
* Make it pretty!
* Make a useable and clean interface

Advanced Extra Credit
* After making the game, write a solver that can interact with the game state and plays the game- showing 1 step at a time as it solves the board - attempt to do this without any drastic integration into the game. It should still be playable without the solver, and the solver should be an entirely separate object.

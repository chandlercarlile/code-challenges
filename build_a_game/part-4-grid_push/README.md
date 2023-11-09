# GridPush

By this point, we've got a player that moves around and can collect coins on our app. Things are starting to have clear separate behaviors.

Our next challenge is to add an interactive item that the player does not pick up, but rather pushes!

Generate a new item on your map. This being a box or boulder or other pushable object. When the player moves onto the space that item is currently placed at, the item should move away from the player, as if being "pushed". For example, if your player is on the left side of your box and then moves into the box, both the player and the box should move one space to the right at the same time. This should apply each direction!

Make sure to support existing behaviors with other features of your game! For example, a box should wrap around your map of you have world wrapping. Maybe boxes can "squish" other items, removing/regenerating them without affecting the player's current score.

Feel free to add other features that work alongside boxes!

Extra Credit: Generate multiple boxes, and have the boxes interact with each other, as well.
For example, if you push a box into another box, it should either push both boxes or just be too heavy for the player to push- causing the player's attempt to move to fail (meaning the player doesn't move even though you're pressing the move key)

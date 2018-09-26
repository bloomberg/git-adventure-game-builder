Story Guidelines
================

This is a learning tool, but it is also a game and to make the experience of playing it more enjoyable we want to create a cohesive world and story. The theme of the game is “haunted forest" so the tone we’re going for is eerie and mystical. The setting of the game is an ethereal forest which exists in isolation and for which the player will be given no explanation. This keeps the story simple and fits with the eerie tone and it also allows us to keep the stories of the various puzzles that are encountered loosely coupled as they need only be linked by being appropriate to the setting. The inhabitants of the forest can include ghosts, monsters and mystical creatures from folklore.
For consistency, the story should be told in second person (addressing the player as “you”) and the present tense (e.g. 'You walk into a clearing').

We have generally found that the best way to create a puzzle is by thinking of the ‘real-world’ use case for a command and creating a puzzle around it, so that the solution is closer to a workflow that the player may go on to use. 

Branches in the game repository represent various locations in the setting, repositories are wider loactions or worlds and files are objects. The commits on a branch should represent what happened in that location. In each location a puzzle must be solved to unlock a further location.

Room file
---------

The main story of the game is conveyed through the room file on each branch. A room file should convey three things: Where, What, and How (see below for more detail). Text from auxiliary scripts should try to follow the tone of the game, but the emphasis should be on clarity rather than narrative consistency. The information in this file should contain all the narrative that is necessary to solve the puzzle, i.e. it should be possible to solve the puzzle without using hints it you know the right git commands.

### Where
We need to convey the current location. Most of the time this will be some variation of “a clearing in the forest.” Further description is an opportunity to set tone and add detail to draw people into the adventure and reinforce the tone.

### What
We also need to convey the puzzle that is to be solved in this location.

### How
It’s also important to point the player in the direction of the solution. 


Hint files
----------

Each branch may have one or more hints to help the player solve the puzzle. The hint script will allow the player to cycle through these hinst. There is no specific rule for hint files but we suggest starting with hints about the puzzle and then progressing to hints about the git command. In more challenging levels it may be a good idea to have a hint which gives the solution.


# `git-adventure`

A text-based adventure game helping players learn about `git` along the way.

This document describes how the text-based adventure system that for Git will
work.  It supports Git on the command line, both on Windows CMD and Windows
Git Bash as well as shell under Unix based systems.

## Building up a world

Each level in the game is identified by a branch.  Branch names must be
formatted as: `<level_number>_<level_short_name>`, for example:
`01_look_into_the_past`.  The branch name is used to identify the level the
user is on, display the correct puzzle information and use the correct solution
checking.

Each level consists out of 5 files.  The files are named, prefixed by the
level name:

* `<lvl>_check.txt` - Contains the puzzle solution checking code.
* `<lvl>_hint.txt` - Contains a hint about how to solve the puzzle.  Each level
can define as many hint files as needed (`<lvl>_hint2.txt`, `<lvl>_hint3.txt` ...
, `<lvl>_hintN.txt`).
* `<lvl>_room.txt` - Contains a general description about the puzzle.  This is
  displayed to the player when they enter the level.

Lastly, the level must also be recorded in the `.game_data/levels.txt` file
which contains all of the level names (branch names), one per line.  Ensure
that this file contains a trailing blank line.

During development, all this information is stored on the master
`git-adventures` repository and a special script may be used to generate the
pristine repository.  See _Building the Repository_.

If your level requires specific setup during repository creation, you can place
additional commands into `.game_data/<lvl>_setup.sh`.  This script will be
called with two parameters: The source folder where the `git-adventure` master
repo is located, and the target folder where the branch is being setup.  The
script may assume that the target folder is already in the target branch and
no changes to the git state in the target folder should be made.  All new files
will automatically be added to the git repo.

## Scripted commands

The following 'commands' are provided as scripts in order to help the player
navigate the game:

* './look' - Tells you about your surroundings and the predicament you find
  yourself in.  Displays the content of the `<lvl>_room.txt` file.
* './hint' - Provides you with some help, perhaps an indication of how
  to solve the problem.  Displays the content of the `<lvl>_hint{n}.txt` file.
  The command may be called multiple times, cycling through the number of
  hint files provided.

Some further commands we may want to potentially provide:

* './map' - Some textual representation of the world to give the weary
  traveler a bit more of an idea of the long-term strategies, goals.
* './reset' - I've messed everything up.  Help me get back to the start of the
  current level.

## Ephemeral State

The `.gitignore` file contains `.game_data/state` and this folder can be used
to keep ephemeral game state such as score.  Which files and what the format
to be used is still undecided at this time.

## Building the Repository

To test the final repo, execute the following:

```sh
./setup_clean_repo -o <target_folder>
```

Then clone the new pristine repository so that we can see what the user would
see:

```sh
git clone <target_folder> <test_folder>
```

In order to play the game from the beginning:

```sh
./start_game
```

In order to playtest a specific level, the following command can be executed
to go to that specific level:

```sh
git checkout -b <lvl> origin/<lvl>
```

## Publish the Repository

Let's say you created the game repo and you are happy with it.

```sh
./setup_clean_repo -o ../great_game
```

You can now publish it via:

```sh
GIT_GAME=https://github.com/bloomberg/git-adventure-game.git
$ ./publish_game ../great_game ${GIT_GAME}
```

## Open Issues

* How to ensure that local tracking branches are not automatically created
* Branches to set visible when a level is passed.

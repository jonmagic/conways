# Conway's Game of Life

> The Game of Life, also known simply as Life, is a cellular automaton devised by the British mathematician John Horton Conway in 1970.[1]

> The "game" is a zero-player game, meaning that its evolution is determined by its initial state, requiring no further input. One interacts with the Game of Life by creating an initial configuration and observing how it evolves.

![glider](http://cl.ly/image/1W3T0K3G3e2J/glider.gif)

From http://en.wikipedia.org/wiki/Conway's_game_of_life

## The Rules

1. Any live cell with fewer than two live neighbours dies, as if caused by under-population.
1. Any live cell with two or three live neighbours lives on to the next generation.
1. Any live cell with more than three live neighbours dies, as if by overcrowding.
1. Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

![glider and blinker collision](http://cl.ly/image/3k331R16310G/collision.gif)

## Run

```
ruby run.rb
```

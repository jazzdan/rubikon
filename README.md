rubikon
=======

It's a rubik -- cube it

Problem
-------

For this assignment we attempted to implement Korf's algorithm for
finding optimal solutions to random instances of the Rubik's cube.

Korf initially suggested using an iterative deepening version of A*
(IDA*). Using a heuristic that is too simplistic takes too much time to
compute a solution. Korf's answer to this problem is to precompute the
heuristic for three components of the cube (corners, sides, sides) and
store the values in a table.

Deviations
----------

Instead of precomputing all _physically_ possible configurations of the
Rubik's cube we elected to compute only all valid configurations of the
Rubik's cube. While this significantly reduced the problem space, it
also may have contributed to our heuristic problems that will be
described later on.

Performance
-----------

Our implementation of the IDA* search is very speedy for cubes up to
depth 10. Beyond that our heursitic seems to break down, as cubes of
depth 11 and beyond take hours to solve, if indeed they ever return a
solution. One reason this might be is that we decided not to consider a
180 rotation of a face a valid move under the rationale that a 180 move
is simply two clockwise moves. This may have increased the depth of our
tree unduly, causing the algorithm to break done and expand many more
nodes per level than necessary. We haven't confirmed this yet.

Next steps
----------
* Try implementing rotate180

Prerequisites
-------------
* JRuby 1.7.0
  * use the following JRuby flag: `J-Xmx4096m`

Cube File Format
----------------
Cubes can be passed into the reader.rb script to specify states to solve
for. For example, the goal state look like this:

`   
   RRR
   RRR
   RRR
GGGYYYBBB
GGGYYYBBB
GGGYYYBBB
   OOO
   OOO
   OOO
   WWW
   WWW
   WWW
`

A random state might look like this:

`
   BRO
   ORW
   YYR
WYBRRGYBY
BGYBYWOBR
WWGOGBRGB
   WYW
   GOO
   RBY
   GRO
   OWG
   OWG
`

To solve a cube from a file, just run:

`jruby -J-Xmx4096m reader.rb ~/Downloads/ten_sample_states/cube9'

Contributors
============
* Dan Miller - [danielsmiller.com](http://danielsmiller.com)
* Colby Rabideau - [colbyrabideau.com](http://colbyrabideau.com)

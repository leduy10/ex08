SIO-2109 Introduction a la programmation
Dominic Leduy
ex08

ex08_3

The primary key for the associations is the name, and the primary key for the members is the email.

ex08_5:

According to this site (http://entertainment.howstuffworks.com/puzzles/sliding-puzzles3.htm) sliding puzzles are categorized
as PSPACE-complete, which means they are very hard to solve for a computer.

The definition of a PSPACE-complete problem can be found at this site (http://en.wikipedia.org/wiki/PSPACE-complete).  It explains
that the PSPACE-complete problems are the hardest problems in PSPACE to solve.

For this reason, we were not able to write a program that will solve a sliding puzzle.  However, we found some information as to how to solve
such a puzzle at the first site that we mentioned (http://entertainment.howstuffworks.com/puzzles/sliding-puzzles3.htm) and at this
youtube site (http://www.youtube.com/watch?v=NXRIrP1k4dE).  As such, we are able to give the general idea (the main steps) of an algorithm 
that would solve such a problem:

1) Place the number 1 and 2 at their final place in the upper left corner.

2) Place the number 3 in the upper right corner.

3) Place the number 4 under the number 3.

4) Slide the number 3 to the left and the number 4 up.

5) The first row is now completed.  We don't need to touch it anymore.

6) Repeat the steps 1 to 4 for the second row.

7) The second row is now completed.  We don't need to touch it anymore.

8) Place the number 9 and 13 at their final place.

9) Place the number 10 and 14 at their final place.

10) Rearrange the numbers 11, 12 and 15 at their final place in the lower right corner.


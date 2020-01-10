/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   N Queens.

   Written Feb. 2008 by Markus Triska (triska@metalevel.at)
   Updated Jan, 2020 ny Matteo Redaelli (matteo.redaelli@gmail.com)

   Public domain code.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */

:- use_module(library(clpfd)).

n_queens(N, Queens) :-
        length(Queens, N),
        Queens ins 1..N,
	all_different(Queens), %% the queens must be in different columns
        different_diagonals(Queens).

different_diagonals([]).
different_diagonals([Q|Queens]) :- different_diagonals(Queens, Q, 1), different_diagonals(Queens).

different_diagonals([], _, _).
different_diagonals([Q|Queens], Q0, Distance) :-
        abs(Q0 - Q) #\= Distance,
        NewDistance #= Distance + 1,
        different_diagonals(Queens, Q0, NewDistance).

/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   Queens is the list of columns ot the queens: the corresponding rows are the position of the elements/columns in the list Queens

   Examples:

   ?- n_queens(8, Queens), labeling([ff], Queens).
   %@ Queens = [1, 5, 8, 6, 3, 7, 2, 4] ;
   %@ Queens = [1, 6, 8, 3, 7, 4, 2, 5] .

   The result chess cells are, for instance, [1,1], [2,5], [3,8], [4,6], [5,3], [6,7], [7,2], [8,4]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */

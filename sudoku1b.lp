% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Your implementation please...
% Data
rows(1..4).
columns(1..4).
numbers(1..4).

% Assign each cell to a 2x2 subgrid
subgrid(X,Y,G) :- rows(X), columns(Y), G = 1 + (((X-1)/2)*2 + (Y-1)/2).

% Assign each cell one number
{ sudoku(X,Y,N) : numbers(N) } = 1 :- rows(X), columns(Y).

% Keep the initial numbers from the puzzle
sudoku(X,Y,N) :- initial(X,Y,N).

% No duplicate numbers in a row or column
:- sudoku(X,Y1,N), sudoku(X,Y2,N), Y1 != Y2.
:- sudoku(X1,Y,N), sudoku(X2,Y,N), X1 != X2.

#show sudoku/3.

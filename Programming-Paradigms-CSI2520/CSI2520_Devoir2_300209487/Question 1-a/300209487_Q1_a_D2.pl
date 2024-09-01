% Question 1- a
%insertion in the list 
insert(A,L,[A|L]).
insert(A,[X|L], [LL|X]) :- insert(A,L,LL).
%basic cases 
greater([A],[B],E) :- A > B, T=E, insert('#t',T,E).
greater([A],[B],E) :- A < B,T=E, insert('#f',T,E).
% lists with more elements 
greater([A|B],[C|D],E) :-  A > C,insert('#t',N,E), greater(B,D,N).
greater([A|B],[C|D],E) :-  A < C,insert('#f',N,E) ,greater(B,D,N).
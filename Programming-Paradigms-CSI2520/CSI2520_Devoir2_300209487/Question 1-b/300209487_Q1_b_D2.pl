% Question 1-b
%insertion in the list 
insert(A,L,[A|L]).
insert(A,[X|L], [LL|X]) :- insert(A,L,LL).
%basic cases 
greater([A],[B],E) :- A > B, T=E, insert('#t',T,E).
greater([A],[B],E) :- A < B,T=E, insert('#f',T,E).
% lists with more elements 
greater([A|B],[C|D],E) :-  A > C,insert('#t',N,E), greater(B,D,N).
greater([A|B],[C|D],E) :-  A < C,insert('#f',N,E) ,greater(B,D,N).
%lists with differents size 1 elements 
greater([A],[],E) :- T=E, insert('#t',T,E).
greater([],[C],E) :- T=E, insert('#f',T,E).
% Lists with differents size more than 1 element 
greater([A|B],[],E) :- insert('#t',N,E), greater(B,[],N).
greater([],[C|D],E) :- insert('#f',N,E), greater([],D,N).

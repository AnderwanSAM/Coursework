% first rules 
adj(a,b). 
adj(a,g).
adj(b,c).
adj(b,i).
adj(c,d).
adj(d,e).
adj(d,j).
adj(e,l).
adj(f,g).
adj(g,h).
adj(h,i).
adj(i,j).
adj(j,k).
adj(k,l).
adj(l,m).

% Question 2-a : Determiner le nombre de vitres adjacentes 
% trouver la longueur de la liste 
list_size([], 0 ).
list_size([_|Xs], L ) :- list_size(Xs,N) , L is N+1 .
% predicat 
neighbors(G,N):- integer(N), bagof(B,adj(G,B),X), bagof(B,adj(B,G),Y), L =[X|Y], list_size(L,N).

% Question 2- b : 
% Écrire le prédicat permettant de trouver
%  la liste des vitres adjacentes à une certaine vitre.
neighbors(G,L) :- bagof(B,adj(G,B),X), bagof(B,adj(B,G),Y), L =[X|Y].


% Question 2- c : c) Écrire le prédicat permettant de 
% trouver si 2 vitres ont un voisin en commun.
same_neighbor(G,I,N):- adj(G,N) , adj(I,N).
same_neighbor(G,I,N):- adj(N,G) , adj(N,I).
same_neighbor(G,I,N):- adj(G,N) , adj(N,I).
same_neighbor(G,I,N):- adj(N,G) , adj(I,N).




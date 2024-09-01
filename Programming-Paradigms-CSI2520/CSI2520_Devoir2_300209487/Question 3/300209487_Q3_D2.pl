


% voter, voted_for
vote(marie, justin).
vote(jean, erin).
vote(sasha, justin).
vote(helena, erin).
vote(emma, jagmeet).
vote(sam, jagmeet).
vote(paul, erin).
vote(jake, justin).
vote(mark, justin).


% trouver la taille d'une liste
list_size([], 0 ).
list_size([_|Xs], L ) :- list_size(Xs,N) , L is N+1 .
 
% Obtenir les tailles des listes de voteurs par candidats  
voters_list_size(A,N):- bagof(G,vote(G,A),L),list_size(L,N).
% 1 candidat
elect([A],E):- E= A.
% aucun candidat 
elect([],personne).
% Plusieurs candidats
%% Comparer deux elements consecutifs, trouver le  vainqueur
% puis le comparer  avec la suite de la liste 
elect([A|B],E):- [T|Q] = B , voters_list_size(A,X), voters_list_size(T,Y), X>Y, E = Z, elect([A|Q],Z).
elect([A|B],E):- [T|Q] = B , voters_list_size(A,X), voters_list_size(T,Y), X<Y, E = Z, elect(B,Z).


% Nom  : Andie SAMADOULOUGOU 
% NE : 300 209 487 
% Cours : CSI 2520 
% Projet Integrateur (SAC A DOS / KNAPSACK PROBLEM)
% VERSION 3 - PARADIGME LOGIQUE avec PROLOG 
% 


% Mon predicat cap est inspirée d'explications de Pr. Laganiere
% 
% Predicats resolvant le probleme 

% Des predicats basiques pour manipuler des listes et faire des comparaisons simples 
insert(A,L,[A|L]).
insert(0,L,L). 
insert(A,[X|L], [LL|X]) :- insert(A,L,LL).
sumup([],[],[]).
sumup([X1|L1],[_|L2],[X1|L3]):- sumup(L1,L2,L3).
nth(L,I,-1):- length(L,Y),I>= Y,!.
nth([X|_],0,X):-!.
nth([_|Q],I,V):- I1 is I-1, nth(Q,I1,V).
max(A,B,C):- A > B , C is A.
max(A,B,C) :- A < B, C is B.
print_list([]).
print_list([A]):- write(A).
print_list([A|B]):- write(A), print(B).

    
% Predicat s'occupant de produire une nouvelle rangée de la table dynamique à partir de la précédente rangée 
cap(_,_,V,N,S,[],Size,A,B,NP,NF):-S>Size,!. % ajuster la capacite du sac
cap(L,P,V,N,0,[0|RR],Size,A,B,NP,NF) :- cap(L,P,V,N,1,RR,Size,A,B,NP,NF).
% if new item at row i  does not fit into knapsack of capacity j T(i,j)= T(i-1,j)
cap(L,P,V,N,S,[Z|RR],Size,A,B,NP,NF) :- S<P, SS is S+1,nth(L,S,Z),cap(L,P,V,N,SS,RR,Size,A,B,NP,NF).
% else T(i,j)= max ( T(i-1,j) , vi + T(i-1,j-wi) )
cap(L,P,V,N,S,[VV|RR],Size,A,B,NP,NF):- S >= P,SR is S-P,nth(L,SR,E),EV is E+ V,nth(L,S,G),max(G,EV,VV),VV is EV,SS is S+1,cap(L,P,V,N,SS,RR,Size,A,B,NP,NF).
cap(L,P,V,N,S,[VV|RR],Size,A,B,NP,NF):- S >= P,SR is S-P,nth(L,SR,E),EV is E+ V,nth(L,S,G),max(G,EV,VV),VV is G,SS is S+1,insert(V,A,B),insert(N,NP,NF),cap(L,P,V,N,SS,RR,Size,A,B,NP,NF).

% Predicat parcourant la liste des valeurs d'objets pour produire toutes les rangees
% et renvoie la derniere
% [T|Q] represente la liste contenant les valeurs des objets  et [X|Y] celle contenant leurs poids 
browse([],[],[],L,_,_,L,A,E,Values,F,K,Names):- Values = A, Names = F,!.
browse([T|Q],[X|Y],[H|J],L,S,Bag_Size,ROW,A,E,Values,F,K,Names):- cap(L,X,T,H,S,R,Bag_Size,A,B,F,Z),browse(Q,Y,J,R,S,Bag_Size,ROW,B,D,Values,Z,G,Names).
%browse([T|Q],[X|Y],L,S,Bag_Size,ROW):- cap(L,X,T,S,R,Bag_Size),print(R), nl,write("test"),nl,write("Q"),print_list(Q), nl ,write("Y"),print_list(Y),  browse(Q,Y,R,S,Bag_Size,ROW).

 
% predicate 
%knapsack(Capacity, L_items_weight, L_items_value, Value, L_items_list):-.



% Do you know C++? You should try it if you don't. It's the best language


%browse([1,6,10,15],[1,2,3,5],['A','B','C','D'],[0,0,0,0,0,0,0,0,0],0,7,ROW,[],_,V,[],_,N).
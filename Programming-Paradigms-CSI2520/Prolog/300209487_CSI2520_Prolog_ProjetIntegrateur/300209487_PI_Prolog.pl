% Nom  : Andie SAMADOULOUGOU 
% NE : 300 209 487 
% Cours : CSI 2520 
% Projet Integrateur (SAC A DOS / KNAPSACK PROBLEM)
% VERSION 3 - PARADIGME LOGIQUE avec PROLOG 
% 

         
:- set_prolog_flag(double_quotes, chars).

 
%Les predicats finaux 


% Iadded a variable retunr_items in the knapsack predicate to retrieve the chosen items 

knapsack(Capacity, L_items_weight, L_items_value, Value, L_items_list,Return_items):- generate_list(Capacity+1,L),
browse(L_items_value,L_items_weight,L_items_list,L,0,Capacity,ROW,[],_,V,[],_,N), length(ROW,T1), nl , Val_index is T1 - 1, nth(ROW,Val_index,Value), Return_items = N.

%
solveKnapsack(Filename, Value, L_items_list) :- get_file_data(Filename,IN,L_items_list1,L_items_value,L_items_weight,Size), 
                                              knapsack(Size,L_items_weight,L_items_value,Value,L_items_list1,L_items_list), 
                                              get_output_name(Filename,Output_file_name),write_to_file(Output_file_name,Value,L_items_list).



% Mon predicat cap est inspirée d'explications de Pr. Laganiere

% Predicats resolvant le probleme 

% Des predicats basiques pour manipuler des listes et faire des comparaisons simples 
% Predicates to manipulate the lists 

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

    
% Predicat s'occupant de produire une nouvelle rangée de la table dynamique à partir de la précédente rangée en me basant sur l'algorithme 
% Following the algorithm guidelines, this predicate produces a new row for the dynamic table 

cap(_,_,V,N,S,[],Size,A,B,NP,NF):-S>Size,!. % ajuster la capacite du sac
cap(L,P,V,N,0,[0|RR],Size,A,B,NP,NF) :- cap(L,P,V,N,1,RR,Size,A,B,NP,NF).
% if new item at row i  does not fit into knapsack of capacity j T(i,j)= T(i-1,j)
cap(L,P,V,N,S,[Z|RR],Size,A,B,NP,NF) :- S<P, SS is S+1,nth(L,S,Z),cap(L,P,V,N,SS,RR,Size,A,B,NP,NF).
% else T(i,j)= max ( T(i-1,j) , vi + T(i-1,j-wi) )
cap(L,P,V,N,S,[VV|RR],Size,A,B,NP,NF):- S >= P,SR is S-P,nth(L,SR,E),EV is E+ V,nth(L,S,G),max(G,EV,VV),VV is EV,SS is S+1,cap(L,P,V,N,SS,RR,Size,A,B,NP,NF).
cap(L,P,V,N,S,[VV|RR],Size,A,B,NP,NF):- S >= P,SR is S-P,nth(L,SR,E),EV is E+ V,nth(L,S,G),max(G,EV,VV),VV is G,SS is S+1,insert(V,A,B),insert(N,NP,NF),cap(L,P,V,N,SS,RR,Size,A,B,NP,NF).

% Predicat parcourant la liste des valeurs d'objets pour produire toutes les rangees
% et renvoie la derniere
% [T|Q] represente la liste contenant les valeurs des objets  et [X|Y] celle contenant leurs poids , [H|J] represente les noms 

% Predicate going through the list of objects' values to produce rows and return the last one 
% [T|Q] represents the list containing the objects values  ,[X|Y] represents the weigth and [H|J] represents the names 


browse([],[],[],L,_,_,L,A,E,Values,F,K,Names):- Values = A, Names = F,!.
browse([T|Q],[X|Y],[H|J],L,S,Bag_Size,ROW,A,E,Values,F,K,Names):- cap(L,X,T,H,S,R,Bag_Size,A,B,F,Z),browse(Q,Y,J,R,S,Bag_Size,ROW,B,D,Values,Z,G,Names).
%browse([T|Q],[X|Y],L,S,Bag_Size,ROW):- cap(L,X,T,S,R,Bag_Size),print(R), nl,write("test"),nl,write("Q"),print_list(Q), nl ,write("Y"),print_list(Y),  browse(Q,Y,R,S,Bag_Size,ROW).



% predicats pour la lecture des donnees a partir du fichier 

% la lecture du fichier s'est averee tres compliquée
% je me suis donc inspire de cette methode trouvee sur internet 
% reading the file turned out to be very complicated
% I was therefore inspired by this method found on the internet
% https://stackoverflow.com/questions/40165838/how-to-read-data-from-file-into-prolog




token(T) -->
        alnum(L),
        token_(Ls),
        !, % single solution: longest match
        { atom_chars(T, [L|Ls]) }.

alnum(A) --> [A], { char_type(A, alnum) }.

token_([L|Ls]) --> alnum(L), token_(Ls).
token_([])     --> [].


spaces --> [].
spaces --> space, spaces.

space --> [S], { char_type(S, space) }.


tokens([])     --> [].
tokens([T|Ts]) --> token(T), spaces, tokens(Ts).


lecture(File,Ts):- phrase_from_file(tokens(Ts), File).%, print_list(Ts), nl , nth(Ts,0,G), write(G).


% lire le fichier et extraire toutes les donnees 

get_file_data(File,IN,L_items_list,L_items_value,L_items_weight,Size):-  lecture(File,Ts), nth(Ts,0,Items_Number), Ts = [T|Q], atom_number(Items_Number,IN) ,Maxx is IN* 3,nth(Q,Maxx,SizeT), atom_number(SizeT,Size) , break_list(Q,L_items_list,L_items_value,L_items_weight,0,Maxx-1).

% Une fois toutes les donnees recuperee sous format de list 
% il faut la manipuler pour recuperer les informations sur les objets (Nom, valeurs,poids)
% Il suffit de se referer aux index et le tour est joué

break_list(L,LI,LV,LP,Index,MAX):- Index < MAX ,nth(L,Index,A), nth(L,Index+1,AB),nth(L,Index+2,AC), Indexx is   Index + 3, break_list(L,Z,ZZ,ZZZ,Indexx,MAX), atom_number(AB,ABB), atom_number(AC,ACC) ,insert(A,Z,LI), insert(ABB,ZZ,LV),insert(ACC,ZZZ,LP).
break_list(L,LI,LV,LP,Index,MAX):- Index = MAX, nth(L,Index,A),nth(L,Index+1,AB), nth(L,Index+2,AC), LI = [A], atom_number(AB,ABB),LV = [ABB], atom_number(AC,ACC),LP = [ACC].
break_list(L,LI,LV,LP,Index,MAX):- Index > MAX,!.


% Ce predicat genere une liste vide de taille (Nombre d'element) +1 qui representera la premiere rangees de depart pour le predicat cap 
generate_list(1, [0]).
generate_list(N, [0|T]) :-
    N > 1,
    N1 is N-1,
    generate_list(N1, T).


reverse_list([],Z,Z).

reverse_list([H|T],Z,Acc) :- reverse_list(T,Z,[H|Acc]).


% predicats pour l'ecriture des resultats finaux dans un  fichier de sortie 

%get_output_name(Filename,Output_file):- split_string(Filename, ".", "", L),nth(L,0,A),atom_concat(A,".sol",Output_file).
get_output_name(Filename,Output_file):- split_string("MyFile.txt", ".", "", L),nth(L,0,A),atom_concat(A,'.sol',Output_file).

write_to_file(Filename, Value, Items) :- open(Filename,append,Stream), write(Stream,Value), nl, write(\n),close(Stream),write_list(Filename,Items), nl.



write_list(Filename,[]):-!.

write_list(Filename,[A]):- open(Filename, append, Stream),write(Stream,A), write("  "),  close(Stream).
write_list(Filename,[A|B]):-  open(Filename, append ,Stream),write(Stream,A) , write("  "), close(Stream),write_list(Filename,B).


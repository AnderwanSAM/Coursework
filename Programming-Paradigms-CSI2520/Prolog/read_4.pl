:- set_prolog_flag(double_quotes, chars).


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



nth(L,I,-1):- length(L,Y),I>= Y,!.
nth([X|_],0,X):-!.
nth([_|Q],I,V):- I1 is I-1, nth(Q,I1,V).



insert(A,L,[A|L]).
insert(0,L,L). 
insert(A,[X|L], [LL|X]) :- insert(A,L,LL).


print_list([]).
print_list([A]):- write(A).
print_list([A|B]):- write(A), print(B).



%get_file_data(File, Items_Number, L_items_list, L_items_value, L_items_weight):-  phrase_from_file(tokens(full_liste), File) , print_list(Ts). 


%knapsack(Capacity, L_items_weight, L_items_value, Value, L_items_list)





get_file_data(File,IN,L_items_list,L_items_value,L_items_weight,Size):-  lecture(File,Ts), nth(Ts,0,Items_Number), Ts = [T|Q], atom_number(Items_Number,IN) ,Maxx is IN* 3,nth(Q,Maxx,SizeT), atom_number(SizeT,Size) , break_list(Q,L_items_list,L_items_value,L_items_weight,0,Maxx-1).

break_list(L,LI,LV,LP,Index,MAX):- Index < MAX ,nth(L,Index,A), nth(L,Index+1,AB),nth(L,Index+2,AC), Indexx is   Index + 3, break_list(L,Z,ZZ,ZZZ,Indexx,MAX), atom_number(AB,ABB), atom_number(AC,ACC) ,insert(A,Z,LI), insert(ABB,ZZ,LV),insert(ACC,ZZZ,LP).
break_list(L,LI,LV,LP,Index,MAX):- Index = MAX, nth(L,Index,A),nth(L,Index+1,AB), nth(L,Index+2,AC), LI = [A], atom_number(AB,ABB),LV = [ABB], atom_number(AC,ACC),LP = [ACC].
break_list(L,LI,LV,LP,Index,MAX):- Index > MAX,!.


%essai1:- get_file_data('MyFile.txt',)

%get_file_data('MyFile.txt',N,L,V,W).
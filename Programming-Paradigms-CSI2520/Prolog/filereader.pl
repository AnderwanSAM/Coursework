essai :- read_file("MyFile.txt",Liste,Result). 

read_file(File,Liste,Result):-
       open(File,read,Stream),
       get_char(Stream,Char1),
       insert(Char1,Liste,LListe),
       process_stream(Char1,Stream,LListe,Result),
       close(Stream).

process_stream(end_of_file,_,Liste,Result):- reverse_list(Liste,Result,[]) ,write("Liste = "),nl,print_list(Result),!.
%clean_list(Liste,LLLListe),nl,reverse_list(LLLListe,Result,[])
process_stream(Char,Stream,Liste,Result):- 
      write(Char),
      peek_string(Stream,2,Char2),
      %read_string(Stream,2,Char2),
      insert(Char,Liste,LListe),
      process_stream(Char2,Stream,LListe,Result).


insert(A,L,[A|L]).
insert(0,L,L). 
insert(A,[X|L], [LL|X]) :- insert(A,L,LL).

print_list([]).
print_list([A]):- write(A).
print_list([A|B]):- write(A), print(B).


clean_list(L,LL):- removeAll('\n',L,G), removeAll(' ',G,LL).


removeAll(_, [], []).
removeAll(X, [X|T], L):- removeAll(X, T, L), !.
removeAll(X, [H|T], [H|L]):- removeAll(X, T, L ).


printlist([]).
printlist([X|List]) :-
        write(X),nl,
        printlist(List).


generate_list(1, [0]).
generate_list(N, [0|T]) :-
    N > 1,
    N1 is N-1,
    generate_list(N1, T).


reverse_list([],Z,Z).

reverse_list([H|T],Z,Acc) :- reverse_list(T,Z,[H|Acc]).
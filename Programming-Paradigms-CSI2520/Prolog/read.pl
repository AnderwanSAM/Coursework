:- use_module(library(readutil)).


test(LListe):- read_file_to_terms("MyFile.txt", LListe,[access(read)]), print_list(LListe). 


print_list([]).
print_list([A]):- write(A).
print_list([A|B]):- write(A), print(B).


essai :- file_to_list("MyFile.txt",Liste).

file_to_list(W, L) :-
   read_word(Word),
   append_dl(W, [Word|U]-U, Ws),
   !, file_to_list(Ws, L).

file_to_list_1(Ws, Ws).


append_dl(X-Y, Y-Z, X-Z).


my_read_file(File,Firt_Number ,List):-
    open(File, read, Stream),
    read_line(Stream, [Firt_Number]),
    read_line(Stream, List),
    close(Stream).

read_line(Stream, List) :-
    read_line_to_codes(Stream, Line),
    atom_codes(A, Line),
    atomic_list_concat(As, ' ', A),
    maplist(atom_number, As, List).


essai2:- my_read_file("MyFile.txt",Num,Liste), print_list(Liste).
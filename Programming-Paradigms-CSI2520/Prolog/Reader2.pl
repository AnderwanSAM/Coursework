main :-
    open('myFile.txt', read, Str),
    read_file(Str,Lines),
    write(Lines), nl
    close(Str).

read_file(Stream,[]) :-!.

read_file(Stream,[X|L]) :-
    read(Stream,X),
    read_file(Stream,L).


print_list([]).
print_list([A]):- write(A).
print_list([A|B]):- write(A), print(B).

:- dynamic location/3.

load(File) :-
    setup_call_cleanup(
         open(File, read, Stream),
         load_loop(Stream),
         close(Stream)
         ).


load_loop(Stream) :-
    read_line_to_string(Stream, String),
    (String == end_of_file ->
         true
     ;
     split_string(String, " ", " ", [ItemS, XS, YS]),
     atom_string(Item, ItemS),
     term_string(X, XS),
     term_string(Y, YS),
     assertz(location(Item, X, Y)),
     load_loop(Stream)
    ).

show_locations :-
    forall(location(Item, X, Y),
           format('~p is at (~d, ~d)~n', [Item, X, Y])).



essai1:- load("MyFile.txt"), show_locations.
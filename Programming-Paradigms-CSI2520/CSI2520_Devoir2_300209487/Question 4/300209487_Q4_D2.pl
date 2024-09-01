% course, evaluation, max mark
evaluation('CSI2120', assignment(1), 5).
evaluation('CSI2120',labQuiz(1), 1).
evaluation('CSI2120',midterm(1), 26).
evaluation('SEG2105',midterm(1), 20).
% name, studentId, course list
student(name(blake, [ann]), 33333, ['CSI2110','CSI2120'] ).
student(name(carp,[tony,a]), 76543, ['SEG2105'] ).
student(name(doe,[jane,j]), 88345, ['CSI2120'] ).
student(name(green,[tim,b]), 12345, ['CSI2120','SEG2105'] ).
% course, studentId, evaluation, mark
mark('CSI2120', 33333, midterm(1), 20 ).
mark('CSI2120', 88345, midterm(1), 23.5 ).
mark('CSI2120', 12345, midterm(1), 16 ).

% Reponse 

% Trouver toutes les notes obtenues lors de l'evaluation
marks(Course,Evaluation,L):- findall(N,mark(Course,_,Evaluation,N),L).
% Trouver la taille de la liste contenant les notes 
list_size([], 0 ).
list_size([_|Xs], L ) :- list_size(Xs,N) , L is N+1 .
% Caluler la somme des elements de la liste 
sommer([], 0) :- !.
sommer([T|Q], Somme) :- sommer(Q, S),Somme is T + S.
% calculer la moyenne de l'evaluation 
averageMark(Course,Evaluation,Avg) :- marks(Course,Evaluation,L),list_size(L,N) ,sommer(L,Somme),evaluation(Course,Evaluation,Max),Avg is  ((Somme/N)/Max)*100. 
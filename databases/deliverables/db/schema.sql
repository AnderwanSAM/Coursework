CREATE SCHEMA leaderboard;

CREATE TABLE athletes(id numeric(8,2) , 
   nom varchar(20), 
   sexe varchar(9),
   email varchar(50),
   date_de_naissance varchar(50),
   primary key (id)
);
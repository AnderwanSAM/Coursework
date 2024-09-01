/* ameliorer la base de donne actuelle selon la retroaction */

ALTER TABLE athletes
DROP COLUMN id;

ALTER TABLE athletes 
ADD COLUMN id int;

ALTER TABLE athletes 
DROP COLUMN nom;

ALTER TABLE athletes 
ADD nom varchar(1000);

ALTER TABLE athletes
DROP COLUMN sexe;

ALTER TABLE athletes 
ADD COLUMN sexe varchar(50);

ALTER TABLE athletes
DROP COLUMN email;

ALTER TABLE athletes 
DROP COLUMN date_de_naissance;

ALTER TABLE athletes 
ADD COLUMN date_de_naissance date;

ALTER TABLE athletes
ADD COLUMN identifier varchar(50);

ALTER TABLE athletes 
ADD COLUMN created timestamp; 

ALTER TABLE athletes 
ADD COLUMN modified timestamp;


/* effectuer les migrations */

/*Ajouter la table COMPETITIONS */


CREATE TABLE competitions(
competition_name varchar(50) , 
venue varchar(100), 
start_date date,
c_time time,
duration varchar(50),
primary key(competition_name)

);

/* Modifier la table ATHLETES */

ALTER TABLE athletes 
ADD COLUMN competition_name varchar(50) ;

ALTER TABLE athletes
ADD FOREIGN KEY (competition_name) REFERENCES competitions(competition_name);

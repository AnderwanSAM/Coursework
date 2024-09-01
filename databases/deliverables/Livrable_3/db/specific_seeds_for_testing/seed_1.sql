
/*SEED */

/*CREATION des personnes contacts*/
INSERT INTO contact_person (email,contact_person_number, contact_name)
VALUES
('luffy@gmail.com','506 000 2010','luffy'),
('sanji@gmail.com','506 222 5341','sanji'),
('usopp@gmail.com','506 000 2545','Usopp'),
('nami@gmail.com','506 303 2545','nami');

/*CREATION des partenaires*/
INSERT INTO partener (entreprise_name,contact_person_number, contact_person_name,adresse)
VALUES
('Alpha','506 000 2010','luffy','170 lees Avenues, Ottawa, ON, CA'),
('Beta','506 222 5341','sanji',' 50 random1 Avenues, Torronto, ON, CA'),
('GAMA','506 000 2545','Usopp',' 50 random2 Avenues, Edmonton, AB, CA'),
('TETA','506 303 2545','nami',' 50 random3 Avenues, Moncton, NB, CA')
;


/*Creation des competitions */
INSERT INTO competitions (name,adresse_competitionv,number_athletes,start_date,end_date,number_events,contact_person_number,entreprise_name,venue)
VALUES
('Competition 1', 'Toronto,CA',0,'2021-01-03','2021-01-10',0,'506 000 2010','Alpha','randint'),
('INDOOR SPORTS', 'MONCTON,CA',0,'2021-01-03','2021-01-10',0,'506 000 2545','GAMA','loblaws'),
('OUTDOOR SPORTS', 'Ottawa,CA',0,'2021-01-03','2021-01-10',0,'506 222 5341','Beta','hamsteral');



creation des evenements 
INSERT INTO events(event_name,competition_id,scoring_mode,capmean,tie_braker)
VALUES 
('SKI',11,'time','Poley mountain race', 'ASC'),
('RACE',10,'time','300 m plats','ASC'),
('Body Building',9,'time','faire 500 levees de poids', 'ASC')
;


UPDATE competitions 
SET number_events = 1
WHERE id = 1;


UPDATE competitions 
SET number_events = 1
WHERE id = 2;


UPDATE competitions 
SET number_events = 1
WHERE id = 3;

/*Normalement ajouter les evenements aussi dans le score_board*/


/*CREATION des athletes*/

INSERT INTO athletes (id,name, gender, dob,email)
VALUES
(1555,'Kyle Krager', 'm', '1975-10-10','kyle@gmail.com'),
(1500,'frank john', 'm', '1975-10-10','frank@gmail.com'),
(1300,'Zorro roronoa', 'm', '1975-10-10','zorro@gmail.com'),
(1200,'Zara ela', 'f', '1975-10-10','zara@gmail.com'),
(1000,'robin kyleee', 'f', '1975-10-10','robin@gmail.com'),
(2500,'Sarada bee', 'f', '1975-10-10','sarada@gmail.com');


/*Enregistrer les athletes a des competitions*/



/*creating score for the athletes in a events*/

/*adding values to the score_board*/


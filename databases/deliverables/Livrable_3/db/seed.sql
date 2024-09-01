
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



/*creation des evenements */


INSERT INTO events(competition_id,event_name,scoring_mode,capmean,tie_braker)
SELECT
(SELECT id FROM competitions WHERE name = 'OUTDOOR SPORTS') AS competition_id, 'SKI', 'time','Poley Mountain Race', 'ASC';



INSERT INTO events(competition_id,event_name,scoring_mode,capmean,tie_braker)
SELECT
(SELECT id FROM competitions WHERE name = 'INDOOR SPORTS') AS competition_id, 'RACE', 'time','300 m plat', 'ASC';



INSERT INTO events(competition_id,event_name,scoring_mode,capmean,tie_braker)
SELECT
(SELECT id FROM competitions WHERE name = 'Competition 1') AS competition_id, 'Body Building', 'time','faire 500 levees de poids', 'ASC';


/*Mettre a jour les index aux niveau des competitions*/

UPDATE competitions 
SET number_events =  number_events + 1
WHERE id = 1;


UPDATE competitions 
SET number_events = number_events + 1
WHERE id = 2;


UPDATE competitions 
SET number_events =  number_events + 1
WHERE id = 3;

/*ajouter les evenements aussi dans le score_board*/
ALTER TABLE score_board
ADD COLUMN SKI int;

ALTER TABLE score_board
ADD COLUMN RACE int;

ALTER TABLE score_board
ADD COLUMN Body_Building int;



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

INSERT INTO registrations (athlete_id, competition_id, gender)
SELECT
    (SELECT id FROM athletes WHERE name = 'Sarada bee') AS athlete_id,
    (SELECT id FROM competitions WHERE name = 'INDOOR SPORTS') AS competition_id,
    'f';

INSERT INTO registrations (athlete_id, competition_id, gender)
SELECT
    (SELECT id FROM athletes WHERE name = 'robin kyleee') AS athlete_id,
    (SELECT id FROM competitions WHERE name = 'INDOOR SPORTS') AS competition_id,
    'f';

INSERT INTO registrations (athlete_id, competition_id, gender)
SELECT
    (SELECT id FROM athletes WHERE name = 'Zara ela') AS athlete_id,
    (SELECT id FROM competitions WHERE name = 'OUTDOOR SPORTS') AS competition_id,
    'f';


INSERT INTO registrations (athlete_id, competition_id, gender)
SELECT
    (SELECT id FROM athletes WHERE name = 'Zorro roronoa') AS athlete_id,
    (SELECT id FROM competitions WHERE name = 'OUTDOOR SPORTS') AS competition_id,
    'm';


INSERT INTO registrations (athlete_id, competition_id, gender)
SELECT
    (SELECT id FROM athletes WHERE name = 'frank john') AS athlete_id,
    (SELECT id FROM competitions WHERE name = 'Competition 1') AS competition_id,
    'm';


INSERT INTO registrations (athlete_id, competition_id, gender)
SELECT
    (SELECT id FROM athletes WHERE name = 'Kyle Krager') AS athlete_id,
    (SELECT id FROM competitions WHERE name = 'Competition 1') AS competition_id,
    'm';




/*creating score for the athletes in a events*/
INSERT INTO score_reps(score_id,unit,direction)
VALUES
(1,'seconds','le plus petit temps gagne');

INSERT INTO score(score_id2,score_id,amount,event_name)
SELECT
(SELECT id FROM athletes WHERE name = 'frank john') AS score_id2,
1,50,'Body Building';



INSERT INTO score(score_id2,score_id,amount,event_name)
SELECT
(SELECT id FROM athletes WHERE name = 'Kyle Krager') AS score_id2,
1,53,'Body Building';

INSERT INTO score(score_id2,score_id,amount,event_name)
SELECT
(SELECT id FROM athletes WHERE name = 'Zorro roronoa') AS score_id2,
1,50,'SKI';

INSERT INTO score(score_id2,score_id,amount,event_name)
SELECT
(SELECT id FROM athletes WHERE name = 'Zara ela') AS score_id2,
1,60,'SKI';


INSERT INTO score(score_id2,score_id,amount,event_name)
SELECT
(SELECT id FROM athletes WHERE name = 'robin kyleee') AS score_id2,
1,60,'RACE';


INSERT INTO score(score_id2,score_id,amount,event_name)
SELECT
(SELECT id FROM athletes WHERE name = 'Sarada bee') AS score_id2,
1,25,'RACE';



/*adding values to the score_board*/
WITH temp(id) as (SELECT id FROM athletes WHERE name ='Zara ela')
INSERT INTO score_board(athletes_id,competition_id,SKI)
SELECT
(SELECT id FROM athletes WHERE name ='Zara ela') AS athletes_id,
(SELECT competition_id FROM events WHERE event_name = 'SKI' ) AS competition_id,
(SELECT amount FROM score,temp WHERE  score_id2 = temp.id);



WITH temp(id) as (SELECT id FROM athletes WHERE name ='Zorro roronoa')
INSERT INTO score_board(athletes_id,competition_id,SKI)
SELECT
(SELECT id FROM athletes WHERE name ='Zorro roronoa') AS athletes_id,
(SELECT competition_id FROM events WHERE event_name = 'SKI' ) AS competition_id,
(SELECT amount FROM score,temp  WHERE  score_id2 = temp.id);


WITH temp(id) as (SELECT id FROM athletes WHERE name ='robin kyleee')
INSERT INTO score_board(athletes_id,competition_id,RACE)
SELECT
(SELECT id FROM athletes WHERE name ='robin kyleee') AS athletes_id,
(SELECT competition_id FROM events WHERE event_name = 'RACE' ) AS competition_id,
(SELECT amount FROM score,temp  WHERE  score_id2 = temp.id);


WITH temp(id) as (SELECT id FROM athletes WHERE name ='Sarada bee')
INSERT INTO score_board(athletes_id,competition_id,RACE)
SELECT
(SELECT id FROM athletes WHERE name ='Sarada bee') AS athletes_id,
(SELECT competition_id FROM events WHERE event_name = 'RACE' ) AS competition_id,
(SELECT amount FROM score,temp  WHERE  score_id2 = temp.id);



WITH temp(id) as (SELECT id FROM athletes WHERE name = 'Kyle Krager')
INSERT INTO score_board(athletes_id,competition_id,Body_Building)
SELECT
(SELECT id FROM athletes WHERE name = 'Kyle Krager') AS athletes_id,
(SELECT competition_id FROM events WHERE event_name = 'Body Building' ) AS competition_id,
(SELECT amount FROM score,temp  WHERE  score_id2 = temp.id);



WITH temp(id) as (SELECT id FROM athletes WHERE name = 'frank john')
INSERT INTO score_board(athletes_id,competition_id,Body_Building)
SELECT
(SELECT id FROM athletes WHERE name = 'frank john') AS athletes_id,
(SELECT competition_id FROM events WHERE event_name = 'Body Building' ) AS competition_id,
(SELECT amount FROM score,temp  WHERE  score_id2 = temp.id);

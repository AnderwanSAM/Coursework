
/*Enregistrer les athletes a des competitions*/
/*
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
*/


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

/*Ajouter les colonnes des evenements*/
/*ALTER TABLE score_board
ADD COLUMN SKI int;

ALTER TABLE score_board
ADD COLUMN RACE int;

ALTER TABLE score_board
ADD COLUMN Body_Building int;
*/


/*Ajouter des valeurs d'athletes */
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






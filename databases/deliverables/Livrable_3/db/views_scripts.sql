/*VIEW Athletes*/
CREATE VIEW athletes_list AS 
SELECT id, name,gender 
FROM athletes ; 


/*VIEW COMPETITIONS */

CREATE VIEW competitions_list  AS 
SELECT id, name,entreprise_name,start_date, adresse_competitionv, end_date, number_events
FROM competitions;



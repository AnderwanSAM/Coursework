/*SELECT athletes_id, competition_id,competition_points,ski,race,body_building  FROM board 
ORDER BY competition_points DESC;*/



/*CREATE VIEW result AS */
SELECT  athletes_id, competition_id,competition_points, athletes.name, athletes.gender
FROM board 
INNER JOIN athletes  ON athletes.id = board.athletes_id 
ORDER BY competition_points;

/*

SELECT athletes.name , athletes.id
FROM athletes
JOIN result ON athletes.id = result.athletes_id;*/
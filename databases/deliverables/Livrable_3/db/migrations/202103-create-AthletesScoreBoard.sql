CREATE SEQUENCE scoreboard_id_seq;
CREATE TABLE score_board(
  id int DEFAULT nextval('scoreboard_id_seq'),
  competition_id int,
  competition_points int,
  athletes_id int,
  rank_competitions int ,
  PRIMARY KEY (id),
  FOREIGN KEY (athletes_id) references athletes
);

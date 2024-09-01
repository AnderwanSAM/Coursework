CREATE TABLE events (
  event_name varchar(200) NOT NULL,
  competition_id int NOT NULL,
  scoring_mode varchar(50),
  capmean varchar(200),
  tie_braker varchar(150),
  PRIMARY KEY (event_name),
  FOREIGN KEY (competition_id) REFERENCES competitions,
  CHECK(tie_braker ='ASC' OR tie_braker = 'DESC')
);
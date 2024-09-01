CREATE TABLE score (
  score_id varchar(100),
  score_id2 int,
  amount int ,
  event_name varchar(200) NOT NULL,
  FOREIGN KEY (score_id) References score_reps,
  FOREIGN KEy (event_name) References events,
  PRIMARY KEY (score_id2)
);
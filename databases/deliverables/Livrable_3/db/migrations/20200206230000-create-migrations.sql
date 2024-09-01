CREATE TABLE schema_migrations (
  migration varchar(1000),
  migrated_at timestamp NOT NULL DEFAULT NOW(),
  PRIMARY KEY (migration)
);

INSERT INTO schema_migrations (migration, migrated_at)
VALUES
  ('20200205100000-create-athletes.sql', '2020-02-05 10:00:00'),
  ('20200206230000-create-migrations.sql', DEFAULT),
  ('202103-create-partenaires.sql', DEFAULT),
  ('202103-modify-athletes.sql', DEFAULT),
  ('202103-modify-competitions.sql', DEFAULT),
  ('202103-createContactPerson.sql', DEFAULT),
  ('202103-create-events.sql', DEFAULT),
  ('202103-create-scoreReps.sql', DEFAULT),
  ('202103-create-AthletesScoreBoard.sql', DEFAULT),
  ('202103-create-score.sql', DEFAULT);

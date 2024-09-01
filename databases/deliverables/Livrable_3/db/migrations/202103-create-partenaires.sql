CREATE TABLE partener (
  entreprise_name varchar(200) NOT NULL,
  adresse varchar(500) NOT NULL,
  contact_person_name varchar(100),
  contact_person_number varchar(100) NOT NULL,
  PRIMARY KEY (entreprise_name),
  FOREIGN KEY (contact_person_number) REFERENCES contact_Person
);
# csi2532_playground
  
Lab04 


Probleme : 
 Une base de données universitaire contient
des informations sur les professeurs
(identifié par le numéro de sécurité sociale
ou SSN) et les cours (identifié par courseid).
Les professeurs donnent des cours; chacun
de les situations suivantes concernent
l'ensemble de relation teaches.


OBJECTIFS
‣ Transformez les diagrammes ER en
diagrammes relationnels.
‣ Gérer la structure de la base de
données avec SQL
‣ CREATE DATABASE / TABLE

Liens : 
1. Les professeurs peuvent enseigner le
même cours sur plusieurs semestres et seule
la plus récente doit être enregistrée.
https://github.com/AnderwanSAM/csi2532_playground/blob/lab04/csi2532_l4_1.png

3) Chaque professeur enseigne exactement
un cours (ni plus, ni moins).

https://github.com/AnderwanSAM/csi2532_playground/blob/lab04/ci2532_l4_3.png

5) Les professeurs peuvent enseigner le
même cours sur plusieurs semestres et
chaque doit être enregistrée.
https://github.com/AnderwanSAM/csi2532_playground/blob/lab04/csi2532_l4_5.png


6) Supposons maintenant que certains cours
puissent être enseignés conjointement par
une équipe de professeurs, mais il est
possible qu'aucun professeur dans une
équipe ne puisse enseigner le cours.
Modélisez cette situation en introduisant des
ensembles d'entités et des ensembles de
relations supplémentaires si nécessaire.
https://github.com/AnderwanSAM/csi2532_playground/blob/lab04/csi2532_l4_6.png



SQL pour chaque schema : 

1. Les professeurs peuvent enseigner le
même cours sur plusieurs semestres et seule
la plus récente doit être enregistrée.

CREATE TABLE professor (ssn varchar(8) , primary key (ssn));

CREATE TABLE course(
courseid varchar(8), primary key (courseid));

 
 CREATE TABLE teaches (number numeric(12,2), primary key(number), 
 ssn varchar(8), courseid varchar(8), 
 foreign key(ssn) references professor,
 foreign key(courseid) references course
 );




3) Chaque professeur enseigne exactement
un cours (ni plus, ni moins).


CREATE TABLE professor (ssn varchar(8) , primary key (ssn));

CREATE TABLE course(
courseid varchar(8), primary key (courseid));
 
  CREATE TABLE semester( semesterid varchar(8), primary key(semesterid));

 
 CREATE TABLE teaches (number numeric(12,2), primary key(number), 
 ssn varchar(8), courseid varchar(8), semesterid varchar(8),
 foreign key(ssn) references professor,
 foreign key(courseid) references course,
 foreign key(semesterid) references semester
 );



5) Les professeurs peuvent enseigner le
même cours sur plusieurs semestres et
chaque doit être enregistrée.

CREATE TABLE professor (ssn varchar(8) , primary key (ssn));

CREATE TABLE course(
courseid varchar(8), primary key (courseid));
 
Lab 06  CSI2532 Uottawa 

Andie SAMADOULOUGOU 300209487
=======

CREATE TABLE semester( semesterid varchar(8), primary key(semesterid));

**Les fichiers SQL ont aussi été push dans GITHUB **

ANDIE SAMADOULOUGOU 
300209487
Lab6

1)	   
/*Lister les noms des artistes et leur lieu de naissances*/

**SELECT name,birthplace FROM artists;**


![Image of 1](https://github.com/AnderwanSAM/csi2532_playground/blob/lab06/lab6_1.png)
 
2)	   
/*Lister le title et le price de toutes les artworks après 1600.*/

**SELECT title, price 
FROM artworks
WHERE year >1600;**

![Image of 2](https://github.com/AnderwanSAM/csi2532_playground/blob/lab06/lab6_2.png)

 
3)	     

/*Lister le title et le type de toutes les artworks qui ont été peintes en
2000 ou peintes par Picasso.*/

**SELECT title, type 
FROM artworks
WHERE year =2000 OR artist_name ='Picasso';**

![Image of 3](https://github.com/AnderwanSAM/csi2532_playground/blob/lab06/lab6_3.png)
 

 CREATE TABLE teaches (number numeric(12,2), primary key(number), 
 ssn varchar(8), courseid varchar(8), semesterid varchar(8),
 foreign key(ssn) references professor,
 foreign key(courseid) references course,
 foreign key(semesterid) references semester
 );


6) Supposons maintenant que certains cours
puissent être enseignés conjointement par
une équipe de professeurs, mais il est
possible qu'aucun professeur dans une
équipe ne puisse enseigner le cours.
Modélisez cette situation en introduisant des
ensembles d'entités et des ensembles de
relations supplémentaires si nécessaire.


CREATE TABLE professor (ssn varchar(8) , primary key (ssn));

CREATE TABLE course(
courseid varchar(8), primary key (courseid));

 
 CREATE TABLE teaches (number numeric(12,2), primary key(number), 
 ssn varchar(8), courseid varchar(8), semesterid varchar(8),
 foreign key(ssn) references professor,
 foreign key(courseid) references course,
 );






=======
4)	    
/*Lister les name et birthplace de tous les artists nés entre 1880 et
1930. (ASTUCE: EXTRACT(YEAR FROM dateofbirth) vous donne
l'année à partir d'un attribut DATE)*/

**SELECT name, birthplace 
FROM artists 
WHERE (EXTRACT(YEAR FROM dateofbirth)) BETWEEN 1880 AND 1930;**

 ![Image of 4](https://github.com/AnderwanSAM/csi2532_playground/blob/lab06/lab6_4.png)

5)	  
/*. Lister les name et le country de naissance de tous les artists dont le
style de peinture est Modern, Baroque or Renaissance. (ASTUCE:
utilisez le mot-clé IN).*/


**SELECT name, birthplace
FROM artists
WHERE style IN ('Modern','Baroque','Renaissance');**

 ![Image of 5](https://github.com/AnderwanSAM/csi2532_playground/blob/lab06/lab6_5.png)


6)	    

/*
Lister tous les détails des artworks dans la base de données, triés
par title*/

**SELECT * 
FROM artworks
ORDER BY title;**

![Image of 6](https://github.com/AnderwanSAM/csi2532_playground/blob/lab06/lab6_06.png)
 

7 ) 
/*Lister les name et les customer ids de tous les customers qui aiment Picasso*/

**SELECT name, customer_id 
FROM customers AS s , likeartists AS T  
WHERE s.id = T.customer_id AND T.artist_name = 'Picasso';**

![Image of 7](https://github.com/AnderwanSAM/csi2532_playground/blob/lab06/lab6_7.png)


8)	.Lister les name de tous les customers qui aiment les artistes de style Renaissance et dont le price est supérieur à 30000

**WITH artists_name(artist_name) as (SELECT name FROM artists WHERE style = 'Renaissance'),
artists_fan(customer_idd) as (SELECT customer_id FROM likeartists,artists_name WHERE likeartists.artist_name  = artists_name.artist_name)
SELECT name
FROM customers ,artists_fan
WHERE id = artists_fan.customer_idd AND amount > 30000;**

![Image of 8](https://github.com/AnderwanSAM/csi2532_playground/blob/lab06/lab6_8.png)

 


 
lab 2 CSI 2532 UOTTAWA 
Installation de Postgres 
Configuration d'environnement de developpement local 
Creation de base de donnees 
Manipulations basiques de la base de donnees (Requetes SQL simples)





lab 3 CSI 2532 Uottawa 

Dessin de diagrammes ER pour un systeme universitaire 
Cardinalite et relatons entre entites 

Probleme  : 
Une base de données universitaire contient
des informations sur les professeurs
(identifié par le numéro de sécurité sociale
ou SSN) et les cours (identifié par courseid).
Les professeurs donnent des cours; chacun
de les situations suivantes concernent
l'ensemble de relation teaches. 

Solutions : 

1) . Les professeurs peuvent enseigner le
même cours sur plusieurs semestres et seule
la plus récente doit être enregistrée
https://github.com/AnderwanSAM/csi2532_playground/blob/lab03/lab3_1.png

2) Chaque professeur doit enseigner un
cours
https://github.com/AnderwanSAM/csi2532_playground/blob/lab03/lab3_2.png

3) ) Chaque professeur enseigne exactement
un cours (ni plus, ni moins).
https://github.com/AnderwanSAM/csi2532_playground/blob/lab03/lab3_3.png

4) Chaque professeur enseigne exactement
un cours (ni plus, ni moins), et chaque cours
doit être enseigné par un professeur.
https://github.com/AnderwanSAM/csi2532_playground/blob/lab03/lab3_4.png

5) Les professeurs peuvent enseigner le
même cours sur plusieurs semestres et
chaque doit être enregistrée
https://github.com/AnderwanSAM/csi2532_playground/blob/lab03/lab3_5.png

6) ) Supposons maintenant que certains cours
puissent être enseignés conjointement par
une équipe de professeurs, mais il est
possible qu'aucun professeur dans une
équipe ne puisse enseigner le cours. 
https://github.com/AnderwanSAM/csi2532_playground/blob/lab03/lab3_6.png

=======
Labs CSI2532 Uottawa 
Introduction à GIT et exercices 
Consultez les autres branches!

Andie SAMADOULOUGOU 



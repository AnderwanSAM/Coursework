/*Lister les name et birthplace de tous les artists nés entre 1880 et
1930. (ASTUCE: EXTRACT(YEAR FROM dateofbirth) vous donne
l'année à partir d'un attribut DATE)*/

SELECT name, birthplace 
FROM artists 
WHERE (EXTRACT(YEAR FROM dateofbirth)) BETWEEN 1880 AND 1930;
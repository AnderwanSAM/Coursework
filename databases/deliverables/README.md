# projet-base_de_donnees



# WARNING : 

Please use these assignments for learning purposes only and do not use them to cheat as that is illegal.
April 2021 - Andie SAMADOULOUGOU


I -  Modele ER
 
![Image of 1](https://github.com/professor-forward/projet-base_de_donnees/blob/livrable3/Livrable_3/Modeles(ER%20et%20MR)/ER_livrable3.png)
 







II - Modele Relationnel 

![Image of 1](https://github.com/professor-forward/projet-base_de_donnees/blob/livrable3/Livrable_3/Modeles(ER%20et%20MR)/Relationnal_Model_livrable3.png)



POWER POINT : https://docs.google.com/presentation/d/1xitlSft4Sjp5ZCj-Gq_wpvKYVwDbZ-PVnSHWAYRbTNE/edit#slide=id.gd0c16e06e9_0_1126


VIII - REQUETES CRUD 

**C**
***voir seed.sql***
** Des exemples d'insertions se trouve dans le seed.sql plus haut **

**R**

Voir le leaderboard:   **Pour voir le leaderboard, lancer le fichier leaderboard_creation.sql :**
```
SELECT * FROM athletes_list 
INNER JOIN  score_board
ON athletes_list.id = score_board.athletes_id;
```


**U**
***voir seed.sql***
** Des exemples d'insertions se trouve dans le seed.sql plus haut **

**D**

Exemple : voir delete.sql
```
DELETE * FROM partner 
WHERE entreprise_name ='TETA';
```





IX - WEB APP MeFIT (AFFICHAGE DU LEADERBOARD)
DISPONIBLE DANS ./livrable3/public






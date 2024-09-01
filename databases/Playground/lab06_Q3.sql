/*Lister le title et le type de toutes les artworks qui ont été peintes en
2000 ou peintes par Picasso.*/

SELECT title, type 
FROM artworks
WHERE year =2000 OR artist_name ='Picasso';
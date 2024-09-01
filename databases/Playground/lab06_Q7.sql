/*Lister les name et les customer ids de tous les customers qui aiment Picasso*/
SELECT name, customer_id 
FROM customers AS s , likeartists AS T  
WHERE s.id = T.customer_id AND T.artist_name = 'Picasso';
/*.Lister les name de tous les
customers qui aiment les artistes de
style Renaissance et dont le price
est supérieur à 30000*/

WITH artists_name(artist_name) as (SELECT name FROM artists WHERE style = 'Renaissance'),
artists_fan(customer_idd) as (SELECT customer_id FROM likeartists,artists_name WHERE likeartists.artist_name  = artists_name.artist_name)
SELECT name
FROM customers ,artists_fan
WHERE id = artists_fan.customer_idd AND amount > 30000;

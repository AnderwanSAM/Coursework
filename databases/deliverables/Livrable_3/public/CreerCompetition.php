
<!DOCTYPE html>
<html>
<head>
	<title>Creer Competition </title>
</head>


<body>


	<form action="addCompetition.php" method="post">
		<br>
		Entrez le nom de la competition : <input type="text" name="competition_name"> <br><br>
		Entrez la venue  : <input type="text" name="venue"> <br><br>
		Entrez la date de debut de la competition : <input type="text" name="start_date"> <br><br>
		Entrez la date de fin de la competition   : <input type="text" name="end_date"> <br><br>
		Entrez le nom de l'entreprise pour laquelle vous travailler  : <input type="text" name="entreprise"> <br><br>
	Entrez l'adresse  la competition : <input type="text" name="adresse"><br><br>
	Entrez le numero de la personne contact : <input type="text" name="contact_number"> <br><br>
	<!--<input type="submit" name="INSCRIPTION"> -->
     <br> <br> <br>
    Veuillez confirmer les informations de votre base de donnees <br><br> 
  	Enter the name of your  database <input type="text" name="dbname"> <br>
  	Enter the username of your database <input type="text" name="dbusername"> <br>
  	Enter the password of your database <input type="password" name="dbpassword"><br>

	<button name="INSCRIPTION" type="submit" value="YOO">INSCRIPTION</button>
	</form>


</body>
</html>
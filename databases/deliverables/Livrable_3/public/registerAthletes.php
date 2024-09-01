
<!DOCTYPE html>
<html>
<head>
	<title>Get Athletes  Data</title>
</head>


<body>


	<form action="addAthletes.php" method="post">
		<br>
     <h2>Veuillez entrer les details sur l'Athlete: </h2> <br> <br>
	Entrez un id (Carte d'identite number ? ) pour votre Athlete : <input type="text" name="athlete_id"> <br><br>
	Entrez le nom de l'Athlete : <input type="text" name="athlete_name"><br><br>
	Entrez le gendre de 'Athlete  : <input type="text" name="athlete_gender"><br><br>
	Entrez la date de naissance de l'Athlete : <input type="text" name="athlete_dob"> <br><br>
	Entrez le courriel de l'Athlete : <input type="text" name="athlete_email"> <br><br>
	<!--<input type="submit" name="INSCRIPTION"> -->
    <br> <br> <br>
    Veuillez entrer l'id de la competition <input type="text" name="competition_id"> 
     <br> <br> <br>

     <br> <br> <br>
    Veuillez confirmer les informations de votre base de donnees <br><br> 
  	Enter the name of your  database <input type="text" name="dbname"> <br>
  	Enter the username of your database <input type="text" name="dbusername"> <br>
  	Enter the password of your database <input type="password" name="dbpassword"><br>

	<button name="INSCRIPTION" type="submit" value="YOO">INSCRIPTION</button>
	</form>


</body>
</html>
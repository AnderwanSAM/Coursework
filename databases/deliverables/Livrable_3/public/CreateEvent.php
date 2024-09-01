<?php require_once "addEvent.php"; ?>



<!DOCTYPE html>
<html>
<head>
	<title>YO</title>
</head>
<body>
  
  <h3> Veuillez ajouter des evenements à votre competition </h3> <br>

  
      <form action="addEvent.php" method="post">
            <br>
            Entrez le nom de l'evenement  : <input type="text" name="event_name"> <br><br>
            Entrez l'id de la competition  : <input type="text" name="competition_name"> <br><br>
            Entrez le mode de  marquage (scoring mode ): <input type="text" name="scoring_mode"> <br><br>
            Entrez le cape_mean : <input type="text" name="cape_mean"> <br><br>
            Entrez le tie-breaker  : <input type="text" name="tie_breaker"> <br><br>
     
     <br> <br> <br>
    Veuillez confirmer les informations de votre base de donnees <br><br> 
      Enter the name of your  database <input type="text" name="dbname"> <br>
      Enter the username of your database <input type="text" name="dbusername"> <br>
      Enter the password of your database <input type="password" name="dbpassword"><br>

      <button name="INSCRIPTION" type="submit" value="YOO">Enregistrer </button>
      </form>

	 

</body>
</html>
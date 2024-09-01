
<?php



$nameEntreprise= "";
$nameCompetition= "";
$adresse = "";
$start_date = "";
$end_date ="";
$contact_number ="";
$venue = "";



    if (isset($_POST['INSCRIPTION'])){


      $dbname = $_POST['dbname'];
      $dbusername = $_POST['dbusername'];
      $dbpassword = $_POST['dbpassword'];

      $adresse = $_POST['adresse'];
      $nameCompetition = $_POST['competition_name'];
      $contact_number = $_POST['contact_number'];
      $nameEntreprise = $_POST['entreprise'];
      $venue = $_POST['venue'];
      $start_date = $_POST['start_date'];
      $end_date = $_POST['end_date'];
      
      $dbconn = pg_connect("host=localhost port=5432 dbname=$dbname  user=$dbusername password=$dbpassword") or die('failed');



      
      $query = "INSERT INTO competitions (name,adresse_competitionv,number_athletes,start_date,end_date,number_events,contact_person_number,entreprise_name,venue) VALUES ('$nameCompetition','$adresse',0,'$start_date','$end_date',0,'$contact_number','$nameEntreprise','$venue')";
     
      $run = pg_query($dbconn,$query);
      
      if ($run == TRUE){
      	echo "INSERTION SUCCESSFUL ";
      }
      else {
      	echo "PAS d'insertion";
      }

    }












?>

<!DOCTYPE html>
<html>
<head>
      <title>Ajout d'evenement necessaire</title>
      <form action="CreateEvent.php" method="post">
            
      <button name="INSCRIPTION" type="submit" value="YOO">Creation d'evenements </button>
      </form>
</head>
<body>

</body>
</html>
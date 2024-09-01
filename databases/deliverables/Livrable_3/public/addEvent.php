<?php require_once "CreateEvent.php"; ?>

<?php



$event_name= "";
$competition_id = "";
$cap_mean = "";
$tie_braker ="";
$scoring_mode = "";



    if (isset($_POST['INSCRIPTION'])){


      $dbname = $_POST['dbname'];
      $dbusername = $_POST['dbusername'];
      $dbpassword = $_POST['dbpassword'];

      $event_name= $_POST['event_name'];
      $cap_mean = $_POST['cape_mean'];
      $tie_braker= $_POST['tie_breaker'];
      $scoring_mode = $_POST['scoring_mode'];
      $competition_id = $_POST['competition_name'];
      
       

     $dbconn = pg_connect("host=localhost port=5432 dbname=$dbname  user=$dbusername password=$dbpassword") or die('failed');

    /* $competition_id = pg_query($dbconn,"SELECT id FROM competitions WHERE name = '$competition_name'");*/
     

      $query = "INSERT INTO events(competition_id,event_name,scoring_mode,capmean,tie_braker) VALUES ($competition_id, '$event_name', '$scoring_mode','$cap_mean', '$tie_braker')";
      $query2 = "UPDATE competitions SET number_events =  number_events + 1 WHERE id = (SELECT id FROM competitions WHERE id = $competition_id)";

      $query3 = " ALTER TABLE score_board ADD COLUMN $event_name int";
    
      $run = pg_query($dbconn,$query);
      $run2 = pg_query($dbconn,$query2);
      $run3 = pg_query($dbconn,$query3);
      
      if ($run == TRUE){
      	echo " ". $event_name . "ajoute ";
      }
      else {
      	echo "Echec ";
      }

    }

  










?>
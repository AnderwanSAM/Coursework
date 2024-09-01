<?php require_once "registerPartener.php"; ?>

<?php



$name= "";
$adresse = "";
$contact_name = "";
$contact_number ="";



    if (isset($_POST['INSCRIPTION'])){


      $dbname = $_POST['dbname'];
      $dbusername = $_POST['dbusername'];
      $dbpassword = $_POST['dbpassword'];

      $adresse = $_POST['adresse'];
      $contact_name = $_POST['contact_name'];
      $contact_number = $_POST['contact_number'];
      $name = $_POST['entreprise'];
      
      $dbconn = pg_connect("host=localhost port=5432 dbname=$dbname  user=$dbusername password=$dbpassword") or die('failed');



      $query1 = "INSERT INTO contact_person (email,contact_person_number, contact_name) VALUES('aaa@gmail.com','$contact_number','$contact_name')";
      $query = "INSERT INTO partener (entreprise_name,contact_person_number, contact_person_name,adresse) VALUES ('$name', '$contact_number', '$contact_name','$adresse')";
      $run1 = pg_query($dbconn,$query1);
      $run = pg_query($dbconn,$query);
      
      if ($run1 == TRUE){
      	echo "YES";
      }
      else {
      	echo "Merde";
      }

    }












?>


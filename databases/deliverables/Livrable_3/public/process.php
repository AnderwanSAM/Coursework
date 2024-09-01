<?php


$name = $_POST["name"];
$username = $_POST["username"];
$password = $_POST["password"];

$dbconn = pg_connect("host=localhost port=5432 dbname=$name  user=$username password=$password") or die('failed');
$result = pg_query($dbconn, "SELECT identifier, name, venue, start_date FROM competitions");
$data = pg_fetch_all($result);
?>

<style>
.table-container {
  margin: 20px;
}
table {
  width: 100%;
}
table tr th {
  text-align: left;
  background-color: #D9E2EC;
}
</style>

<h1>Competitions</h1>
<div class="table-container">
  <table>
    <tr>
      <th>Name</th>
      <th>Venue</th>
      <th>Start Date</th>
    </tr>
    <?php foreach ($data as $row) {?>
      <tr>
        <td><a href="competition.php?id=<?php echo $row["identifier"] ?>"><?php echo $row["name"] ?></a></td>
        <td><?php echo $row["venue"] ?></td>
        <td><?php echo $row["start_date"] ?></td>
      </tr>
    <?php } ?>
  </table>
</div>
<br><br><br><br>
<!DOCTYPE html>
<html>
<head>
  <title>PAGE 2</title>
</head>
<body>
      <br><br>
 <form action="registerPartener.php" method="get">

   <button name="INSCRIPTION" type="submit" value=".$my_name">Enregistrer une compagnie partenaire </button>
   <br>
 </form>
 <br><br>
 <form action="registerAthletes.php" method="post">
   <button name="INSCRIPTION" type="submit" value="CSS">Enregistrer un athlete</button>
 </form>>
<br><br>
 <form action="CreerCompetition.php" method="get">
   <button name="INSCRIPTION" type="submit" value=".$my_name">Creer une competition </button>
   <br>
 </form>



</body>
</html>






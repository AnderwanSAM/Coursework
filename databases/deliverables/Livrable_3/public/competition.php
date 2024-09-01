<?php


if (!isset($_GET["id"])) {
    header('Location: index.php');
    exit;
}




//echo " Hey ";



global $name; // = $_POST["name"];
global $username ;//= $_POST["username"];
global $password;// = $_POST["password"];


$competitionId = $_GET["id"];
$dbconn = pg_connect("host=localhost port=5432 dbname=leaderboard  user=postgres password=Avenirottawa@1");
$sql = 'SELECT * FROM competitions WHERE identifier = $1';
$result = pg_query_params($dbconn, $sql, [$competitionId]);
$data = pg_fetch_all($result);

if (empty($data)) {
  $competition = null;
  $athletes = [];
} else {
  $competition = $data[0];
  $sql = 'SELECT  athletes_id, competition_id,competition_points, athletes.name,athletes.gender
FROM board 
INNER JOIN athletes  ON athletes.id = board.athletes_id 
ORDER BY competition_points ASC ;
   ';
  $result = pg_query($dbconn, $sql);
  $athletes = pg_fetch_all($result);
}

if (empty($competition)) {
  ?><h1>Unknown competiton <?php echo $competitionId; ?></h1><?php
} elseif (empty($athletes)) {
  ?><h1>No athletes registered for <?php echo $competition["name"]; ?></h1><?php
} else {
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

    <h1><?php echo $competition["name"]; ?></h1>
    <div class="table-container">
      <table>
        <tr>
          <th>Athlete ID </th>
          <th>Name</th>
          <th>competition points </th>
          <th>Gender</th>
        </tr>
        <?php foreach ($athletes as $row) {?>
          <tr>
            <td><?php echo $row["athletes_id"] ?></td>
            <td><?php echo $row["name"] ?></td>
            <td><?php echo $row["competition_points"] ?></td>
            <td><?php echo $row["gender"] ?></td>
          </tr>
        <?php } ?>
      </table>
    </div>
  <?php
}
<?php


if (!isset($_GET["id"])) {
    header('Location: index.php');
    exit;
}

$competitionId = $_GET["athletes_id"];
$dbconn = pg_connect("host=localhost port=5432 dbname=leaderboard  user=postgres password=Avenirottawa@1");
$sql = 'SELECT athletes_id, competition_id,competition_points,ski,race,body_building  FROM board 
ORDER BY competition_points DESC';
$result = pg_query_params($dbconn, $sql, [$competitionId]);
$data = pg_fetch_all($result);

if (empty($data)) {
  $competition = null;
  $athletes = [];
} else {
  $competition = $data[0];
  $sql = 'SELECT * FROM competitions_list';
  $result = pg_query_params($dbconn, $sql, [$competition["competition_id"]]);
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

    <h1><?php echo $competition["competition_id"]; ?></h1>
    <div class="table-container">
      <table>
        <tr>
          <th>athletes_id</th>
          <th>competition_id</th>
          <th>competition_points</th>
           <th>SKI</th>
            <th>Race</th>
              <th>Body Building</th>
        </tr>
        <?php foreach ($athletes as $row) {?>
          <tr>
            <td><?php echo $row["athletes_id"] ?></td>
            <td><?php echo $row["competition_id"] ?></td>
            <td><?php echo $row["competition_points"] ?></td>
             <td><?php echo $row["ski"] ?></td>
             <td><?php echo $row["race"] ?></td>
             <td><?php echo $row["body_building"] ?></td>
          </tr>
        <?php } ?>
      </table>
    </div>
  <?php
}
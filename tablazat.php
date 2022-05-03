<?php
include_once 'Ab.php';
?>
<!DOCTYPE html>
<html lang="hu">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Magyar kártya</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <div class="content_div">
        <div class="container sticky">
            <div class="topnav">
                <a href="index.php">Főoldal</a>
                <a href="tablazat.php">Táblázat</a>
                <a href="#">Rendezett kártyák</a>
                <a href="#">Kártyák osztály használatával</a>
                <a href="#">Játék (21)</a>
            </div>
        </div>
        <h1>Játék szabály</h1>
        <h2>wikipédia..</h2>
        <?php
        $adatbazis = new Ab();
        //ha nincs feltöltve, akkor feltölti
        //echo gettype($kepek);
        //while ($sor = $kepek->fetch_row()) {
        //echo $sor[1];
        //echo "<img id='kicsi' src='forras/$sor[0]' alt='$sor[0]'>";
        //}
        $kepek = $adatbazis->adatLeker('kep', 'szin');
        $nev = $adatbazis->adatLeker('nev', 'szin');
        $kepekTomb = $adatbazis->tombKeszit($kepek);
        $nevTomb = $adatbazis->tombKeszit($nev);
        echo "<table>";
        echo "<tr>";
        echo "<th>Kép</th>";
        echo "<th>Név</th>";
        echo "</tr>";

        for ($i = 0; $i < count($nevTomb) && count($kepekTomb); $i++) {
            echo "<tr>";
            echo "<td><img id='kicsi' src='forras/$kepekTomb[$i]' alt='$kepekTomb[$i]'></td><td>$nevTomb[$i]</td>";
            echo "</tr>";
        }
        echo "</table>";
        ?>
    </div>

</body>

</html>
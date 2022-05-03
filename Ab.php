<?php
//létrehozunk osztályt
class Ab
{
    //adattagok
    private $host = "localhost";
    private $felhasznaloNev = "root";
    private $jelszo = "";
    private $abNev = "magyarkartya";
    private $kapcsolat;

    //konstruktor
    public function __construct()
    {
        $this->kapcsolat = new mysqli($this->host, $this->felhasznaloNev, $this->jelszo, $this->abNev);
        //Sikeres kapcsolat kapcsolat ellenőrzése
        if ($this->kapcsolat->connect_error) {
            echo "<p>Hibás kapcsolódás</p>";
        } else {
            echo "<p>Sikeres kapcsolódás</p>";
        }
        //ékezetes betűk
        $this->kapcsolat->query("SET NAMES UTF8");
    }

    function azonMind($tabla)
    {
        $result = $this->kapcsolat->query("SELECT * FROM $tabla");
        return $result->num_rows;
    }


    //kártya tábla feltöltése
    public function kartyaFeltolt($tabla)
    {
        $siker = true;
        $countSzin = $this->azonMind('szin') + 1;
        $countForma = $this->azonMind('forma') + 1;
        //két egymásba ágyazott for ciklus
        for ($indexSzin = 1; $siker && $indexSzin < $countSzin; $indexSzin++) {
            for ($indexForma = 1; $siker && $indexForma < $countForma; $indexForma++) {
                $sql = "INSERT INTO $tabla (kartyaAzon, szinAzon, formAzon) VALUES (NULL, $indexSzin, $indexForma);";
                //echo $sql;//hibakeresés miatt
                if ($this->kapcsolat->query($sql)) {
                    echo ' Siker <br>';
                } else {
                    echo ' Sikertelen <br>';
                    $siker = FALSE;
                }
            }
        }

        //lekérdezés futtatása
        return $siker;
    }

    public function adatLeker($oszlop, $tabla)
    {
        $sql = "SELECT $oszlop FROM $tabla";
        //egy tömbbel tér vissza
        $adatok = $this->kapcsolat->query($sql);
        return $adatok;
    }
    function adatLekerTablazatos($oszlop1, $oszlop2, $tabla)
    {
        $sql = "SELECT $oszlop1, $oszlop2 FROM $tabla ORDER BY $oszlop1";
        $result = $this->kapcsolat->query($sql);
        echo "<table><tr><th>Név</th><th>Kép</th></tr>";
        while($row = $result->fetch_assoc()){
            echo "<tr><td>". $row[$oszlop2]."</td><td><img src = \ "forras/".$row[$oszlop1]."\" alt=\"kártya képe\">
            </td></tr>";
            echo "</table>";
        }
    }
}

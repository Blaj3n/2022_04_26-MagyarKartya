<?php

class Kartya {
    //osztály változók
    
    private $szin;
    private $forma;
    
    //metódusok
    function __construct() {
	$this->szin = "piros";
	$this->forma = "ász";
    }

    function getSzin() {
	return $this->szin;
    }

    function getForma() {
	return $this->forma;
    }

    function setSzin($szin) {
	$this->szin = $szin;
    }

    function setForma($forma) {
	$this->forma = $forma;
    }

    public function __toString() {
	return "Kártya:".$this->szin." ".$this->forma." .<br>";
    }


}
?>
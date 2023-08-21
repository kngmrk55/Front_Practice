<?php
//Conexión con base de datos
$servername = "localhost";
$database = "electronicsstore";
$username = "root";
$password = "";

$conn = mysqli_connect($servername, $username, $password, $database);

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
?>
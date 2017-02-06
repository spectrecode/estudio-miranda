<?php
date_default_timezone_set('America/Lima');//-->definimos la zona horaria

include('../../config/conexion.php');
include('../../modelo/funciones.php');
//include('modelo/usuario.php');
include('../../modelo/biblioteca.php');

$arrjson 			= "";

$objbiblio   = new Bilioteca("localhost","abogados_wp","abogados_wp","M&a2015@@");
$resultado = $objbiblio->listadoCategoriawp();
$arrjson['arr']= $resultado;

echo json_encode($arrjson);

?>
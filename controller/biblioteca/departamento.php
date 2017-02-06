<?php
date_default_timezone_set('America/Lima');//-->definimos la zona horaria

include('../../config/conexion.php');
include('../../modelo/funciones.php');
include('../../modelo/ubigeo.php');
include('../../modelo/globales.php');

/*
	traer la informacion desde JSON
*/
$arrjson 			= "";

$objdep 	= new Ubigeo();
$datanot 	= $objdep->dameDepartamento();
$arrjson['arr']= $datanot;

echo json_encode($arrjson);

?>
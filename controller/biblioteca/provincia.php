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
$data 				= json_decode(file_get_contents('php://input'), true);
$idDpto 			= $data['id'];

$objdep 	= new Ubigeo();
$datanot 	= $objdep->dameProvincia($idDpto);
$arrjson['arr']= $datanot;

echo json_encode($arrjson);

?>
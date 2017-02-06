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
$idProv 			= $data['id'];
$idDpto 			= $data['idDpto'];

$objdep 	= new Ubigeo();
$datanot 	= $objdep->dameDistrito($idDpto,$idProv);
$arrjson['arr']= $datanot;

echo json_encode($arrjson);


//************************
function cargarUbigeo($id=NULL,$id2=NULL){
	$sql="select id,nombre,CodDist ";
	$sql.="from ubigeo ";
	$sql.="where CodDpto = ".$id." ";
	$sql.="and CodProv = ".$id2." ";
	$sql.="and CodProv != 0 ";
	$sql.="and CodDist != 0 ";
	//$sql.="Group by CodProv ";
	$sql.="order by nombre ASC ";
	//$sql.="limit 0, 118 ";
	
	$rs = mysql_query($sql);
	$nUbi = mysql_num_rows($rs);
	$arr = '[';
	for($i=0; $i< $nUbi; $i++){
		$id = mysql_result($rs,$i,"id");
		$nombre = utf8_encode(mysql_result($rs,$i,"nombre"));
		$CodDist = mysql_result($rs,$i,"CodDist");
		$arr.= '{';
		$arr.= '"id" : '.$id.',';
		$arr.= '"name" : "'.$nombre.'",';
		$arr.= '"codDist" : "'.$CodDist.'"';
		if ($i >= ($nUbi-1))
			$arr.= '}';
		else
			$arr.= '},';
	}
	$arr.= "]";
	return $arr; 
}

?>
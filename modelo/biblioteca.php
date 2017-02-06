<?php
class Bilioteca extends Conexion{
	function listadoCategoriawp(){
		$sql = "SELECT id, post_content, post_title ";
		$sql.= "FROM mya_posts ";
		$sql.= "WHERE post_type = 'area'";
		$arrdata = $this->Sqlfetch_assoc($sql);
		$item = count($arrdata) - 1;
		$arrjson[0]['id'] = "0";
		$arrjson[0]['contenido'] = "";
		$arrjson[0]['name'] = "Seleccione Área";
		$arrjson[0]['pos_ini'] = "0";
		$arrjson[0]['pos_fin'] = "0";
		$arrjson[0]['xx'] = "xx";
		$cont = 1;
		for ($i=0; $i<=$item; $i++){
			$data = $arrdata[$i];
			$arrjson[$cont]['id'] = $data['id']; 
			$arrjson[$cont]['contenido'] = $data['post_content'];
			$arrjson[$cont]['xx'] = $data['post_title'];
			$arrjson[$cont]['pos_ini'] = 5;//strpos($data['post_title'], "[:es]");
			$arrjson[$cont]['pos_fin'] = strpos($data['post_title'], "[:en]") - 5;
			$arrjson[$cont]['name'] = substr($data['post_title'],$arrjson[$cont]['pos_ini'],$arrjson[$cont]['pos_fin']);
			$cont++;
		}
		return $arrjson;
	}
}
?>
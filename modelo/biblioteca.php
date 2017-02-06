<?php
class Bilioteca extends Conexion{
	function listadoCategoriawp(){
		$page = $this->limpiacadena($page);
		$filtro = $this->limpiacadena($filtro);

		$sql = "SELECT id, post_content, post_title ";
		$sql.= "FROM mya_posts ";
		$sql.= "WHERE post_type = 'area'";

		return $this->Sqlfetch_assoc($sql);	
	}
}
?>
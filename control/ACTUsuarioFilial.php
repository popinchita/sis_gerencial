<?php
/**
*@package pXP
*@file gen-ACTUsuarioFilial.php
*@author  (admin)
*@date 24-07-2014 23:54:44
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTUsuarioFilial extends ACTbase{    
			
	function listarUsuarioFilial(){
		$this->objParam->defecto('ordenacion','id_usuario_filial');

		$this->objParam->defecto('dir_ordenacion','asc');
		
		$id_usuario=$this->objParam->getParametro('id_usuario');
		
		$this->objParam->addParametro('id_usuario',$id_usuario);
		
		if ($this->objParam->getParametro('id_usuario') != '') {
			$this->objParam->addFiltro("usufil.id_usuario= ". $this->objParam->getParametro('id_usuario'));
		}
		
		
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODUsuarioFilial','listarUsuarioFilial');
		} else{
			$this->objFunc=$this->create('MODUsuarioFilial');
			
			$this->res=$this->objFunc->listarUsuarioFilial($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarUsuarioFilial(){
		$this->objFunc=$this->create('MODUsuarioFilial');	
		if($this->objParam->insertar('id_usuario_filial')){
			$this->res=$this->objFunc->insertarUsuarioFilial($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarUsuarioFilial($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarUsuarioFilial(){
			$this->objFunc=$this->create('MODUsuarioFilial');	
		$this->res=$this->objFunc->eliminarUsuarioFilial($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>
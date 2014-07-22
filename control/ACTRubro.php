<?php
/**
*@package pXP
*@file gen-ACTRubro.php
*@author  (admin)
*@date 21-07-2014 22:05:01
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTRubro extends ACTbase{    
			
	function listarRubro(){
		$this->objParam->defecto('ordenacion','id_rubro');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODRubro','listarRubro');
		} else{
			$this->objFunc=$this->create('MODRubro');
			
			$this->res=$this->objFunc->listarRubro($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarRubro(){
		$this->objFunc=$this->create('MODRubro');	
		if($this->objParam->insertar('id_rubro')){
			$this->res=$this->objFunc->insertarRubro($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarRubro($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarRubro(){
			$this->objFunc=$this->create('MODRubro');	
		$this->res=$this->objFunc->eliminarRubro($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>
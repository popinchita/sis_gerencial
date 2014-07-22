<?php
/**
*@package pXP
*@file gen-ACTDato.php
*@author  (admin)
*@date 22-07-2014 01:58:52
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTDato extends ACTbase{    
			
	function listarDato(){
		$this->objParam->defecto('ordenacion','id_dato');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODDato','listarDato');
		} else{
			$this->objFunc=$this->create('MODDato');
			
			$this->res=$this->objFunc->listarDato($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarDato(){
		$this->objFunc=$this->create('MODDato');	
		if($this->objParam->insertar('id_dato')){
			$this->res=$this->objFunc->insertarDato($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarDato($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarDato(){
			$this->objFunc=$this->create('MODDato');	
		$this->res=$this->objFunc->eliminarDato($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>
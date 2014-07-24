<?php
/**
*@package pXP
*@file gen-ACTFilial.php
*@author  (admin)
*@date 23-07-2014 16:09:32
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTFilial extends ACTbase{    
			
	function listarFilial(){
		$this->objParam->defecto('ordenacion','id_filial');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODFilial','listarFilial');
		} else{
			$this->objFunc=$this->create('MODFilial');
			
			$this->res=$this->objFunc->listarFilial($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarFilial(){
		$this->objFunc=$this->create('MODFilial');	
		if($this->objParam->insertar('id_filial')){
			$this->res=$this->objFunc->insertarFilial($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarFilial($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarFilial(){
			$this->objFunc=$this->create('MODFilial');	
		$this->res=$this->objFunc->eliminarFilial($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>
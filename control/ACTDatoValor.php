<?php
/**
*@package pXP
*@file gen-ACTDatoValor.php
*@author  (admin)
*@date 24-07-2014 07:59:41
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTDatoValor extends ACTbase{    
			
	function listarDatoValor(){
		$this->objParam->defecto('ordenacion','id_dato_valor');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODDatoValor','listarDatoValor');
		} else{
			$this->objFunc=$this->create('MODDatoValor');
			
			$this->res=$this->objFunc->listarDatoValor($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarDatoValor(){
		$this->objFunc=$this->create('MODDatoValor');	
		if($this->objParam->insertar('id_dato_valor')){
			$this->res=$this->objFunc->insertarDatoValor($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarDatoValor($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarDatoValor(){
			$this->objFunc=$this->create('MODDatoValor');	
		$this->res=$this->objFunc->eliminarDatoValor($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>
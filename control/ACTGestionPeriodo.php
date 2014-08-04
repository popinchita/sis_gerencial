<?php
/**
*@package pXP
*@file gen-ACTGestionPeriodo.php
*@author  (admin)
*@date 24-07-2014 07:56:09
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTGestionPeriodo extends ACTbase{    
			
	function listarGestionPeriodo(){
		$this->objParam->defecto('ordenacion','id_gestion_periodo');

		$this->objParam->defecto('dir_ordenacion','asc');
		
		if($this->objParam->getParametro('estado_reg')!=''){
			$this->objParam->addFiltro("peri.estado_reg = ''".$this->objParam->getParametro('estado_reg')."''");
		}
		
		
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODGestionPeriodo','listarGestionPeriodo');
		} else{
			$this->objFunc=$this->create('MODGestionPeriodo');
			
			$this->res=$this->objFunc->listarGestionPeriodo($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarGestionPeriodo(){
		$this->objFunc=$this->create('MODGestionPeriodo');	
		if($this->objParam->insertar('id_gestion_periodo')){
			$this->res=$this->objFunc->insertarGestionPeriodo($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarGestionPeriodo($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarGestionPeriodo(){
			$this->objFunc=$this->create('MODGestionPeriodo');	
		$this->res=$this->objFunc->eliminarGestionPeriodo($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
	
	
	function AperturarGestionPeriodo(){
	
		//crea el objetoFunProcesoMacro que contiene todos los metodos del sistema de workflow
		$this->objFunc=$this->create('MODGestionPeriodo');
	
		$this->res=$this->objFunc->AperturarGestionPeriodo($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>
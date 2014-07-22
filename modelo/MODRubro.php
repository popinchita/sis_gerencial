<?php
/**
*@package pXP
*@file gen-MODRubro.php
*@author  (admin)
*@date 21-07-2014 22:05:01
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODRubro extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarRubro(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='scger.ft_rubro_sel';
		$this->transaccion='SCGER_RUB_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_rubro','int4');
		$this->captura('nombre_rubro','varchar');
		$this->captura('descripcion_rubro','varchar');
		$this->captura('codigo_rubro','varchar');
		$this->captura('estado_reg','varchar');
		$this->captura('id_usuario_reg','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('fecha_mod','timestamp');
		$this->captura('id_usuario_mod','int4');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarRubro(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='scger.ft_rubro_ime';
		$this->transaccion='SCGER_RUB_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('nombre_rubro','nombre_rubro','varchar');
		$this->setParametro('descripcion_rubro','descripcion_rubro','varchar');
		$this->setParametro('codigo_rubro','codigo_rubro','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarRubro(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='scger.ft_rubro_ime';
		$this->transaccion='SCGER_RUB_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_rubro','id_rubro','int4');
		$this->setParametro('nombre_rubro','nombre_rubro','varchar');
		$this->setParametro('descripcion_rubro','descripcion_rubro','varchar');
		$this->setParametro('codigo_rubro','codigo_rubro','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarRubro(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='scger.ft_rubro_ime';
		$this->transaccion='SCGER_RUB_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_rubro','id_rubro','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>
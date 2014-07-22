<?php
/**
*@package pXP
*@file gen-MODDato.php
*@author  (admin)
*@date 22-07-2014 01:58:52
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODDato extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarDato(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='scger.ft_dato_sel';
		$this->transaccion='SCGER_DATO_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_dato','int4');
		$this->captura('id_tipo_dato','int4');
		$this->captura('formula','varchar');
		$this->captura('estado_reg','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('id_usuario_reg','int4');
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
			
	function insertarDato(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='scger.ft_dato_ime';
		$this->transaccion='SCGER_DATO_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_tipo_dato','id_tipo_dato','int4');
		$this->setParametro('formula','formula','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarDato(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='scger.ft_dato_ime';
		$this->transaccion='SCGER_DATO_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_dato','id_dato','int4');
		$this->setParametro('id_tipo_dato','id_tipo_dato','int4');
		$this->setParametro('formula','formula','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarDato(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='scger.ft_dato_ime';
		$this->transaccion='SCGER_DATO_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_dato','id_dato','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>
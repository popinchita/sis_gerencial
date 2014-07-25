<?php
/**
*@package pXP
*@file gen-MODUsuarioFilial.php
*@author  (admin)
*@date 24-07-2014 23:54:44
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODUsuarioFilial extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarUsuarioFilial(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='scger.ft_usuario_filial_sel';
		$this->transaccion='SCGER_USUFIL_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
		
		//$this->setParametro('id_usuario','id_usuario','integer');
		//Definicion de la lista del resultado del query
		$this->captura('id_usuario_filial','int4');
		$this->captura('id_usuario','int4');
		$this->captura('id_filial','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
		$this->captura('id_usuario_reg','int4');
		$this->captura('id_usuario_ai','int4');
		$this->captura('id_usuario_mod','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('nombre','varchar');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarUsuarioFilial(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='scger.ft_usuario_filial_ime';
		$this->transaccion='SCGER_USUFIL_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_usuario','id_usuario','int4');
		$this->setParametro('id_filial','id_filial','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarUsuarioFilial(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='scger.ft_usuario_filial_ime';
		$this->transaccion='SCGER_USUFIL_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_usuario_filial','id_usuario_filial','int4');
		$this->setParametro('id_usuario','id_usuario','int4');
		$this->setParametro('id_filial','id_filial','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarUsuarioFilial(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='scger.ft_usuario_filial_ime';
		$this->transaccion='SCGER_USUFIL_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_usuario_filial','id_usuario_filial','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>
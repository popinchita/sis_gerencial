<?php
/**
*@package pXP
*@file gen-MODDatoValor.php
*@author  (admin)
*@date 24-07-2014 07:59:41
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODDatoValor extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarDatoValor(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='scger.ft_dato_valor_sel';
		$this->transaccion='SCGER_VALOR_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_dato_valor','int4');
		$this->captura('id_dato','int4');
		$this->captura('id_filial','int4');
		$this->captura('valor','numeric');
		$this->captura('id_gestion_periodo','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('id_usuario_reg','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('id_usuario_ai','int4');
		$this->captura('usuario_ai','varchar');
		$this->captura('id_usuario_mod','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarDatoValor(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='scger.ft_dato_valor_ime';
		$this->transaccion='SCGER_VALOR_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_dato','id_dato','int4');
		$this->setParametro('id_filial','id_filial','int4');
		$this->setParametro('valor','valor','numeric');
		$this->setParametro('id_gestion_periodo','id_gestion_periodo','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarDatoValor(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='scger.ft_dato_valor_ime';
		$this->transaccion='SCGER_VALOR_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_dato_valor','id_dato_valor','int4');
		$this->setParametro('id_dato','id_dato','int4');
		$this->setParametro('id_filial','id_filial','int4');
		$this->setParametro('valor','valor','numeric');
		$this->setParametro('id_gestion_periodo','id_gestion_periodo','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarDatoValor(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='scger.ft_dato_valor_ime';
		$this->transaccion='SCGER_VALOR_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_dato_valor','id_dato_valor','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>
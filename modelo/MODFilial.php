<?php
/**
*@package pXP
*@file gen-MODFilial.php
*@author  (admin)
*@date 23-07-2014 16:09:32
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODFilial extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarFilial(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='scger.ft_filial_sel';
		$this->transaccion='SCGER_FILI_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_filial','int4');
		$this->captura('sigla','varchar');
		$this->captura('nombre','varchar');
		$this->captura('id_rubro','int4');
		$this->captura('nit','varchar');
		$this->captura('logo','varchar');
		$this->captura('estado_reg','varchar');
		$this->captura('id_usuario_reg','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('id_usuario_mod','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('nombre_rubro','varchar');
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarFilial(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='scger.ft_filial_ime';
		$this->transaccion='SCGER_FILI_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('sigla','sigla','varchar');
		$this->setParametro('nombre','nombre','varchar');
		$this->setParametro('id_rubro','id_rubro','int4');
		$this->setParametro('nit','nit','varchar');
		$this->setParametro('logo','logo','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarFilial(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='scger.ft_filial_ime';
		$this->transaccion='SCGER_FILI_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_filial','id_filial','int4');
		$this->setParametro('sigla','sigla','varchar');
		$this->setParametro('nombre','nombre','varchar');
		$this->setParametro('id_rubro','id_rubro','int4');
		$this->setParametro('nit','nit','varchar');
		$this->setParametro('logo','logo','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarFilial(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='scger.ft_filial_ime';
		$this->transaccion='SCGER_FILI_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_filial','id_filial','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>
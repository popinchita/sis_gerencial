<?php
/**
*@package pXP
*@file gen-MODGestionPeriodo.php
*@author  (admin)
*@date 24-07-2014 07:56:09
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODGestionPeriodo extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarGestionPeriodo(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='scger.ft_gestion_periodo_sel';
		$this->transaccion='SCGER_PERI_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion

		
		
		$this->setParametro('estado_reg','estado_reg','varchar');
		//Definicion de la lista del resultado del query
		$this->captura('id_gestion_periodo','int4');
		$this->captura('id_gestion','int4');
		$this->captura('periodo','int4');
		$this->captura('fecha_ini','date');
		$this->captura('fecha_fin','date');
		$this->captura('estado_reg','varchar');
		$this->captura('id_usuario_reg','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('id_usuario_mod','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('periodo_gestion','text');
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarGestionPeriodo(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='scger.ft_gestion_periodo_ime';
		$this->transaccion='SCGER_PERI_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_gestion','id_gestion','int4');
		$this->setParametro('periodo','periodo','int4');
		$this->setParametro('fecha_ini','fecha_ini','date');
		$this->setParametro('fecha_fin','fecha_fin','date');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarGestionPeriodo(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='scger.ft_gestion_periodo_ime';
		$this->transaccion='SCGER_PERI_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_gestion_periodo','id_gestion_periodo','int4');
		$this->setParametro('id_gestion','id_gestion','int4');
		$this->setParametro('periodo','periodo','int4');
		$this->setParametro('fecha_ini','fecha_ini','date');
		$this->setParametro('fecha_fin','fecha_fin','date');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarGestionPeriodo(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='scger.ft_gestion_periodo_ime';
		$this->transaccion='SCGER_PERI_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_gestion_periodo','id_gestion_periodo','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}

	
	function AperturarGestionPeriodo(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='scger.ft_gestion_periodo_ime';
		$this->transaccion='SCGER_PERI_APE';
		$this->tipo_procedimiento='IME';
	
		//Define los parametros para la funcion
		$this->setParametro('id_gestion_periodo','id_gestion_periodo','int4');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
	
		//Devuelve la respuesta
		return $this->respuesta;
	}
	
}
?>
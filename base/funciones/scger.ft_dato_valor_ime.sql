CREATE OR REPLACE FUNCTION scger.ft_dato_valor_ime (
  p_administrador integer,
  p_id_usuario integer,
  p_tabla varchar,
  p_transaccion varchar
)
RETURNS varchar AS
$body$
/**************************************************************************
 SISTEMA:		Sistema de Control Gerencial
 FUNCION: 		scger.ft_dato_valor_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'scger.tdato_valor'
 AUTOR: 		 (admin)
 FECHA:	        24-07-2014 07:59:41
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:

 DESCRIPCION:	
 AUTOR:			
 FECHA:		
***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_dato_valor	integer;
			    
BEGIN

    v_nombre_funcion = 'scger.ft_dato_valor_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SCGER_VALOR_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		24-07-2014 07:59:41
	***********************************/

	if(p_transaccion='SCGER_VALOR_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into scger.tdato_valor(
			id_tipo_dato,
			id_filial,
			valor,
			id_gestion_periodo,
			estado_reg,
			id_usuario_reg,
			fecha_reg,
			id_usuario_ai,
			usuario_ai,
			id_usuario_mod,
			fecha_mod
          	) values(
			v_parametros.id_tipo_dato,
			v_parametros.id_filial,
			v_parametros.valor,
			v_parametros.id_gestion_periodo,
			'activo',
			p_id_usuario,
			now(),
			v_parametros._id_usuario_ai,
			v_parametros._nombre_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_dato_valor into v_id_dato_valor;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Valor almacenado(a) con exito (id_dato_valor'||v_id_dato_valor||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_dato_valor',v_id_dato_valor::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SCGER_VALOR_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		24-07-2014 07:59:41
	***********************************/

	elsif(p_transaccion='SCGER_VALOR_MOD')then

		begin
			--Sentencia de la modificacion
			update scger.tdato_valor set
			--id_tipo_dato = v_parametros.id_tipo_dato,
			id_filial = v_parametros.id_filial,
			valor = v_parametros.valor,
			id_gestion_periodo = v_parametros.id_gestion_periodo,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_dato_valor=v_parametros.id_dato_valor;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Valor modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_dato_valor',v_parametros.id_dato_valor::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SCGER_VALOR_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		24-07-2014 07:59:41
	***********************************/

	elsif(p_transaccion='SCGER_VALOR_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from scger.tdato_valor
            where id_dato_valor=v_parametros.id_dato_valor;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Valor eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_dato_valor',v_parametros.id_dato_valor::varchar);
              
            --Devuelve la respuesta
            return v_resp;

		end;
         
	else
     
    	raise exception 'Transaccion inexistente: %',p_transaccion;

	end if;

EXCEPTION
				
	WHEN OTHERS THEN
		v_resp='';
		v_resp = pxp.f_agrega_clave(v_resp,'mensaje',SQLERRM);
		v_resp = pxp.f_agrega_clave(v_resp,'codigo_error',SQLSTATE);
		v_resp = pxp.f_agrega_clave(v_resp,'procedimientos',v_nombre_funcion);
		raise exception '%',v_resp;
				        
END;
$body$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;
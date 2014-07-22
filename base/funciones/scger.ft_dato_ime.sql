CREATE OR REPLACE FUNCTION "scger"."ft_dato_ime" (	
				p_administrador integer, p_id_usuario integer, p_tabla character varying, p_transaccion character varying)
RETURNS character varying AS
$BODY$

/**************************************************************************
 SISTEMA:		Sistema de Control Gerencial
 FUNCION: 		scger.ft_dato_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'scger.tdato'
 AUTOR: 		 (admin)
 FECHA:	        22-07-2014 01:58:52
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
	v_id_dato	integer;
			    
BEGIN

    v_nombre_funcion = 'scger.ft_dato_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SCGER_DATO_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		22-07-2014 01:58:52
	***********************************/

	if(p_transaccion='SCGER_DATO_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into scger.tdato(
			id_tipo_dato,
			formula,
			estado_reg,
			fecha_reg,
			id_usuario_reg,
			fecha_mod,
			id_usuario_mod
          	) values(
			v_parametros.id_tipo_dato,
			v_parametros.formula,
			'activo',
			now(),
			p_id_usuario,
			null,
			null
							
			)RETURNING id_dato into v_id_dato;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Dato almacenado(a) con exito (id_dato'||v_id_dato||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_dato',v_id_dato::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SCGER_DATO_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		22-07-2014 01:58:52
	***********************************/

	elsif(p_transaccion='SCGER_DATO_MOD')then

		begin
			--Sentencia de la modificacion
			update scger.tdato set
			id_tipo_dato = v_parametros.id_tipo_dato,
			formula = v_parametros.formula,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario
			where id_dato=v_parametros.id_dato;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Dato modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_dato',v_parametros.id_dato::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SCGER_DATO_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		22-07-2014 01:58:52
	***********************************/

	elsif(p_transaccion='SCGER_DATO_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from scger.tdato
            where id_dato=v_parametros.id_dato;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Dato eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_dato',v_parametros.id_dato::varchar);
              
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
$BODY$
LANGUAGE 'plpgsql' VOLATILE
COST 100;
ALTER FUNCTION "scger"."ft_dato_ime"(integer, integer, character varying, character varying) OWNER TO postgres;

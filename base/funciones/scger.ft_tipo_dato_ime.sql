CREATE OR REPLACE FUNCTION "scger"."ft_tipo_dato_ime" (	
				p_administrador integer, p_id_usuario integer, p_tabla character varying, p_transaccion character varying)
RETURNS character varying AS
$BODY$

/**************************************************************************
 SISTEMA:		Sistema de Control Gerencial
 FUNCION: 		scger.ft_tipo_dato_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'scger.ttipo_dato'
 AUTOR: 		 (admin)
 FECHA:	        22-07-2014 01:34:27
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
	v_id_tipo_dato	integer;
			    
BEGIN

    v_nombre_funcion = 'scger.ft_tipo_dato_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SCGER_TIPDAT_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		22-07-2014 01:34:27
	***********************************/

	if(p_transaccion='SCGER_TIPDAT_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into scger.ttipo_dato(
			codigo,
			nombre,
			estado_reg,
			id_usuario_reg,
			fecha_reg,
			id_usuario_mod,
			fecha_mod
          	) values(
			v_parametros.codigo,
			v_parametros.nombre,
			'activo',
			p_id_usuario,
			now(),
			null,
			null
							
			)RETURNING id_tipo_dato into v_id_tipo_dato;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Tipo Dato almacenado(a) con exito (id_tipo_dato'||v_id_tipo_dato||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_tipo_dato',v_id_tipo_dato::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SCGER_TIPDAT_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		22-07-2014 01:34:27
	***********************************/

	elsif(p_transaccion='SCGER_TIPDAT_MOD')then

		begin
			--Sentencia de la modificacion
			update scger.ttipo_dato set
			codigo = v_parametros.codigo,
			nombre = v_parametros.nombre,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now()
			where id_tipo_dato=v_parametros.id_tipo_dato;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Tipo Dato modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_tipo_dato',v_parametros.id_tipo_dato::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SCGER_TIPDAT_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		22-07-2014 01:34:27
	***********************************/

	elsif(p_transaccion='SCGER_TIPDAT_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from scger.ttipo_dato
            where id_tipo_dato=v_parametros.id_tipo_dato;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Tipo Dato eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_tipo_dato',v_parametros.id_tipo_dato::varchar);
              
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
ALTER FUNCTION "scger"."ft_tipo_dato_ime"(integer, integer, character varying, character varying) OWNER TO postgres;

CREATE OR REPLACE FUNCTION "scger"."ft_rubro_ime" (	
				p_administrador integer, p_id_usuario integer, p_tabla character varying, p_transaccion character varying)
RETURNS character varying AS
$BODY$

/**************************************************************************
 SISTEMA:		Sistema de Control Gerencial
 FUNCION: 		scger.ft_rubro_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'scger.trubro'
 AUTOR: 		 (admin)
 FECHA:	        21-07-2014 22:05:01
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
	v_id_rubro	integer;
			    
BEGIN

    v_nombre_funcion = 'scger.ft_rubro_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SCGER_RUB_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		21-07-2014 22:05:01
	***********************************/

	if(p_transaccion='SCGER_RUB_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into scger.trubro(
			nombre_rubro,
			descripcion_rubro,
			codigo_rubro,
			estado_reg,
			id_usuario_reg,
			fecha_reg,
			fecha_mod,
			id_usuario_mod
          	) values(
			v_parametros.nombre_rubro,
			v_parametros.descripcion_rubro,
			v_parametros.codigo_rubro,
			'activo',
			p_id_usuario,
			now(),
			null,
			null
							
			)RETURNING id_rubro into v_id_rubro;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Rubro almacenado(a) con exito (id_rubro'||v_id_rubro||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_rubro',v_id_rubro::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SCGER_RUB_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		21-07-2014 22:05:01
	***********************************/

	elsif(p_transaccion='SCGER_RUB_MOD')then

		begin
			--Sentencia de la modificacion
			update scger.trubro set
			nombre_rubro = v_parametros.nombre_rubro,
			descripcion_rubro = v_parametros.descripcion_rubro,
			codigo_rubro = v_parametros.codigo_rubro,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario
			where id_rubro=v_parametros.id_rubro;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Rubro modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_rubro',v_parametros.id_rubro::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SCGER_RUB_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		21-07-2014 22:05:01
	***********************************/

	elsif(p_transaccion='SCGER_RUB_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from scger.trubro
            where id_rubro=v_parametros.id_rubro;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Rubro eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_rubro',v_parametros.id_rubro::varchar);
              
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
ALTER FUNCTION "scger"."ft_rubro_ime"(integer, integer, character varying, character varying) OWNER TO postgres;

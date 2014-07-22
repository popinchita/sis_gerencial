CREATE OR REPLACE FUNCTION "scger"."ft_gestion_ime" (	
				p_administrador integer, p_id_usuario integer, p_tabla character varying, p_transaccion character varying)
RETURNS character varying AS
$BODY$

/**************************************************************************
 SISTEMA:		Sistema de Control Gerencial
 FUNCION: 		scger.ft_gestion_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'scger.tgestion'
 AUTOR: 		 (admin)
 FECHA:	        21-07-2014 23:26:54
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
	v_id_gestion	integer;
			    
BEGIN

    v_nombre_funcion = 'scger.ft_gestion_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SCGER_GES_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		21-07-2014 23:26:54
	***********************************/

	if(p_transaccion='SCGER_GES_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into scger.tgestion(
			estado_reg,
			gestion,
			estado,
			id_usuario_reg,
			fecha_reg,
			id_usuario_mod,
			fecha_mod
          	) values(
			'activo',
			v_parametros.gestion,
			v_parametros.estado,
			p_id_usuario,
			now(),
			null,
			null
							
			)RETURNING id_gestion into v_id_gestion;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Gestion almacenado(a) con exito (id_gestion'||v_id_gestion||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_gestion',v_id_gestion::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SCGER_GES_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		21-07-2014 23:26:54
	***********************************/

	elsif(p_transaccion='SCGER_GES_MOD')then

		begin
			--Sentencia de la modificacion
			update scger.tgestion set
			gestion = v_parametros.gestion,
			estado = v_parametros.estado,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now()
			where id_gestion=v_parametros.id_gestion;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Gestion modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_gestion',v_parametros.id_gestion::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SCGER_GES_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		21-07-2014 23:26:54
	***********************************/

	elsif(p_transaccion='SCGER_GES_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from scger.tgestion
            where id_gestion=v_parametros.id_gestion;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Gestion eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_gestion',v_parametros.id_gestion::varchar);
              
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
ALTER FUNCTION "scger"."ft_gestion_ime"(integer, integer, character varying, character varying) OWNER TO postgres;

CREATE OR REPLACE FUNCTION "scger"."ft_gestion_periodo_ime" (	
				p_administrador integer, p_id_usuario integer, p_tabla character varying, p_transaccion character varying)
RETURNS character varying AS
$BODY$

/**************************************************************************
 SISTEMA:		Sistema de Control Gerencial
 FUNCION: 		scger.ft_gestion_periodo_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'scger.tgestion_periodo'
 AUTOR: 		 (admin)
 FECHA:	        24-07-2014 07:56:09
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
	v_id_gestion_periodo	integer;
			    
BEGIN

    v_nombre_funcion = 'scger.ft_gestion_periodo_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SCGER_PERI_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		24-07-2014 07:56:09
	***********************************/

	if(p_transaccion='SCGER_PERI_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into scger.tgestion_periodo(
			id_gestion,
			periodo,
			fecha_ini,
			fecha_fin,
			estado_reg,
			id_usuario_reg,
			fecha_reg,
			usuario_ai,
			id_usuario_ai,
			id_usuario_mod,
			fecha_mod
          	) values(
			v_parametros.id_gestion,
			v_parametros.periodo,
			v_parametros.fecha_ini,
			v_parametros.fecha_fin,
			'activo',
			p_id_usuario,
			now(),
			v_parametros._nombre_usuario_ai,
			v_parametros._id_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_gestion_periodo into v_id_gestion_periodo;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Periodo almacenado(a) con exito (id_gestion_periodo'||v_id_gestion_periodo||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_gestion_periodo',v_id_gestion_periodo::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SCGER_PERI_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		24-07-2014 07:56:09
	***********************************/

	elsif(p_transaccion='SCGER_PERI_MOD')then

		begin
			--Sentencia de la modificacion
			update scger.tgestion_periodo set
			id_gestion = v_parametros.id_gestion,
			periodo = v_parametros.periodo,
			fecha_ini = v_parametros.fecha_ini,
			fecha_fin = v_parametros.fecha_fin,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_gestion_periodo=v_parametros.id_gestion_periodo;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Periodo modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_gestion_periodo',v_parametros.id_gestion_periodo::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SCGER_PERI_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		24-07-2014 07:56:09
	***********************************/

	elsif(p_transaccion='SCGER_PERI_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from scger.tgestion_periodo
            where id_gestion_periodo=v_parametros.id_gestion_periodo;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Periodo eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_gestion_periodo',v_parametros.id_gestion_periodo::varchar);
              
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
ALTER FUNCTION "scger"."ft_gestion_periodo_ime"(integer, integer, character varying, character varying) OWNER TO postgres;

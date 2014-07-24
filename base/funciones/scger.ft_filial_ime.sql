CREATE OR REPLACE FUNCTION "scger"."ft_filial_ime" (	
				p_administrador integer, p_id_usuario integer, p_tabla character varying, p_transaccion character varying)
RETURNS character varying AS
$BODY$

/**************************************************************************
 SISTEMA:		Sistema de Control Gerencial
 FUNCION: 		scger.ft_filial_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'scger.tfilial'
 AUTOR: 		 (admin)
 FECHA:	        23-07-2014 16:09:32
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
	v_id_filial	integer;
			    
BEGIN

    v_nombre_funcion = 'scger.ft_filial_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SCGER_FILI_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		23-07-2014 16:09:32
	***********************************/

	if(p_transaccion='SCGER_FILI_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into scger.tfilial(
			sigla,
			nombre,
			id_rubro,
			nit,
			logo,
			estado_reg,
			id_usuario_reg,
			fecha_reg,
			usuario_ai,
			id_usuario_ai,
			id_usuario_mod,
			fecha_mod
          	) values(
			v_parametros.sigla,
			v_parametros.nombre,
			v_parametros.id_rubro,
			v_parametros.nit,
			v_parametros.logo,
			'activo',
			p_id_usuario,
			now(),
			v_parametros._nombre_usuario_ai,
			v_parametros._id_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_filial into v_id_filial;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Filial almacenado(a) con exito (id_filial'||v_id_filial||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_filial',v_id_filial::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SCGER_FILI_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		23-07-2014 16:09:32
	***********************************/

	elsif(p_transaccion='SCGER_FILI_MOD')then

		begin
			--Sentencia de la modificacion
			update scger.tfilial set
			sigla = v_parametros.sigla,
			nombre = v_parametros.nombre,
			id_rubro = v_parametros.id_rubro,
			nit = v_parametros.nit,
			logo = v_parametros.logo,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_filial=v_parametros.id_filial;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Filial modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_filial',v_parametros.id_filial::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SCGER_FILI_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		23-07-2014 16:09:32
	***********************************/

	elsif(p_transaccion='SCGER_FILI_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from scger.tfilial
            where id_filial=v_parametros.id_filial;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Filial eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_filial',v_parametros.id_filial::varchar);
              
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
ALTER FUNCTION "scger"."ft_filial_ime"(integer, integer, character varying, character varying) OWNER TO postgres;

CREATE OR REPLACE FUNCTION scger.ft_usuario_filial_ime (
  p_administrador integer,
  p_id_usuario integer,
  p_tabla varchar,
  p_transaccion varchar
)
RETURNS varchar AS
$body$
/**************************************************************************
 SISTEMA:		Sistema de Control Gerencial
 FUNCION: 		scger.ft_usuario_filial_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'scger.tusuario_filial'
 AUTOR: 		 (admin)
 FECHA:	        24-07-2014 23:54:44
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
	v_id_usuario_filial	integer;
			    
BEGIN

    v_nombre_funcion = 'scger.ft_usuario_filial_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SCGER_USUFIL_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		24-07-2014 23:54:44
	***********************************/

	if(p_transaccion='SCGER_USUFIL_INS')then
					
        begin
        
           --solo permitir registrar a un usuario con una filial
           if exists (select 1 from scger.tusuario_filial where id_usuario=v_parametros.id_usuario and estado_reg='activo') then
              raise exception 'Insercion no realizada. El usuario ya fue asignado a una Filial';
           end if;
        
        
        	--Sentencia de la insercion
        	insert into scger.tusuario_filial(
			id_usuario,
			id_filial,
			estado_reg,
			fecha_reg,
			usuario_ai,
			id_usuario_reg,
			id_usuario_ai,
			id_usuario_mod,
			fecha_mod
          	) values(
			v_parametros.id_usuario,
			v_parametros.id_filial,
			'activo',
			now(),
			v_parametros._nombre_usuario_ai,
			p_id_usuario,
			v_parametros._id_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_usuario_filial into v_id_usuario_filial;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Usuario Filial almacenado(a) con exito (id_usuario_filial'||v_id_usuario_filial||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_usuario_filial',v_id_usuario_filial::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SCGER_USUFIL_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		24-07-2014 23:54:44
	***********************************/

	elsif(p_transaccion='SCGER_USUFIL_MOD')then

		begin
        
           --solo permitir registrar a un usuario con una filial
           if exists (select 1 from scger.tusuario_filial where id_usuario=v_parametros.id_usuario and id_filial!=v_parametros.id_filial and estado_reg='activo') then
              raise exception 'Insercion no realizada. El usuario ya fue asignado a una Filial diferente';
           end if;
        
        
			--Sentencia de la modificacion
			update scger.tusuario_filial set
			id_usuario = v_parametros.id_usuario,
			id_filial = v_parametros.id_filial,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_usuario_filial=v_parametros.id_usuario_filial;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Usuario Filial modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_usuario_filial',v_parametros.id_usuario_filial::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SCGER_USUFIL_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		24-07-2014 23:54:44
	***********************************/

	elsif(p_transaccion='SCGER_USUFIL_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from scger.tusuario_filial
            where id_usuario_filial=v_parametros.id_usuario_filial;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Usuario Filial eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_usuario_filial',v_parametros.id_usuario_filial::varchar);
              
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
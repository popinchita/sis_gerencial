CREATE OR REPLACE FUNCTION "scger"."ft_gestion_sel"(	
				p_administrador integer, p_id_usuario integer, p_tabla character varying, p_transaccion character varying)
RETURNS character varying AS
$BODY$
/**************************************************************************
 SISTEMA:		Sistema de Control Gerencial
 FUNCION: 		scger.ft_gestion_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'scger.tgestion'
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

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'scger.ft_gestion_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SCGER_GES_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		21-07-2014 23:26:54
	***********************************/

	if(p_transaccion='SCGER_GES_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						ges.id_gestion,
						ges.estado_reg,
						ges.gestion,
						ges.estado,
						ges.id_usuario_reg,
						ges.fecha_reg,
						ges.id_usuario_mod,
						ges.fecha_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod	
						from scger.tgestion ges
						inner join segu.tusuario usu1 on usu1.id_usuario = ges.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = ges.id_usuario_mod
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SCGER_GES_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		21-07-2014 23:26:54
	***********************************/

	elsif(p_transaccion='SCGER_GES_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_gestion)
					    from scger.tgestion ges
					    inner join segu.tusuario usu1 on usu1.id_usuario = ges.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = ges.id_usuario_mod
					    where ';
			
			--Definicion de la respuesta		    
			v_consulta:=v_consulta||v_parametros.filtro;

			--Devuelve la respuesta
			return v_consulta;

		end;
					
	else
					     
		raise exception 'Transaccion inexistente';
					         
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
ALTER FUNCTION "scger"."ft_gestion_sel"(integer, integer, character varying, character varying) OWNER TO postgres;

CREATE OR REPLACE FUNCTION scger.ft_dato_sel (
  p_administrador integer,
  p_id_usuario integer,
  p_tabla varchar,
  p_transaccion varchar
)
RETURNS varchar AS
$body$
/**************************************************************************
 SISTEMA:		Sistema de Control Gerencial
 FUNCION: 		scger.ft_dato_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'scger.tdato'
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

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'scger.ft_dato_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SCGER_DATO_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		22-07-2014 01:58:52
	***********************************/

	if(p_transaccion='SCGER_DATO_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						dato.id_dato,
						dato.id_tipo_dato,
						dato.formula,
						dato.estado_reg,
						dato.fecha_reg,
						dato.id_usuario_reg,
						dato.fecha_mod,
						dato.id_usuario_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,
                        tipdat.nombre,
                        dato.orden_ejecucion	
						from scger.tdato dato
                        inner join scger.ttipo_dato tipdat on tipdat.id_tipo_dato=dato.id_tipo_dato
						inner join segu.tusuario usu1 on usu1.id_usuario = dato.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = dato.id_usuario_mod
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SCGER_DATO_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		22-07-2014 01:58:52
	***********************************/

	elsif(p_transaccion='SCGER_DATO_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_dato)
					    from scger.tdato dato
                        inner join scger.ttipo_dato tipdat on tipdat.id_tipo_dato=dato.id_tipo_dato
					    inner join segu.tusuario usu1 on usu1.id_usuario = dato.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = dato.id_usuario_mod
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
$body$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;
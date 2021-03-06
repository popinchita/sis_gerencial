CREATE OR REPLACE FUNCTION scger.ft_usuario_filial_sel (
  p_administrador integer,
  p_id_usuario integer,
  p_tabla varchar,
  p_transaccion varchar
)
RETURNS varchar AS
$body$
/**************************************************************************
 SISTEMA:		Sistema de Control Gerencial
 FUNCION: 		scger.ft_usuario_filial_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'scger.tusuario_filial'
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

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'scger.ft_usuario_filial_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SCGER_USUFIL_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		24-07-2014 23:54:44
	***********************************/

	if(p_transaccion='SCGER_USUFIL_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						usufil.id_usuario_filial,
						usufil.id_usuario,
						usufil.id_filial,
						usufil.estado_reg,
						usufil.fecha_reg,
						usufil.usuario_ai,
						usufil.id_usuario_reg,
						usufil.id_usuario_ai,
						usufil.id_usuario_mod,
						usufil.fecha_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,
                        fili.nombre	
						from scger.tusuario_filial usufil
                        inner join scger.tfilial fili on fili.id_filial=usufil.id_filial
						inner join segu.tusuario usu1 on usu1.id_usuario = usufil.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = usufil.id_usuario_mod
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SCGER_USUFIL_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		24-07-2014 23:54:44
	***********************************/

	elsif(p_transaccion='SCGER_USUFIL_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_usuario_filial)
					    from scger.tusuario_filial usufil
                        inner join scger.tfilial fili on fili.id_filial=usufil.id_filial
					    inner join segu.tusuario usu1 on usu1.id_usuario = usufil.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = usufil.id_usuario_mod
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
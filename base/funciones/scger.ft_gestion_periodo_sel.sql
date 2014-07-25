CREATE OR REPLACE FUNCTION scger.ft_gestion_periodo_sel (
  p_administrador integer,
  p_id_usuario integer,
  p_tabla varchar,
  p_transaccion varchar
)
RETURNS varchar AS
$body$
/**************************************************************************
 SISTEMA:		Sistema de Control Gerencial
 FUNCION: 		scger.ft_gestion_periodo_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'scger.tgestion_periodo'
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

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'scger.ft_gestion_periodo_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SCGER_PERI_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		24-07-2014 07:56:09
	***********************************/

	if(p_transaccion='SCGER_PERI_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						peri.id_gestion_periodo,
						peri.id_gestion,
						peri.periodo,
						peri.fecha_ini,
						peri.fecha_fin,
						peri.estado_reg,
						peri.id_usuario_reg,
						peri.fecha_reg,
						peri.usuario_ai,
						peri.id_usuario_ai,
						peri.id_usuario_mod,
						peri.fecha_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,
                        peri.periodo||''/''||ges.gestion as periodo_gestion	
						from scger.tgestion_periodo peri
                        inner join scger.tgestion ges on ges.id_Gestion=peri.id_gestion
						inner join segu.tusuario usu1 on usu1.id_usuario = peri.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = peri.id_usuario_mod
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SCGER_PERI_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		24-07-2014 07:56:09
	***********************************/

	elsif(p_transaccion='SCGER_PERI_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_gestion_periodo)
					    from scger.tgestion_periodo peri
                        inner join scger.tgestion ges on ges.id_Gestion=peri.id_gestion
					    inner join segu.tusuario usu1 on usu1.id_usuario = peri.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = peri.id_usuario_mod
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
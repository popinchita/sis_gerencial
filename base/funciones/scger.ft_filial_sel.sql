CREATE OR REPLACE FUNCTION scger.ft_filial_sel (
  p_administrador integer,
  p_id_usuario integer,
  p_tabla varchar,
  p_transaccion varchar
)
RETURNS varchar AS
$body$
/**************************************************************************
 SISTEMA:		Sistema de Control Gerencial
 FUNCION: 		scger.ft_filial_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'scger.tfilial'
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

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
	v_filadd	varchar;		    
BEGIN

	v_nombre_funcion = 'scger.ft_filial_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SCGER_FILI_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		23-07-2014 16:09:32
	***********************************/

	if(p_transaccion='SCGER_FILI_SEL')then
     				
    	begin
    		--Sentencia de la consulta
            
             v_filadd = ' 0=0 ';
            IF (pxp.f_existe_parametro(p_tabla,'id_filial')) THEN
               v_filadd = ' fili.id_filial = '''||v_parametros.id_filial||''' ';
            END IF;
            
            
			v_consulta:='select
						fili.id_filial,
						fili.sigla,
						fili.nombre,
						fili.id_rubro,
						fili.nit,
						fili.logo,
						fili.estado_reg,
						fili.id_usuario_reg,
						fili.fecha_reg,
						fili.usuario_ai,
						fili.id_usuario_ai,
						fili.id_usuario_mod,
						fili.fecha_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,	
						rub.nombre_rubro	
						from scger.tfilial fili
                        inner join scger.trubro rub on rub.id_rubro=fili.id_rubro
						inner join segu.tusuario usu1 on usu1.id_usuario = fili.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = fili.id_usuario_mod
				        where '||v_filadd||' and ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SCGER_FILI_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		23-07-2014 16:09:32
	***********************************/

	elsif(p_transaccion='SCGER_FILI_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_filial)
					    from scger.tfilial fili
                        inner join scger.trubro rub on rub.id_rubro=fili.id_rubro
					    inner join segu.tusuario usu1 on usu1.id_usuario = fili.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = fili.id_usuario_mod
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
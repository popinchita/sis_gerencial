CREATE OR REPLACE FUNCTION scger.ft_dato_valor_sel (
  p_administrador integer,
  p_id_usuario integer,
  p_tabla varchar,
  p_transaccion varchar
)
RETURNS varchar AS
$body$
/**************************************************************************
 SISTEMA:		Sistema de Control Gerencial
 FUNCION: 		scger.ft_dato_valor_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'scger.tdato_valor'
 AUTOR: 		 (admin)
 FECHA:	        24-07-2014 07:59:41
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

	v_nombre_funcion = 'scger.ft_dato_valor_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SCGER_VALOR_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		24-07-2014 07:59:41
	***********************************/

	if(p_transaccion='SCGER_VALOR_SEL')then
     				
    	begin
    		--Sentencia de la consulta
            
             v_filadd = ' 0=0 ';
            
             IF (pxp.f_existe_parametro(p_tabla,'id_filial')) THEN
                 v_filadd = ' valor.id_filial = '||v_parametros.id_filial||' ';
                 IF (pxp.f_existe_parametro(p_tabla,'id_gestion_periodo')) THEN
                     v_filadd = v_filadd || ' and valor.id_gestion_periodo = '||v_parametros.id_gestion_periodo||' ';
             	  end if;
             else
             
                IF (pxp.f_existe_parametro(p_tabla,'id_gestion_periodo')) THEN
                  v_filadd = ' valor.id_gestion_periodo = '||v_parametros.id_gestion_periodo||' ';
             	end if;
             end if;
             
            
               
           
            
           
            
            
			v_consulta:='select
						valor.id_dato_valor,
						valor.id_tipo_dato,
						valor.id_filial,
						valor.valor,
						valor.id_gestion_periodo,
						valor.estado_reg,
						valor.id_usuario_reg,
						valor.fecha_reg,
						valor.id_usuario_ai,
						valor.usuario_ai,
						valor.id_usuario_mod,
						valor.fecha_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod	,
                        tipdat.codigo as codigo_tipdat,
                        tipdat.nombre as nombre_tipdat
                        
						from scger.tdato_valor valor
                        inner join scger.ttipo_dato tipdat on tipdat.id_tipo_dato=valor.id_tipo_dato
						inner join segu.tusuario usu1 on usu1.id_usuario = valor.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = valor.id_usuario_mod
				         where '||v_filadd||' and ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SCGER_VALOR_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		24-07-2014 07:59:41
	***********************************/

	elsif(p_transaccion='SCGER_VALOR_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_dato_valor)
					    from scger.tdato_valor valor
                        inner join scger.ttipo_dato tipdat on tipdat.id_tipo_dato=valor.id_tipo_dato
					    inner join segu.tusuario usu1 on usu1.id_usuario = valor.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = valor.id_usuario_mod
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
/********************************************I-DAT-MZM-SCGER-0-21/07/2014********************************************/
/*
*	Author: MZM
*	Date: 21/07/2013
*	Description: Build the menu definition and the composition
*/


/*

Para  definir la la metadata, menus, roles, etc

1) sincronize ls funciones y procedimientos del sistema
2)  verifique que la primera linea de los datos sea la insercion del sistema correspondiente
3)  exporte los datos a archivo SQL (desde la interface de sistema en sis_seguridad), 
    verifique que la codificacion  se mantenga en UTF8 para no distorcionar los caracteres especiales
4)  remplaze los sectores correspondientes en este archivo en su totalidad:  (el orden es importante)  
                             menu, 
                             funciones, 
                             procedimietnos

*/

INSERT INTO segu.tsubsistema ( codigo, nombre, fecha_reg, prefijo, estado_reg, nombre_carpeta, id_subsis_orig)
VALUES ('SCGER', 'Sistema de Control Gerencial', '2014-07-21', 'SCGER', 'activo', 'gerencial', NULL);

/********************************************F-DAT-MZM-SCGER-0-21/07/2014********************************************/


/********************************************I-DAT-MZM-SCGER-1-21/07/2014********************************************/

select pxp.f_insert_tgui ('SISTEMA DE CONTROL GERENCIAL', 'SCG', 'SCGER', 'si', 5, '', 1, '', 'NODO RAIZ', 'SCGER');
select pxp.f_insert_tgui ('Rubro', 'Rubro', 'RUB', 'si', 1, 'sis_gerencial/vista/rubro/Rubro.php', 2, '', 'Rubro', 'SCGER');
select pxp.f_insert_tgui ('Gestion', 'Gestion', 'GES', 'si', 2, 'sis_gerencial/vista/gestion/Gestion.php', 2, '', 'Gestion', 'SCGER');
select pxp.f_insert_tfuncion ('scger.ft_rubro_ime', 'Funcion para tabla     ', 'SCGER');
select pxp.f_insert_tfuncion ('scger.ft_rubro_sel', 'Funcion para tabla     ', 'SCGER');
select pxp.f_insert_tfuncion ('scger.ft_gestion_ime', 'Funcion para tabla     ', 'SCGER');
select pxp.f_insert_tfuncion ('scger.ft_gestion_sel', 'Funcion para tabla     ', 'SCGER');
select pxp.f_insert_tprocedimiento ('SCGER_RUB_INS', 'Insercion de registros', 'si', '', '', 'scger.ft_rubro_ime');
select pxp.f_insert_tprocedimiento ('SCGER_RUB_MOD', 'Modificacion de registros', 'si', '', '', 'scger.ft_rubro_ime');
select pxp.f_insert_tprocedimiento ('SCGER_RUB_ELI', 'Eliminacion de registros', 'si', '', '', 'scger.ft_rubro_ime');
select pxp.f_insert_tprocedimiento ('SCGER_RUB_SEL', 'Consulta de datos', 'si', '', '', 'scger.ft_rubro_sel');
select pxp.f_insert_tprocedimiento ('SCGER_RUB_CONT', 'Conteo de registros', 'si', '', '', 'scger.ft_rubro_sel');
select pxp.f_insert_tprocedimiento ('SCGER_GES_INS', 'Insercion de registros', 'si', '', '', 'scger.ft_gestion_ime');
select pxp.f_insert_tprocedimiento ('SCGER_GES_MOD', 'Modificacion de registros', 'si', '', '', 'scger.ft_gestion_ime');
select pxp.f_insert_tprocedimiento ('SCGER_GES_ELI', 'Eliminacion de registros', 'si', '', '', 'scger.ft_gestion_ime');
select pxp.f_insert_tprocedimiento ('SCGER_GES_SEL', 'Consulta de datos', 'si', '', '', 'scger.ft_gestion_sel');
select pxp.f_insert_tprocedimiento ('SCGER_GES_CONT', 'Conteo de registros', 'si', '', '', 'scger.ft_gestion_sel');





select pxp.f_insert_tgui ('SISTEMA DE CONTROL GERENCIAL', 'SCG', 'SCGER', 'si', 5, '', 1, '', 'NODO RAIZ', 'SCGER');
select pxp.f_insert_tgui ('Rubro', 'Rubro', 'RUB', 'si', 1, 'sis_gerencial/vista/rubro/Rubro.php', 2, '', 'Rubro', 'SCGER');
select pxp.f_insert_tgui ('Gestion', 'Gestion', 'GES', 'si', 2, 'sis_gerencial/vista/gestion/Gestion.php', 2, '', 'Gestion', 'SCGER');
select pxp.f_insert_tgui ('Tipo Dato', 'Tipo Dato', 'TIPDAT', 'si', 3, 'sis_gerencial/vista/tipo_dato/TipoDato.php', 2, '', 'TipoDato', 'SCGER');
select pxp.f_insert_tfuncion ('scger.ft_rubro_ime', 'Funcion para tabla     ', 'SCGER');
select pxp.f_insert_tfuncion ('scger.ft_rubro_sel', 'Funcion para tabla     ', 'SCGER');
select pxp.f_insert_tfuncion ('scger.ft_gestion_ime', 'Funcion para tabla     ', 'SCGER');
select pxp.f_insert_tfuncion ('scger.ft_gestion_sel', 'Funcion para tabla     ', 'SCGER');
select pxp.f_insert_tfuncion ('scger.ft_tipo_dato_ime', 'Funcion para tabla     ', 'SCGER');
select pxp.f_insert_tfuncion ('scger.ft_tipo_dato_sel', 'Funcion para tabla     ', 'SCGER');
select pxp.f_insert_tprocedimiento ('SCGER_RUB_INS', 'Insercion de registros', 'si', '', '', 'scger.ft_rubro_ime');
select pxp.f_insert_tprocedimiento ('SCGER_RUB_MOD', 'Modificacion de registros', 'si', '', '', 'scger.ft_rubro_ime');
select pxp.f_insert_tprocedimiento ('SCGER_RUB_ELI', 'Eliminacion de registros', 'si', '', '', 'scger.ft_rubro_ime');
select pxp.f_insert_tprocedimiento ('SCGER_RUB_SEL', 'Consulta de datos', 'si', '', '', 'scger.ft_rubro_sel');
select pxp.f_insert_tprocedimiento ('SCGER_RUB_CONT', 'Conteo de registros', 'si', '', '', 'scger.ft_rubro_sel');
select pxp.f_insert_tprocedimiento ('SCGER_GES_INS', 'Insercion de registros', 'si', '', '', 'scger.ft_gestion_ime');
select pxp.f_insert_tprocedimiento ('SCGER_GES_MOD', 'Modificacion de registros', 'si', '', '', 'scger.ft_gestion_ime');
select pxp.f_insert_tprocedimiento ('SCGER_GES_ELI', 'Eliminacion de registros', 'si', '', '', 'scger.ft_gestion_ime');
select pxp.f_insert_tprocedimiento ('SCGER_GES_SEL', 'Consulta de datos', 'si', '', '', 'scger.ft_gestion_sel');
select pxp.f_insert_tprocedimiento ('SCGER_GES_CONT', 'Conteo de registros', 'si', '', '', 'scger.ft_gestion_sel');
select pxp.f_insert_tprocedimiento ('SCGER_TIPDAT_INS', 'Insercion de registros', 'si', '', '', 'scger.ft_tipo_dato_ime');
select pxp.f_insert_tprocedimiento ('SCGER_TIPDAT_MOD', 'Modificacion de registros', 'si', '', '', 'scger.ft_tipo_dato_ime');
select pxp.f_insert_tprocedimiento ('SCGER_TIPDAT_ELI', 'Eliminacion de registros', 'si', '', '', 'scger.ft_tipo_dato_ime');
select pxp.f_insert_tprocedimiento ('SCGER_TIPDAT_SEL', 'Consulta de datos', 'si', '', '', 'scger.ft_tipo_dato_sel');
select pxp.f_insert_tprocedimiento ('SCGER_TIPDAT_CONT', 'Conteo de registros', 'si', '', '', 'scger.ft_tipo_dato_sel');



/********************************************F-DAT-MZM-SCGER-1-21/07/2014********************************************/

/********************************************I-DAT-MZM-SCGER-1-22/07/2014********************************************/
select pxp.f_insert_tgui ('Dato', 'Dato', 'DATO', 'si', 4, 'sis_gerencial/vista/dato/Dato.php', 2, '', 'Dato', 'SCGER');
select pxp.f_insert_tfuncion ('scger.ft_dato_ime', 'Funcion para tabla     ', 'SCGER');
select pxp.f_insert_tfuncion ('scger.ft_dato_sel', 'Funcion para tabla     ', 'SCGER');
select pxp.f_insert_tprocedimiento ('SCGER_DATO_INS', 'Insercion de registros', 'si', '', '', 'scger.ft_dato_ime');
select pxp.f_insert_tprocedimiento ('SCGER_DATO_MOD', 'Modificacion de registros', 'si', '', '', 'scger.ft_dato_ime');
select pxp.f_insert_tprocedimiento ('SCGER_DATO_ELI', 'Eliminacion de registros', 'si', '', '', 'scger.ft_dato_ime');
select pxp.f_insert_tprocedimiento ('SCGER_DATO_SEL', 'Consulta de datos', 'si', '', '', 'scger.ft_dato_sel');
select pxp.f_insert_tprocedimiento ('SCGER_DATO_CONT', 'Conteo de registros', 'si', '', '', 'scger.ft_dato_sel');
/********************************************F-DAT-MZM-SCGER-1-22/07/2014********************************************/



  ----------------------------------
--COPY LINES TO data.sql FILE  
---------------------------------
/********************************************I-DAT-MZM-SCGER-1-23/07/2014********************************************/
select pxp.f_insert_tgui ('Filial', 'Filial', 'FILI', 'si', 5, 'sis_gerencial/vista/filial/Filial.php', 2, '', 'Filial', 'SCGER');
select pxp.f_insert_tfuncion ('scger.ft_filial_sel', 'Funcion para tabla     ', 'SCGER');
select pxp.f_insert_tfuncion ('scger.ft_filial_ime', 'Funcion para tabla     ', 'SCGER');
select pxp.f_insert_tprocedimiento ('SCGER_FILI_SEL', 'Consulta de datos', 'si', '', '', 'scger.ft_filial_sel');
select pxp.f_insert_tprocedimiento ('SCGER_FILI_CONT', 'Conteo de registros', 'si', '', '', 'scger.ft_filial_sel');
select pxp.f_insert_tprocedimiento ('SCGER_FILI_INS', 'Insercion de registros', 'si', '', '', 'scger.ft_filial_ime');
select pxp.f_insert_tprocedimiento ('SCGER_FILI_MOD', 'Modificacion de registros', 'si', '', '', 'scger.ft_filial_ime');
select pxp.f_insert_tprocedimiento ('SCGER_FILI_ELI', 'Eliminacion de registros', 'si', '', '', 'scger.ft_filial_ime');
/********************************************F-DAT-MZM-SCGER-1-23/07/2014********************************************/



    ----------------------------------
--COPY LINES TO data.sql FILE  
---------------------------------
/********************************************I-DAT-MZM-SCGER-1-25/07/2014********************************************/
select pxp.f_delete_tgui ('DATO');
select pxp.f_insert_tgui ('Valor', 'Valor', 'VALOR', 'si', 5, 'sis_gerencial/vista/dato_valor/DatoValor.php', 2, '', 'DatoValor', 'SCGER');
select pxp.f_insert_tgui ('Definicion de Datos', 'Definicion de Datos', 'TIPDAT.1', 'no', 0, 'sis_gerencial/vista/dato/Dato.php', 3, '', '50%', 'SCGER');
select pxp.f_insert_tfuncion ('scger.ft_dato_valor_ime', 'Funcion para tabla     ', 'SCGER');
select pxp.f_insert_tfuncion ('scger.ft_dato_valor_sel', 'Funcion para tabla     ', 'SCGER');
select pxp.f_insert_tfuncion ('scger.ft_gestion_periodo_ime', 'Funcion para tabla     ', 'SCGER');
select pxp.f_insert_tfuncion ('scger.ft_gestion_periodo_sel', 'Funcion para tabla     ', 'SCGER');
select pxp.f_insert_tprocedimiento ('SCGER_VALOR_INS', 'Insercion de registros', 'si', '', '', 'scger.ft_dato_valor_ime');
select pxp.f_insert_tprocedimiento ('SCGER_VALOR_MOD', 'Modificacion de registros', 'si', '', '', 'scger.ft_dato_valor_ime');
select pxp.f_insert_tprocedimiento ('SCGER_VALOR_ELI', 'Eliminacion de registros', 'si', '', '', 'scger.ft_dato_valor_ime');
select pxp.f_insert_tprocedimiento ('SCGER_VALOR_SEL', 'Consulta de datos', 'si', '', '', 'scger.ft_dato_valor_sel');
select pxp.f_insert_tprocedimiento ('SCGER_VALOR_CONT', 'Conteo de registros', 'si', '', '', 'scger.ft_dato_valor_sel');
select pxp.f_insert_tprocedimiento ('SCGER_PERI_INS', 'Insercion de registros', 'si', '', '', 'scger.ft_gestion_periodo_ime');
select pxp.f_insert_tprocedimiento ('SCGER_PERI_MOD', 'Modificacion de registros', 'si', '', '', 'scger.ft_gestion_periodo_ime');
select pxp.f_insert_tprocedimiento ('SCGER_PERI_ELI', 'Eliminacion de registros', 'si', '', '', 'scger.ft_gestion_periodo_ime');
select pxp.f_insert_tprocedimiento ('SCGER_PERI_SEL', 'Consulta de datos', 'si', '', '', 'scger.ft_gestion_periodo_sel');
select pxp.f_insert_tprocedimiento ('SCGER_PERI_CONT', 'Conteo de registros', 'si', '', '', 'scger.ft_gestion_periodo_sel');
/********************************************F-DAT-MZM-SCGER-1-25/07/2014********************************************/






/********************************************I-DAT-MZM-SCGER-1-31/07/2014********************************************/
select pxp.f_insert_tgui ('Def. Usuarios', 'Def. Usuarios', 'USUGER', 'si', 1, 'sis_gerencial/vista/usuario_ger/UsuarioGer.php', 2, '', 'UsuarioGer', 'SCGER');
select pxp.f_insert_tgui ('Definicion de Periodos', 'Definicion de Periodos', 'GES.1', 'no', 0, 'sis_gerencial/vista/gestion_periodo/GestionPeriodo.php', 3, '', '50%', 'SCGER');
select pxp.f_insert_tgui ('Personas', 'Personas', 'USUGER.1', 'no', 0, 'sis_seguridad/vista/persona/Persona.php', 3, '', 'persona', 'SCGER');
select pxp.f_insert_tgui ('Roles', 'Roles', 'USUGER.2', 'no', 0, 'sis_seguridad/vista/usuario_rol/UsuarioRol.php', 3, '', 'usuario_rol', 'SCGER');
select pxp.f_insert_tgui ('EP\', 'EP\', 'USUGER.3', 'no', 0, 'sis_seguridad/vista/usuario_grupo_ep/UsuarioGrupoEp.php', 3, '', ', 
          width:400,
          cls:', 'SCGER');
select pxp.f_insert_tgui ('Subir foto', 'Subir foto', 'USUGER.1.1', 'no', 0, 'sis_seguridad/vista/persona/subirFotoPersona.php', 4, '', 'subirFotoPersona', 'SCGER');
select pxp.f_insert_tgui ('Filiales', 'Filiales', 'USUGER.4', 'no', 0, 'sis_gerencial/vista/usuario_filial/UsuarioFilial.php', 3, '', 'UsuarioFilial', 'SCGER');
select pxp.f_insert_tfuncion ('scger.ft_dato_valor_ime', 'Funcion para tabla     ', 'SCGER');
select pxp.f_insert_tfuncion ('scger.ft_dato_valor_sel', 'Funcion para tabla     ', 'SCGER');
select pxp.f_insert_tfuncion ('scger.ft_gestion_periodo_ime', 'Funcion para tabla     ', 'SCGER');
select pxp.f_insert_tfuncion ('scger.ft_gestion_periodo_sel', 'Funcion para tabla     ', 'SCGER');
select pxp.f_insert_tfuncion ('scger.ft_usuario_filial_ime', 'Funcion para tabla     ', 'SCGER');
select pxp.f_insert_tfuncion ('scger.ft_usuario_filial_sel', 'Funcion para tabla     ', 'SCGER');
select pxp.f_insert_tprocedimiento ('SCGER_VALOR_INS', 'Insercion de registros', 'si', '', '', 'scger.ft_dato_valor_ime');
select pxp.f_insert_tprocedimiento ('SCGER_VALOR_MOD', 'Modificacion de registros', 'si', '', '', 'scger.ft_dato_valor_ime');
select pxp.f_insert_tprocedimiento ('SCGER_VALOR_ELI', 'Eliminacion de registros', 'si', '', '', 'scger.ft_dato_valor_ime');
select pxp.f_insert_tprocedimiento ('SCGER_VALOR_SEL', 'Consulta de datos', 'si', '', '', 'scger.ft_dato_valor_sel');
select pxp.f_insert_tprocedimiento ('SCGER_VALOR_CONT', 'Conteo de registros', 'si', '', '', 'scger.ft_dato_valor_sel');
select pxp.f_insert_tprocedimiento ('SCGER_PERI_INS', 'Insercion de registros', 'si', '', '', 'scger.ft_gestion_periodo_ime');
select pxp.f_insert_tprocedimiento ('SCGER_PERI_MOD', 'Modificacion de registros', 'si', '', '', 'scger.ft_gestion_periodo_ime');
select pxp.f_insert_tprocedimiento ('SCGER_PERI_ELI', 'Eliminacion de registros', 'si', '', '', 'scger.ft_gestion_periodo_ime');
select pxp.f_insert_tprocedimiento ('SCGER_PERI_SEL', 'Consulta de datos', 'si', '', '', 'scger.ft_gestion_periodo_sel');
select pxp.f_insert_tprocedimiento ('SCGER_PERI_CONT', 'Conteo de registros', 'si', '', '', 'scger.ft_gestion_periodo_sel');
select pxp.f_insert_tprocedimiento ('SCGER_USUFIL_INS', 'Insercion de registros', 'si', '', '', 'scger.ft_usuario_filial_ime');
select pxp.f_insert_tprocedimiento ('SCGER_USUFIL_MOD', 'Modificacion de registros', 'si', '', '', 'scger.ft_usuario_filial_ime');
select pxp.f_insert_tprocedimiento ('SCGER_USUFIL_ELI', 'Eliminacion de registros', 'si', '', '', 'scger.ft_usuario_filial_ime');
select pxp.f_insert_tprocedimiento ('SCGER_USUFIL_SEL', 'Consulta de datos', 'si', '', '', 'scger.ft_usuario_filial_sel');
select pxp.f_insert_tprocedimiento ('SCGER_USUFIL_CONT', 'Conteo de registros', 'si', '', '', 'scger.ft_usuario_filial_sel');
/********************************************F-DAT-MZM-SCGER-1-31/07/2014********************************************/




/********************************************I-DAT-MZM-SCGER-1-04/08/2014********************************************/
select pxp.f_insert_tgui ('Gestion', 'Gestion', 'GES', 'si', 5, 'sis_gerencial/vista/gestion/Gestion.php', 2, '', 'Gestion', 'SCGER');
select pxp.f_insert_tgui ('Tipo Dato', 'Tipo Dato', 'TIPDAT', 'si', 4, 'sis_gerencial/vista/tipo_dato/TipoDato.php', 2, '', 'TipoDato', 'SCGER');
select pxp.f_delete_tgui ('DATO');
select pxp.f_insert_tgui ('Filial', 'Filial', 'FILI', 'si', 2, 'sis_gerencial/vista/filial/Filial.php', 2, '', 'Filial', 'SCGER');
select pxp.f_insert_tgui ('Valor', 'Valor', 'VALOR', 'si', 6, 'sis_gerencial/vista/dato_valor/DatoValor.php', 2, '', 'DatoValor', 'SCGER');
select pxp.f_insert_tgui ('Definicion de Datos', 'Definicion de Datos', 'TIPDAT.1', 'no', 0, 'sis_gerencial/vista/dato/Dato.php', 3, '', '50%', 'SCGER');
select pxp.f_insert_tgui ('Def. Usuarios', 'Def. Usuarios', 'USUGER', 'si', 3, 'sis_gerencial/vista/usuario_ger/UsuarioGer.php', 2, '', 'UsuarioGer', 'SCGER');
select pxp.f_insert_tgui ('Definicion de Periodos', 'Definicion de Periodos', 'GES.1', 'no', 0, 'sis_gerencial/vista/gestion_periodo/GestionPeriodo.php', 3, '', '50%', 'SCGER');
select pxp.f_insert_tgui ('Personas', 'Personas', 'USUGER.1', 'no', 0, 'sis_seguridad/vista/persona/Persona.php', 3, '', 'persona', 'SCGER');
select pxp.f_insert_tgui ('Roles', 'Roles', 'USUGER.2', 'no', 0, 'sis_seguridad/vista/usuario_rol/UsuarioRol.php', 3, '', 'usuario_rol', 'SCGER');
select pxp.f_insert_tgui ('EP\', 'EP\', 'USUGER.3', 'no', 0, 'sis_seguridad/vista/usuario_grupo_ep/UsuarioGrupoEp.php', 3, '', ', 
          width:400,
          cls:', 'SCGER');
select pxp.f_insert_tgui ('Subir foto', 'Subir foto', 'USUGER.1.1', 'no', 0, 'sis_seguridad/vista/persona/subirFotoPersona.php', 4, '', 'subirFotoPersona', 'SCGER');
select pxp.f_insert_tgui ('Filiales', 'Filiales', 'USUGER.4', 'no', 0, 'sis_gerencial/vista/usuario_filial/UsuarioFilial.php', 3, '', 'UsuarioFilial', 'SCGER');
select pxp.f_insert_tfuncion ('scger.ft_dato_valor_ime', 'Funcion para tabla     ', 'SCGER');
select pxp.f_insert_tfuncion ('scger.ft_dato_valor_sel', 'Funcion para tabla     ', 'SCGER');
select pxp.f_insert_tfuncion ('scger.ft_gestion_periodo_ime', 'Funcion para tabla     ', 'SCGER');
select pxp.f_insert_tfuncion ('scger.ft_gestion_periodo_sel', 'Funcion para tabla     ', 'SCGER');
select pxp.f_insert_tfuncion ('scger.ft_usuario_filial_ime', 'Funcion para tabla     ', 'SCGER');
select pxp.f_insert_tfuncion ('scger.ft_usuario_filial_sel', 'Funcion para tabla     ', 'SCGER');
select pxp.f_insert_tprocedimiento ('SCGER_VALOR_INS', 'Insercion de registros', 'si', '', '', 'scger.ft_dato_valor_ime');
select pxp.f_insert_tprocedimiento ('SCGER_VALOR_MOD', 'Modificacion de registros', 'si', '', '', 'scger.ft_dato_valor_ime');
select pxp.f_insert_tprocedimiento ('SCGER_VALOR_ELI', 'Eliminacion de registros', 'si', '', '', 'scger.ft_dato_valor_ime');
select pxp.f_insert_tprocedimiento ('SCGER_VALOR_SEL', 'Consulta de datos', 'si', '', '', 'scger.ft_dato_valor_sel');
select pxp.f_insert_tprocedimiento ('SCGER_VALOR_CONT', 'Conteo de registros', 'si', '', '', 'scger.ft_dato_valor_sel');
select pxp.f_insert_tprocedimiento ('SCGER_PERI_INS', 'Insercion de registros', 'si', '', '', 'scger.ft_gestion_periodo_ime');
select pxp.f_insert_tprocedimiento ('SCGER_PERI_MOD', 'Modificacion de registros', 'si', '', '', 'scger.ft_gestion_periodo_ime');
select pxp.f_insert_tprocedimiento ('SCGER_PERI_ELI', 'Eliminacion de registros', 'si', '', '', 'scger.ft_gestion_periodo_ime');
select pxp.f_insert_tprocedimiento ('SCGER_PERI_SEL', 'Consulta de datos', 'si', '', '', 'scger.ft_gestion_periodo_sel');
select pxp.f_insert_tprocedimiento ('SCGER_PERI_CONT', 'Conteo de registros', 'si', '', '', 'scger.ft_gestion_periodo_sel');
select pxp.f_insert_tprocedimiento ('SCGER_USUFIL_INS', 'Insercion de registros', 'si', '', '', 'scger.ft_usuario_filial_ime');
select pxp.f_insert_tprocedimiento ('SCGER_USUFIL_MOD', 'Modificacion de registros', 'si', '', '', 'scger.ft_usuario_filial_ime');
select pxp.f_insert_tprocedimiento ('SCGER_USUFIL_ELI', 'Eliminacion de registros', 'si', '', '', 'scger.ft_usuario_filial_ime');
select pxp.f_insert_tprocedimiento ('SCGER_USUFIL_SEL', 'Consulta de datos', 'si', '', '', 'scger.ft_usuario_filial_sel');
select pxp.f_insert_tprocedimiento ('SCGER_USUFIL_CONT', 'Conteo de registros', 'si', '', '', 'scger.ft_usuario_filial_sel');
select pxp.f_insert_tprocedimiento ('SCGER_PERI_APE', 'CODIGO NO DOCUMENTADO', 'si', '', '', 'scger.ft_gestion_periodo_ime');
select pxp.f_insert_trol ('', 'Registro filial', 'SCGER');
select pxp.f_insert_trol ('Administrador Sist. Control Gerencial', 'Admin SCG', 'SCGER');
/********************************************F-DAT-MZM-SCGER-1-04/08/2014********************************************/

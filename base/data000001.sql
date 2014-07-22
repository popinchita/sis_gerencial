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



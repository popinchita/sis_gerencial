/********************************************I-DEP-MZM-SCGER-1-21/07/2014********************************************/
--
-- Definition for index fk_tgestion_periodo__id_gestion  
--
ALTER TABLE ONLY scger.tgestion_periodo
    ADD CONSTRAINT fk_tgestion_periodo__id_gestion
    FOREIGN KEY (id_gestion) REFERENCES scger.tgestion(id_gestion);
--
-- Definition for index fk_tfilial__id_rubro 
    
ALTER TABLE ONLY scger.tfilial
    ADD CONSTRAINT fk_tfilial__id_rubro
    FOREIGN KEY (id_rubro) REFERENCES scger.trubro(id_rubro);
    
    
--
-- Definition for index fk_tdato_valor__id_gestion_periodo (OID = 309333) : 
--
ALTER TABLE ONLY scger.tdato_valor
    ADD CONSTRAINT fk_tdato_valor__id_gestion_periodo
    FOREIGN KEY (id_gestion_periodo) REFERENCES scger.tgestion_periodo(id_gestion_periodo);
    
--
-- Definition for index fk_tdato_valor__id_filial (OID = 309333) : 
--    
ALTER TABLE ONLY scger.tdato_valor
    ADD CONSTRAINT fk_tdato_valor__id_filial
    FOREIGN KEY (id_filial) REFERENCES scger.tfilial(id_filial);
--
-- Definition for index fk_tdato_valor__id_dato (OID = 309333) : 
--    
ALTER TABLE ONLY scger.tdato_valor
    ADD CONSTRAINT fk_tdato_valor__id_dato
    FOREIGN KEY (id_dato) REFERENCES scger.tdato(id_dato);

--
-- Definition for index fk_tdato__id_tipo_dato (OID = 309333) : 
--
 ALTER TABLE ONLY scger.tdato
    ADD CONSTRAINT fk_tdato__id_tipo_dato
    FOREIGN KEY (id_tipo_dato) REFERENCES scger.ttipo_dato(id_tipo_dato);
/********************************************F-DEP-MZM-SCGER-1-21/07/2014********************************************/

/********************************************I-DEP-MZM-SCGER-2-21/07/2014********************************************/
select pxp.f_insert_testructura_gui ('SCGER', 'SISTEMA');   
select pxp.f_insert_testructura_gui ('RUB', 'SCGER');
select pxp.f_insert_testructura_gui ('GES', 'SCGER');
select pxp.f_insert_testructura_gui ('TIPDAT', 'SCGER');
select pxp.f_insert_tprocedimiento_gui ('SCGER_RUB_INS', 'RUB', 'si');
select pxp.f_insert_tprocedimiento_gui ('SCGER_RUB_SEL', 'RUB', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_RUB_CONT', 'RUB', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_GES_INS', 'GES', 'si');
select pxp.f_insert_tprocedimiento_gui ('SCGER_GES_MOD', 'GES', 'si');
select pxp.f_insert_tprocedimiento_gui ('SCGER_GES_ELI', 'GES', 'si');
select pxp.f_insert_tprocedimiento_gui ('SCGER_GES_SEL', 'GES', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_GES_CONT', 'GES', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_TIPDAT_INS', 'TIPDAT', 'si');
select pxp.f_insert_tprocedimiento_gui ('SCGER_TIPDAT_MOD', 'TIPDAT', 'si');
select pxp.f_insert_tprocedimiento_gui ('SCGER_TIPDAT_ELI', 'TIPDAT', 'si');
select pxp.f_insert_tprocedimiento_gui ('SCGER_TIPDAT_SEL', 'TIPDAT', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_TIPDAT_CONT', 'TIPDAT', 'no');
/********************************************F-DEP-MZM-SCGER-2-21/07/2014********************************************/


/********************************************I-DEP-MZM-SCGER-1-22/07/2014********************************************/
select pxp.f_insert_testructura_gui ('DATO', 'SCGER');
select pxp.f_insert_tprocedimiento_gui ('SCGER_RUB_MOD', 'RUB', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_RUB_ELI', 'RUB', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_DATO_INS', 'DATO', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_DATO_MOD', 'DATO', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_DATO_ELI', 'DATO', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_DATO_SEL', 'DATO', 'no');
/********************************************F-DEP-MZM-SCGER-1-22/07/2014********************************************/

/********************************************I-DEP-MZM-SCGER-1-23/07/2014********************************************/
ALTER TABLE scger.ttipo_dato
  ADD   UNIQUE (codigo);
  
select pxp.f_insert_testructura_gui ('FILI', 'SCGER');
select pxp.f_insert_tprocedimiento_gui ('SCGER_TIPDAT_SEL', 'DATO', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_FILI_INS', 'FILI', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_FILI_MOD', 'FILI', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_FILI_ELI', 'FILI', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_FILI_SEL', 'FILI', 'no');
  
ALTER TABLE scger.ttipo_dato
  ADD COLUMN tipo_dato VARCHAR(20);

ALTER TABLE scger.ttipo_dato
  ALTER COLUMN tipo_dato SET DEFAULT 'variable';

COMMENT ON COLUMN scger.ttipo_dato.tipo_dato
IS 'variable, formula';


ALTER TABLE scger.tdato
  ADD COLUMN orden_ejecucion INTEGER;

/********************************************F-DEP-MZM-SCGER-1-23/07/2014********************************************/

  
  
/********************************************I-DEP-MZM-SCGER-1-24/07/2014********************************************/  
ALTER TABLE ONLY scger.tusuario_filial
    ADD CONSTRAINT fk_tusuario_filial__id_usuario
    FOREIGN KEY (id_usuario) REFERENCES segu.tusuario(id_usuario);
    
    
ALTER TABLE ONLY scger.tusuario_filial
    ADD CONSTRAINT fk_tusuario_filial__id_filial
    FOREIGN KEY (id_filial) REFERENCES scger.tfilial(id_filial); 
   
/********************************************F-DEP-MZM-SCGER-1-24/07/2014********************************************/
    
    
    
    
   
/********************************************I-DEP-MZM-SCGER-1-25/07/2014********************************************/
select pxp.f_insert_testructura_gui ('VALOR', 'SCGER');
select pxp.f_insert_testructura_gui ('TIPDAT.1', 'TIPDAT');
select pxp.f_delete_tprocedimiento_gui ('SCGER_TIPDAT_SEL', 'DATO');
select pxp.f_insert_tprocedimiento_gui ('SCGER_VALOR_INS', 'VALOR', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_VALOR_MOD', 'VALOR', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_VALOR_ELI', 'VALOR', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_VALOR_SEL', 'VALOR', 'no');
/********************************************F-DEP-MZM-SCGER-1-25/07/2014********************************************/

    
/********************************************I-DEP-MZM-SCGER-1-31/07/2014********************************************/
select pxp.f_delete_testructura_gui ('DATO', 'SCGER');

select pxp.f_insert_testructura_gui ('VALOR', 'SCGER');
select pxp.f_insert_testructura_gui ('TIPDAT.1', 'TIPDAT');
select pxp.f_insert_testructura_gui ('USUGER', 'SCGER');
select pxp.f_insert_testructura_gui ('GES.1', 'GES');
select pxp.f_insert_testructura_gui ('USUGER.1', 'USUGER');
select pxp.f_insert_testructura_gui ('USUGER.2', 'USUGER');
select pxp.f_insert_testructura_gui ('USUGER.3', 'USUGER');
select pxp.f_insert_testructura_gui ('USUGER.1.1', 'USUGER.1');
select pxp.f_insert_testructura_gui ('USUGER.4', 'USUGER');
select pxp.f_delete_tprocedimiento_gui ('SCGER_DATO_INS', 'DATO');
select pxp.f_delete_tprocedimiento_gui ('SCGER_DATO_MOD', 'DATO');
select pxp.f_delete_tprocedimiento_gui ('SCGER_DATO_ELI', 'DATO');
select pxp.f_delete_tprocedimiento_gui ('SCGER_DATO_SEL', 'DATO');
select pxp.f_delete_tprocedimiento_gui ('SCGER_TIPDAT_SEL', 'DATO');
select pxp.f_insert_tprocedimiento_gui ('SCGER_FILI_INS', 'FILI', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_FILI_MOD', 'FILI', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_FILI_ELI', 'FILI', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_FILI_SEL', 'FILI', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_DATO_INS', 'TIPDAT.1', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_DATO_MOD', 'TIPDAT.1', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_DATO_ELI', 'TIPDAT.1', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_DATO_SEL', 'TIPDAT.1', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_VALOR_INS', 'VALOR', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_VALOR_MOD', 'VALOR', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_VALOR_ELI', 'VALOR', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_VALOR_SEL', 'VALOR', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_PERI_INS', 'GES.1', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_PERI_MOD', 'GES.1', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_PERI_ELI', 'GES.1', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_PERI_SEL', 'GES.1', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_DATO_SEL', 'VALOR', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_PERI_SEL', 'VALOR', 'no');
select pxp.f_insert_tprocedimiento_gui ('SEG_PERSON_SEL', 'USUGER', 'no');
select pxp.f_insert_tprocedimiento_gui ('SEG_PERSONMIN_SEL', 'USUGER', 'no');
select pxp.f_insert_tprocedimiento_gui ('SEG_CLASIF_SEL', 'USUGER', 'no');
select pxp.f_insert_tprocedimiento_gui ('SEG_ROL_SEL', 'USUGER', 'no');
select pxp.f_insert_tprocedimiento_gui ('SEG_USUARI_INS', 'USUGER', 'no');
select pxp.f_insert_tprocedimiento_gui ('SEG_USUARI_MOD', 'USUGER', 'no');
select pxp.f_insert_tprocedimiento_gui ('SEG_USUARI_ELI', 'USUGER', 'no');
select pxp.f_insert_tprocedimiento_gui ('SEG_USUARI_SEL', 'USUGER', 'no');
select pxp.f_insert_tprocedimiento_gui ('SEG_LISTUSU_SEG', 'USUGER', 'no');
select pxp.f_insert_tprocedimiento_gui ('SEG_PERSON_INS', 'USUGER.1', 'no');
select pxp.f_insert_tprocedimiento_gui ('SEG_PERSON_MOD', 'USUGER.1', 'no');
select pxp.f_insert_tprocedimiento_gui ('SEG_PERSON_ELI', 'USUGER.1', 'no');
select pxp.f_insert_tprocedimiento_gui ('SEG_PERSONMIN_SEL', 'USUGER.1', 'no');
select pxp.f_insert_tprocedimiento_gui ('SEG_UPFOTOPER_MOD', 'USUGER.1.1', 'no');
select pxp.f_insert_tprocedimiento_gui ('SEG_ROL_SEL', 'USUGER.2', 'no');
select pxp.f_insert_tprocedimiento_gui ('SEG_USUROL_INS', 'USUGER.2', 'no');
select pxp.f_insert_tprocedimiento_gui ('SEG_USUROL_MOD', 'USUGER.2', 'no');
select pxp.f_insert_tprocedimiento_gui ('SEG_USUROL_ELI', 'USUGER.2', 'no');
select pxp.f_insert_tprocedimiento_gui ('SEG_USUROL_SEL', 'USUGER.2', 'no');
select pxp.f_insert_tprocedimiento_gui ('PM_GRU_SEL', 'USUGER.3', 'no');
select pxp.f_insert_tprocedimiento_gui ('SG_UEP_INS', 'USUGER.3', 'no');
select pxp.f_insert_tprocedimiento_gui ('SG_UEP_MOD', 'USUGER.3', 'no');
select pxp.f_insert_tprocedimiento_gui ('SG_UEP_ELI', 'USUGER.3', 'no');
select pxp.f_insert_tprocedimiento_gui ('SG_UEP_SEL', 'USUGER.3', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_USUFIL_INS', 'USUGER.4', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_USUFIL_MOD', 'USUGER.4', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_USUFIL_ELI', 'USUGER.4', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_USUFIL_SEL', 'USUGER.4', 'no');


ALTER TABLE scger.tdato_valor
RENAME COLUMN id_dato TO id_tipo_dato;
  
  -- object recreation
ALTER TABLE scger.tdato_valor
DROP CONSTRAINT fk_tdato_valor__id_dato RESTRICT;

ALTER TABLE scger.tdato_valor
  ADD CONSTRAINT fk_tdato_valor__id_dato FOREIGN KEY (id_tipo_dato)
    REFERENCES scger.ttipo_dato(id_tipo_dato)
    MATCH FULL
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;

/********************************************F-DEP-MZM-SCGER-1-31/07/2014********************************************/
    
    
    
/********************************************I-DEP-MZM-SCGER-1-04/08/2014********************************************/
 select pxp.f_delete_testructura_gui ('DATO', 'SCGER');
select pxp.f_insert_testructura_gui ('FILI', 'SCGER');
select pxp.f_insert_testructura_gui ('VALOR', 'SCGER');
select pxp.f_insert_testructura_gui ('TIPDAT.1', 'TIPDAT');
select pxp.f_insert_testructura_gui ('USUGER', 'SCGER');
select pxp.f_insert_testructura_gui ('GES.1', 'GES');
select pxp.f_insert_testructura_gui ('USUGER.1', 'USUGER');
select pxp.f_insert_testructura_gui ('USUGER.2', 'USUGER');
select pxp.f_insert_testructura_gui ('USUGER.3', 'USUGER');
select pxp.f_insert_testructura_gui ('USUGER.1.1', 'USUGER.1');
select pxp.f_insert_testructura_gui ('USUGER.4', 'USUGER');
select pxp.f_delete_tprocedimiento_gui ('SCGER_DATO_INS', 'DATO');
select pxp.f_delete_tprocedimiento_gui ('SCGER_DATO_MOD', 'DATO');
select pxp.f_delete_tprocedimiento_gui ('SCGER_DATO_ELI', 'DATO');
select pxp.f_delete_tprocedimiento_gui ('SCGER_DATO_SEL', 'DATO');
select pxp.f_delete_tprocedimiento_gui ('SCGER_TIPDAT_SEL', 'DATO');
select pxp.f_insert_tprocedimiento_gui ('SCGER_FILI_INS', 'FILI', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_FILI_MOD', 'FILI', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_FILI_ELI', 'FILI', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_FILI_SEL', 'FILI', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_DATO_INS', 'TIPDAT.1', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_DATO_MOD', 'TIPDAT.1', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_DATO_ELI', 'TIPDAT.1', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_DATO_SEL', 'TIPDAT.1', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_VALOR_INS', 'VALOR', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_VALOR_MOD', 'VALOR', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_VALOR_ELI', 'VALOR', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_VALOR_SEL', 'VALOR', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_PERI_INS', 'GES.1', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_PERI_MOD', 'GES.1', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_PERI_ELI', 'GES.1', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_PERI_SEL', 'GES.1', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_DATO_SEL', 'VALOR', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_PERI_SEL', 'VALOR', 'no');
select pxp.f_insert_tprocedimiento_gui ('SEG_PERSON_SEL', 'USUGER', 'no');
select pxp.f_insert_tprocedimiento_gui ('SEG_PERSONMIN_SEL', 'USUGER', 'no');
select pxp.f_insert_tprocedimiento_gui ('SEG_CLASIF_SEL', 'USUGER', 'no');
select pxp.f_insert_tprocedimiento_gui ('SEG_ROL_SEL', 'USUGER', 'no');
select pxp.f_insert_tprocedimiento_gui ('SEG_USUARI_INS', 'USUGER', 'no');
select pxp.f_insert_tprocedimiento_gui ('SEG_USUARI_MOD', 'USUGER', 'no');
select pxp.f_insert_tprocedimiento_gui ('SEG_USUARI_ELI', 'USUGER', 'no');
select pxp.f_insert_tprocedimiento_gui ('SEG_USUARI_SEL', 'USUGER', 'no');
select pxp.f_insert_tprocedimiento_gui ('SEG_LISTUSU_SEG', 'USUGER', 'no');
select pxp.f_insert_tprocedimiento_gui ('SEG_PERSON_INS', 'USUGER.1', 'no');
select pxp.f_insert_tprocedimiento_gui ('SEG_PERSON_MOD', 'USUGER.1', 'no');
select pxp.f_insert_tprocedimiento_gui ('SEG_PERSON_ELI', 'USUGER.1', 'no');
select pxp.f_insert_tprocedimiento_gui ('SEG_PERSONMIN_SEL', 'USUGER.1', 'no');
select pxp.f_insert_tprocedimiento_gui ('SEG_UPFOTOPER_MOD', 'USUGER.1.1', 'no');
select pxp.f_insert_tprocedimiento_gui ('SEG_ROL_SEL', 'USUGER.2', 'no');
select pxp.f_insert_tprocedimiento_gui ('SEG_USUROL_INS', 'USUGER.2', 'no');
select pxp.f_insert_tprocedimiento_gui ('SEG_USUROL_MOD', 'USUGER.2', 'no');
select pxp.f_insert_tprocedimiento_gui ('SEG_USUROL_ELI', 'USUGER.2', 'no');
select pxp.f_insert_tprocedimiento_gui ('SEG_USUROL_SEL', 'USUGER.2', 'no');
select pxp.f_insert_tprocedimiento_gui ('PM_GRU_SEL', 'USUGER.3', 'no');
select pxp.f_insert_tprocedimiento_gui ('SG_UEP_INS', 'USUGER.3', 'no');
select pxp.f_insert_tprocedimiento_gui ('SG_UEP_MOD', 'USUGER.3', 'no');
select pxp.f_insert_tprocedimiento_gui ('SG_UEP_ELI', 'USUGER.3', 'no');
select pxp.f_insert_tprocedimiento_gui ('SG_UEP_SEL', 'USUGER.3', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_USUFIL_INS', 'USUGER.4', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_USUFIL_MOD', 'USUGER.4', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_USUFIL_ELI', 'USUGER.4', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_USUFIL_SEL', 'USUGER.4', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_FILI_SEL', 'VALOR', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_FILI_SEL', 'USUGER.4', 'no');
select pxp.f_insert_tprocedimiento_gui ('SCGER_PERI_APE', 'GES.1', 'si');
select pxp.f_insert_tprocedimiento_gui ('SCGER_TIPDAT_SEL', 'VALOR', 'no');



select pxp.f_insert_tgui_rol ('VALOR', 'Registro filial');
select pxp.f_insert_tgui_rol ('SCGER', 'Registro filial');
select pxp.f_insert_tgui_rol ('SISTEMA', 'Registro filial');
select pxp.f_insert_tgui_rol ('SCGER', 'Admin SCG');
select pxp.f_insert_tgui_rol ('SISTEMA', 'Admin SCG');
select pxp.f_insert_tgui_rol ('RUB', 'Admin SCG');
select pxp.f_insert_tgui_rol ('GES', 'Admin SCG');
select pxp.f_insert_tgui_rol ('GES.1', 'Admin SCG');
select pxp.f_insert_tgui_rol ('TIPDAT', 'Admin SCG');
select pxp.f_insert_tgui_rol ('TIPDAT.1', 'Admin SCG');
select pxp.f_insert_tgui_rol ('FILI', 'Admin SCG');
select pxp.f_insert_tgui_rol ('VALOR', 'Admin SCG');
select pxp.f_insert_tgui_rol ('USUGER', 'Admin SCG');
select pxp.f_insert_tgui_rol ('USUGER.1', 'Admin SCG');
select pxp.f_insert_tgui_rol ('USUGER.1.1', 'Admin SCG');
select pxp.f_insert_tgui_rol ('USUGER.2', 'Admin SCG');
select pxp.f_insert_tgui_rol ('USUGER.3', 'Admin SCG');
select pxp.f_insert_tgui_rol ('USUGER.4', 'Admin SCG');
select pxp.f_insert_trol_procedimiento_gui ('Registro filial', 'SCGER_VALOR_INS', 'VALOR');
select pxp.f_insert_trol_procedimiento_gui ('Registro filial', 'SCGER_VALOR_MOD', 'VALOR');
select pxp.f_insert_trol_procedimiento_gui ('Registro filial', 'SCGER_VALOR_ELI', 'VALOR');
select pxp.f_insert_trol_procedimiento_gui ('Registro filial', 'SCGER_VALOR_SEL', 'VALOR');
select pxp.f_insert_trol_procedimiento_gui ('Registro filial', 'SCGER_DATO_SEL', 'VALOR');
select pxp.f_insert_trol_procedimiento_gui ('Registro filial', 'SCGER_PERI_SEL', 'VALOR');
select pxp.f_insert_trol_procedimiento_gui ('Registro filial', 'SCGER_FILI_SEL', 'VALOR');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SCGER_RUB_INS', 'RUB');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SCGER_RUB_SEL', 'RUB');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SCGER_RUB_CONT', 'RUB');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SCGER_RUB_MOD', 'RUB');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SCGER_RUB_ELI', 'RUB');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SCGER_GES_INS', 'GES');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SCGER_GES_MOD', 'GES');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SCGER_GES_ELI', 'GES');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SCGER_GES_SEL', 'GES');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SCGER_GES_CONT', 'GES');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SCGER_PERI_INS', 'GES.1');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SCGER_PERI_MOD', 'GES.1');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SCGER_PERI_ELI', 'GES.1');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SCGER_PERI_SEL', 'GES.1');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SCGER_PERI_APE', 'GES.1');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SCGER_TIPDAT_INS', 'TIPDAT');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SCGER_TIPDAT_MOD', 'TIPDAT');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SCGER_TIPDAT_ELI', 'TIPDAT');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SCGER_TIPDAT_SEL', 'TIPDAT');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SCGER_TIPDAT_CONT', 'TIPDAT');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SCGER_DATO_INS', 'TIPDAT.1');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SCGER_DATO_MOD', 'TIPDAT.1');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SCGER_DATO_ELI', 'TIPDAT.1');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SCGER_DATO_SEL', 'TIPDAT.1');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SCGER_FILI_INS', 'FILI');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SCGER_FILI_MOD', 'FILI');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SCGER_FILI_ELI', 'FILI');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SCGER_FILI_SEL', 'FILI');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SCGER_VALOR_INS', 'VALOR');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SCGER_VALOR_MOD', 'VALOR');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SCGER_VALOR_ELI', 'VALOR');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SCGER_VALOR_SEL', 'VALOR');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SCGER_DATO_SEL', 'VALOR');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SCGER_PERI_SEL', 'VALOR');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SCGER_FILI_SEL', 'VALOR');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SEG_PERSON_SEL', 'USUGER');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SEG_PERSONMIN_SEL', 'USUGER');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SEG_CLASIF_SEL', 'USUGER');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SEG_ROL_SEL', 'USUGER');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SEG_USUARI_INS', 'USUGER');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SEG_USUARI_MOD', 'USUGER');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SEG_USUARI_ELI', 'USUGER');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SEG_USUARI_SEL', 'USUGER');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SEG_LISTUSU_SEG', 'USUGER');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SEG_PERSON_INS', 'USUGER.1');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SEG_PERSON_MOD', 'USUGER.1');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SEG_PERSON_ELI', 'USUGER.1');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SEG_PERSONMIN_SEL', 'USUGER.1');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SEG_UPFOTOPER_MOD', 'USUGER.1.1');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SEG_ROL_SEL', 'USUGER.2');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SEG_USUROL_INS', 'USUGER.2');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SEG_USUROL_MOD', 'USUGER.2');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SEG_USUROL_ELI', 'USUGER.2');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SEG_USUROL_SEL', 'USUGER.2');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'PM_GRU_SEL', 'USUGER.3');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SG_UEP_INS', 'USUGER.3');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SG_UEP_MOD', 'USUGER.3');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SG_UEP_ELI', 'USUGER.3');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SG_UEP_SEL', 'USUGER.3');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SCGER_USUFIL_INS', 'USUGER.4');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SCGER_USUFIL_MOD', 'USUGER.4');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SCGER_USUFIL_ELI', 'USUGER.4');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SCGER_USUFIL_SEL', 'USUGER.4');
select pxp.f_insert_trol_procedimiento_gui ('Admin SCG', 'SCGER_FILI_SEL', 'USUGER.4');

    
/********************************************F-DEP-MZM-SCGER-1-04/08/2014********************************************/

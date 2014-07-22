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




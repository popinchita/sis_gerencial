/****************************I-SCP-MZM-SCGER-1-21/07/2014*************/ 
-- Structure for table tgestion (OID = 306331) : 
--
CREATE TABLE scger.tgestion (
    id_gestion serial NOT NULL,
    gestion integer,
    estado varchar(15),
    PRIMARY KEY (id_gestion)
)
INHERITS (pxp.tbase) WITH OIDS;


-- Structure for table tperiodo (OID = 306372) : 
--
CREATE TABLE scger.tgestion_periodo (
    id_gestion_periodo serial NOT NULL,
    id_gestion integer,
    periodo integer,
    fecha_ini date,
    fecha_fin date,
    PRIMARY KEY (id_gestion_periodo)
)
INHERITS (pxp.tbase) WITH OIDS;



--rubro

CREATE TABLE scger.trubro(
id_rubro SERIAL NOT NULL, 
codigo_rubro varchar(20), 
nombre_rubro varchar(100), 
descripcion_rubro varchar(255), 
PRIMARY KEY(id_rubro)) 
INHERITS (pxp.tbase)
WITH OIDS; 
    

--filial
CREATE TABLE scger.tfilial(
    id_filial SERIAL NOT NULL,
    nombre varchar(150),
    nit varchar (20),
    sigla varchar(10),
    logo varchar(255),
    id_rubro integer,
    PRIMARY KEY (id_filial)) INHERITS (pxp.tbase)
    WITH OIDS;
    
    
 --cargo
CREATE TABLE scger.tcargo (
  id_cargo SERIAL NOT NULL, 
  codigo VARCHAR(20) NOT NULL, 
  nombre varchar(150) not null,
  descripcion varchar (500),
  PRIMARY KEY(id_cargo)
) INHERITS (pxp.tbase)
WITH OIDS;




CREATE TABLE scger.ttipo_dato (
  id_tipo_dato SERIAL, 
  codigo VARCHAR(255), 
  nombre VARCHAR(255), 
  estado_reg VARCHAR(10), 
  PRIMARY KEY(id_tipo_dato)
) INHERITS (pxp.tbase)
WITH OIDS;
 

CREATE TABLE scger.tdato (
  id_dato SERIAL, 
  id_tipo_dato integer,
  formula VARCHAR(500), 
  PRIMARY KEY(id_dato)
) INHERITS (pxp.tbase)
WITH OIDS;


CREATE TABLE scger.tdato_valor (
  id_dato_valor SERIAL,
  id_dato integer,
  id_filial integer,
  id_gestion_periodo integer,
  valor numeric(18,2),
  estado_reg VARCHAR(10), 
  PRIMARY KEY(id_dato_valor)
) INHERITS (pxp.tbase)
WITH OIDS;
/****************************F-SCP-MZM-SCGER-1-21/07/2014*************/ 
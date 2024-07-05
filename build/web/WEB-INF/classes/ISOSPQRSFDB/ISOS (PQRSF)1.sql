
CREATE table documento (
doc_Codigo int(2) NOT NULL auto_increment,
doc_Nombre varchar(40) NOT NULL UNIQUE,
PRIMARY KEY (doc_Codigo))
CHARACTER SET latin1 COLLATE latin1_general_cs;

CREATE table genero (
gen_Codigo int(2) NOT NULL auto_increment,
gen_Nombre varchar(20) NOT NULL UNIQUE,
PRIMARY KEY (gen_Codigo))
CHARACTER SET latin1 COLLATE latin1_general_cs;

CREATE table municipio (
mun_Codigo int(5) NOT NULL auto_increment,
mun_Nombre varchar(40) NOT NULL UNIQUE,
PRIMARY KEY (mun_Codigo)) 
CHARACTER SET latin1 COLLATE latin1_general_cs;

CREATE table proceso (
pro_Codigo int(5) NOT NULL auto_increment,
pro_Nombre varchar(50) NOT NULL UNIQUE,
PRIMARY KEY (pro_Codigo))
CHARACTER SET latin1 COLLATE latin1_general_cs;

CREATE Table rol (
rol_Codigo int(5) NOT NULL auto_increment primary key,
rol_nombre varchar(40) NOT NULL unique)
CHARACTER SET latin1 COLLATE latin1_general_cs;

CREATE TABLE usuario (
usu_Id bigint(20) NOT NULL,
	fk_doc_Codigo int(2) NOT NULL,
usu_Contrasena blob NOT NULL, 
usu_Primernombre varchar(20) NOT NULL, 
usu_Segundonombre varchar(20) , 
usu_Primerapellido varchar(20) NOT NULL, 
usu_Segundoapellido varchar(20) ,
	fk_gen_Codigo int(2) NOT NULL, 
usu_Fechaingreso timestamp NOT NULL default current_timestamp,  
usu_Celular varchar(13) NOT NULL UNIQUE CHECK(000-000-0000),
usu_Correo varchar (60) not null unique,
	fk_mun_Codigo int(5) NOT NULL, 
	fk_pro_Codigo int(5) NOT NULL,
	fk_rol_Codigo int(5) NOT NULL, 		
foreign key (fk_doc_Codigo) references documento(doc_Codigo)
on delete cascade on update cascade,
foreign key (fk_gen_Codigo) references genero(gen_Codigo)
on delete cascade on update cascade,
foreign key (fk_mun_Codigo) references municipio(mun_Codigo)
on delete cascade on update cascade,	
foreign key (fk_pro_Codigo) references proceso(pro_Codigo)
on delete cascade on update cascade,
foreign key (fk_rol_Codigo) references rol(rol_Codigo)
on delete cascade on update cascade,
CONSTRAINT id PRIMARY KEY (usu_Id)) 
CHARACTER SET latin1 COLLATE latin1_general_cs;

CREATE table modulo (
mod_Codigo int(2) NOT NULL auto_increment,
mod_Nombre varchar(30) NOT NULL UNIQUE,
PRIMARY KEY (mod_Codigo))
CHARACTER SET latin1 COLLATE latin1_general_cs;

create TABLE privilegios (
	fk_rol_Codigo int(5) NOT NULL ,
	fk_mod_Codigo int(2) NOT NULL,
Crear tinyint NOT NULL,
Actualizar tinyint NOT NULL,
Estado tinyint NOT NULL,
Consultar tinyint NOT NULL,
key k2_rol_Codigo (fk_rol_Codigo),
key k2_mod_Codigo (fk_mod_Codigo),
foreign key k_rol_Codigo(fk_rol_Codigo) references rol(rol_Codigo) 
on delete cascade on update cascade,
foreign key k_mod_Codigo(fk_mod_Codigo) references modulo(mod_Codigo)
on delete cascade on update cascade
)
CHARACTER SET latin1 COLLATE latin1_general_cs;

CREATE table ciudadano (
ciu_Codigo int(4) NOT NULL auto_increment,
ciu_Nombre varchar(45) NOT NULL UNIQUE,
PRIMARY KEY (ciu_Codigo))
CHARACTER SET latin1 COLLATE latin1_general_cs;

CREATE table cuenta (
cue_Codigo int(5) NOT NULL auto_increment,
cue_Nombre varchar(20) NOT NULL,
cue_Dominio varchar(3) NOT NULL,
PRIMARY KEY (cue_Codigo))
CHARACTER SET latin1 COLLATE latin1_general_cs;

CREATE table medio (
med_Codigo int(2) NOT NULL auto_increment,
med_Nombre varchar(40) NOT NULL UNIQUE,
PRIMARY KEY (med_Codigo))
CHARACTER SET latin1 COLLATE latin1_general_cs;

CREATE table estado (
est_Codigo int(4) NOT NULL auto_increment,
est_Nombre varchar(35) NOT NULL UNIQUE,
PRIMARY KEY (est_Codigo)) 
CHARACTER SET latin1 COLLATE latin1_general_cs;

CREATE table tipo (
tip_Codigo int(2) NOT NULL auto_increment,
tip_Nombre varchar(35) NOT NULL UNIQUE,
tip_Limite int(5) NOT NULL,
PRIMARY KEY (tip_Codigo))
CHARACTER SET latin1 COLLATE latin1_general_cs;

CREATE TABLE solicitud (
sol_Radicado bigint(20) NOT NULL auto_increment, 
sol_Fecha timestamp NOT NULL default current_timestamp,
	fk_mun_Codigo int(5) NOT NULL,
	fk_tip_Codigo int(2) NOT NULL,
	fk_ciu_Codigo int(4) NOT NULL,
	fk_doc_Codigo int(2) NOT NULL,
sol_Numero bigint(20) NOT NULL,
sol_Primernombre varchar(25) NOT NULL,
sol_Segundonombre varchar(25),
sol_Primerapellido varchar(20) NOT NULL,
sol_Segundoapellido varchar(20),
sol_Celular bigint(15) NOT NULL,
sol_Direccion varchar(60) NOT NULL,
sol_Correo varchar(60),
	fk_cue_Codigo int(5) NOT NULL,
	fk_gen_Codigo int(2) NOT NULL,
	fk_pro_Codigo int(5) NOT NULL,
	fk_med_Codigo int(2) NOT NULL,
sol_Asunto varchar(55),
sol_Contenido varchar(200) NOT NULL,
sol_Anexo longblob,
fk_est_Codigo int(4) NOT NULL,
Observaciones varchar(60),
key k2_mun_Codigo (fk_mun_Codigo),
foreign key k2_mun_Codigo(fk_mun_Codigo) references municipio(mun_Codigo)
on delete cascade on update cascade,
key k_tip_Codigo (fk_tip_Codigo),
foreign key k_tip_Codigo(fk_tip_Codigo) references tipo(tip_Codigo)
on delete cascade on update cascade,
key k_ciu_Codigo (fk_ciu_Codigo),
foreign key (fk_ciu_Codigo) references ciudadano(ciu_Codigo)
on delete cascade on update cascade,
key k2_cue_Codigo (fk_cue_Codigo),
foreign key k2_cue_Codigo(fk_cue_Codigo) references cuenta(cue_Codigo)
on delete cascade on update cascade,
key k2_gen_Codigo (fk_gen_Codigo),
foreign key k2_gen_Codigo(fk_gen_Codigo) references genero(gen_Codigo)
on delete cascade on update cascade,
key k2_pro_Codigo (fk_pro_Codigo),
foreign key k2_pro_Codigo(fk_pro_Codigo) references proceso(pro_Codigo)
on delete cascade on update cascade,
foreign key (fk_doc_Codigo) references documento(doc_Codigo)
on delete cascade on update cascade,
key k_est_Codigo (fk_est_Codigo),
foreign key k_est_Codigo(fk_est_Codigo) references estado (est_Codigo)
on delete cascade on update cascade,
key k_med_Codigo (fk_med_Codigo),
foreign key k_med_Codigo(fk_med_Codigo) references medio (med_Codigo)
on delete cascade on update cascade,
PRIMARY KEY (sol_Radicado))
CHARACTER SET latin1 COLLATE latin1_general_cs;

CREATE Table respuesta (
res_Id int(20) not null auto_increment,
        res_Fecha timestamp NOT NULL default current_timestamp,
	fk_sol_Radicado bigint(20) NOT NULL,
res_Asunto varchar(55) unique,
res_Contenido varchar (200) not null,
fk_est_Codigo int(4) NOT NULL,
Observaciones varchar(60),
foreign key (fk_sol_Radicado) references solicitud (sol_Radicado)
on delete cascade on update cascade,
key k_est_Codigo (fk_est_Codigo),
foreign key k_est_Codigo(fk_est_Codigo) references estado (est_Codigo)
on delete cascade on update cascade,
PRIMARY KEY (res_Id) 
)
CHARACTER SET latin1 COLLATE latin1_general_cs;

create table pregunta (
pre_Id int (10) not null auto_increment primary key,
pre_Descripcion varchar (200) not null)
CHARACTER SET latin1 COLLATE latin1_general_cs;

create table opcion(
opc_Id int (10) not null auto_increment primary key,
opc_Descripcion varchar (100) not null)
CHARACTER SET latin1 COLLATE latin1_general_cs;

create table encuesta(
enc_Id int (20) not null auto_increment primary key,
fk_est_Codigo int(4) NOT NULL,
Observaciones varchar(60),
key k_est_Codigo (fk_est_Codigo),
foreign key k_est_Codigo(fk_est_Codigo) references estado (est_Codigo)
on delete cascade on update cascade,
enc_Fecha timestamp NOT NULL default current_timestamp)
CHARACTER SET latin1 COLLATE latin1_general_cs;

create table pregunta_opcion(
fk_pre_Id int (10) not null,
fk_opc_Id int (10) not null,
key k_pre_Id (fk_pre_Id),
foreign key k_pre_Id(fk_pre_Id) references pregunta (pre_Id)
on delete cascade on update cascade,
key k_opc_Id(fk_opc_Id),
foreign key k_opc_Id(fk_opc_Id) references opcion (opc_Id)
on delete cascade on update cascade)
CHARACTER SET latin1 COLLATE latin1_general_cs;

create table encuesta_pregunta(
fk_enc_Id int (20) not null,
fk_pre_Id int (10) not null,
key k_enc_Id (fk_enc_Id),
foreign key k_enc_Id(fk_enc_Id) references encuesta (enc_Id)
on delete cascade on update cascade,
key k_pre_Id (fk_pre_Id),
foreign key k_pre_Id(fk_pre_Id) references pregunta (pre_Id)
on delete cascade on update cascade)
CHARACTER SET latin1 COLLATE latin1_general_cs;

create table satisfaccion (
fk_enc_Id int (20) not null,
fk_pre_Id int (10) not null,
fk_opc_Id int (10) not null,
key k_enc_Id (fk_enc_Id),
foreign key k_enc_Id(fk_enc_Id) references encuesta (enc_Id)
on delete cascade on update cascade,
key k_pre_Id (fk_pre_Id),
foreign key k_pre_Id(fk_pre_Id) references pregunta (pre_Id)
on delete cascade on update cascade,
key k_opc_Id(fk_opc_Id),
foreign key k_opc_Id(fk_opc_Id) references opcion (opc_Id)
on delete cascade on update cascade)
CHARACTER SET latin1 COLLATE latin1_general_cs;

create table satisfaccion_respuesta(
fk_enc_Id int (20) not null,
fk_res_Id int (10) not null,
key k_enc_Id (fk_enc_Id),
foreign key k_enc_Id(fk_enc_Id) references encuesta (enc_Id)
on delete cascade on update cascade,
key k_res_Id (fk_res_Id),
foreign key k_res_Id(fk_res_Id) references respuesta (res_Id)
on delete cascade on update cascade)
CHARACTER SET latin1 COLLATE latin1_general_cs;

create table gestion(
ges_Codigo bigint(20) NOT NULL auto_increment primary key,
fecha timestamp NOT NULL UNIQUE default current_timestamp,
fk_usu_Id bigint(20) NOT NULL,
fk_mod_Codigo int(2) NOT NULL,
formulario varchar(100) not null,
formulario_id bigint(20) not null,
key k2_usu_Id (fk_usu_Id),
foreign key k2_usu_Id(fk_usu_Id) references usuario(usu_Id)
on delete cascade on update cascade,
key k2_mod_Codigo (fk_mod_Codigo),
foreign key k2_mod_Codigo(fk_mod_Codigo) references modulo(mod_Codigo)
on delete cascade on update cascade
)
CHARACTER SET latin1 COLLATE latin1_general_cs;
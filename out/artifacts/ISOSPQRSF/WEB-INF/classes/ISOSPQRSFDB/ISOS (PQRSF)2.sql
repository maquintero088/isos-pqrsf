
INSERT INTO proceso (pro_Nombre) VALUES
      ('Articulación Regional'),
      ('Administración Educativa'),
      ('Comunicaciones'),
      ('Competencias para las Cualificaciones'),
      ('Direccionamiento Estratégico'),
      ('Gestión Documental'),
      ('Emprendimiento y Empresarismo'),
      ('Evaluación y Control'),
      ('Empleo,Orientación Ocupacional y Empleabilidad'),
      ('Formacion Profesional Integral'),
      ('Infraestructura y Logística'),
      ('Innovacion y Competitividad'),	
      ('Jurídica'),
      ('Recursos Financieros'),	
      ('Relacionamiento Empresarial y Gestión del Cliente'),
      ('Talento Humano'),
      ('Tecnologías de la Información');
SELECT * FROM proceso ORDER BY pro_Codigo;
INSERT INTO municipio (mun_Nombre) VALUES 
	('Arbelaéz'),
	('Cabrera'),
	('Cáqueza'),
	('Chipaque'),
	('Choachí'),
	('Fómeque'),
	('Fosca'),
	('Fusagasugá'),
	('Guayabetal'),	
	('Gutierrez'),
	('Medina'),
	('Pandi'),
	('Paratebueno'),
	('Pasca'),	
	('Quetame'),
	('San Bernardo'),
	('Silvania'),
	('Tibacuy'),
	('Ubaque'),
	('Une'),
	('Venecia');
	
SELECT * FROM municipio ORDER BY mun_Codigo;
INSERT INTO documento (doc_Nombre) VALUES 
	('Cédula de Ciudadanía'),
	('Cédula de Extrangería'),
        ('Nit'),
	('Pasaporte'),
	('Registro Civil'),	
	('Tarjeta de Identidad');
SELECT * FROM documento ORDER BY doc_Codigo;
INSERT INTO genero (gen_Nombre) VALUES ('Femenino'),
                                       ('Masculino'),									   
                                       ('No Especifica');
SELECT * FROM genero ORDER BY gen_Codigo;
INSERT INTO cuenta (cue_Nombre,cue_Dominio) VALUES 
	('hotmail','com'),
	('hotmail','es'),
	('live','com'),
	('outlook','com'),
	('outlook','es'),
	('gmail','com'),
	('gmail','es'),
	('yahoo','com'),
	('yahoo','es'),
    ('misena.edu','co'),
    ('sena.edu','co');
SELECT * FROM cuenta ORDER BY cue_Codigo;
INSERT INTO ciudadano (ciu_Nombre) VALUES ('Adulto Mayor'),
                                          ('Aprendiz SENA'),
					  ('Ciudadano'),
					  ('Comunidad Internacional'),
        				  ('Empresa'),
                                          ('Entidad del Estado y/o Autoridades'),
					  ('Instructor'),
					  ('Menor de Edad (No aprendiz)'),
                                          ('Persona con Dicapacidad'),
					  ('Persona en situación de desplazamiento'),
                                          ('Servidor Publico'); 
SELECT * FROM ciudadano ORDER BY ciu_Codigo;
INSERT INTO tipo (tip_Nombre,tip_Limite) VALUES ('Petición',10),
						 ('Queja',10),
                                                 ('Reclamo',10),
                                                 ('Sugerencia',8),
                                                 ('Felicitación',3);
SELECT * FROM tipo ORDER BY tip_Codigo;
INSERT INTO medio (med_Nombre) VALUES ('Físico'),('Correo'),('Web');
SELECT * FROM tipo;
INSERT INTO rol (rol_Nombre) VALUES ('Colaborador'),('Gestor'),('Responsable'),('Subdirector');
SELECT * FROM rol ORDER BY rol_Codigo;
INSERT INTO usuario (usu_Id,fk_doc_Codigo,usu_Contrasena,usu_Primernombre,usu_Segundonombre,
                    usu_Primerapellido,usu_Segundoapellido,fk_gen_Codigo,usu_Celular,usu_Correo,fk_mun_Codigo,fk_pro_Codigo,fk_rol_Codigo) 
                    VALUES (1069750223,1,AES_ENCRYPT('76229466','1234'),'Marcel','','Quintero','Carrillo',1,3215072086,'maquintero088@misena.edu.co',8,15,2);
INSERT INTO usuario (usu_Id,fk_doc_Codigo,usu_Contrasena,usu_Primernombre,usu_Segundonombre,usu_Primerapellido,usu_Segundoapellido,
                    fk_gen_Codigo,usu_Celular,usu_Correo,fk_mun_Codigo,fk_pro_Codigo,fk_rol_Codigo) 
                    VALUES (1024549815,1,AES_ENCRYPT('981516','1234'),'Marlene','','Pinzon','Herrera',1,3138676578,'mapinzon@misena.edu.co',8,5,4);
SELECT * FROM usuario ORDER BY usu_Id;
INSERT INTO modulo (mod_Nombre) VALUES ('Usuarios'),('Solicitudes'),('Respuestas'),('Informes'),('Sesion');
SELECT * FROM modulo ORDER BY mod_Codigo;
INSERT INTO privilegios VALUES (1,1,0,0,0,1),(1,2,0,1,1,1),(1,3,0,0,0,1),(1,4,1,1,0,1),
                               (2,1,1,1,1,1),(2,2,0,0,0,1),(2,3,1,1,0,1),(2,4,1,1,0,1)
			       ,(3,2,0,0,0,1),(3,3,1,1,0,1),(3,4,1,1,0,0),
                               (4,1,0,1,0,1),(4,2,0,0,1,1),(4,3,1,1,1,1),(4,4,1,1,1,1) ;
SELECT * FROM privilegios ORDER BY fk_rol_Codigo;
INSERT INTO estado (est_Nombre) VALUES ('Por Aprobar'),('No Aprobado'),('Por Contestar'),('Corregir'),('Archivado'),('Respuesta Generada'),('Activo'),('Inactivo');
SELECT * FROM estado ORDER BY est_Codigo;
INSERT INTO solicitud (fk_mun_Codigo,fk_tip_Codigo,fk_ciu_Codigo,fk_doc_Codigo
                        ,sol_Numero,sol_Primernombre,sol_Segundonombre,sol_Primerapellido,sol_Segundoapellido
                        ,sol_Celular,sol_Direccion,sol_Correo,fk_cue_Codigo,fk_gen_Codigo,fk_pro_Codigo,fk_med_Codigo,sol_Asunto,sol_Contenido,fk_est_Codigo)
                         VALUES 
(8,5,3,1,1069750223,'no aplica','no aplica','no aplica','no aplica',3215972086,'no aplica','maquintero088'
,10,3,15,3,'FELICITACIONES','esta es la primera solicitud de ISOS PQRSF',6);
INSERT INTO solicitud (fk_mun_Codigo,fk_tip_Codigo,fk_ciu_Codigo,fk_doc_Codigo
                        ,sol_Numero,sol_Primernombre,sol_Segundonombre,sol_Primerapellido,sol_Segundoapellido
                        ,sol_Celular,sol_Direccion,sol_Correo,fk_cue_Codigo,fk_gen_Codigo,fk_pro_Codigo,fk_med_Codigo,sol_Asunto,sol_Contenido,fk_est_Codigo)
                         VALUES 
(8,4,4,1,0,'no aplica','no aplica','no aplica','no aplica',0,'no aplica','no aplica',10,3,15,3,'Sin asunto',
'Requiero de más información acerca del uso de esta aplicación',1);
SELECT * FROM solicitud ORDER BY sol_Radicado;
INSERT INTO respuesta (fk_sol_Radicado,res_Asunto,res_Contenido,fk_est_Codigo) VALUES (1,'FELICITACIONES','esta es la primera respuesta de ISOS PQRSF',6);
SELECT * FROM respuesta ORDER BY res_Id;
INSERT INTO encuesta (enc_Id,fk_est_Codigo) VALUES (1,7);
SELECT * FROM encuesta ORDER BY enc_Id;
INSERT INTO pregunta (pre_Descripcion) VALUES 
                ('Con qué frecuencia usted usa nuestro servicio'),
                ('Te gustaría utilizar nuestro servicio en el futuro'),
                ('Cuál es su grado de satisfacción con nuestro servicio'),
                ('Cómo valora la facilidad de uso del servicio ofrecido por nuestro sistema'),
                ('Cómo valora la facilidad de uso del sistema/servicio ofrecido por nuestro Sena'),
                ('Cómo le pareció la atención a las solicitudes del sistema PQRSF'),
                ('Cómo valora el rendimiento del sistema frente en el proceso de respuesta a su solicitud'),
                ('le da respuesta correctamente a su Solicitud realizada'),
                ('Cómo valora la usted la atención de PQRSF');
SELECT * FROM pregunta ORDER BY pre_Id;
INSERT INTO opcion (opc_Descripcion) VALUES 
                ('Algo mejor.'),
                ('Algo peor.'), 
                ('Bien.'),
                ('Completamente insatisfecho.'),
                ('Completamente satisfecho.'),
                ('Insatisfecho.'),
                ('Mal.'),
                ('Más de una vez al mes.'),
                ('Más o menos igual.'),
                ('Mucho mejor.'),
                ('Mucho peor.'), 
                ('Muy bien.'),
                ('No aplicable.'),
                ('No estoy seguro.'),
                ('No lo se.'),
                ('Nunca.'),
                ('Probablemente no.'),
                ('Probablemente sí.'),
                ('Regular.'),
                ('Satisfecho.'),
                ('Seguro que no.'),
                ('Seguro que sí.'),
                ('Una o más veces a la semana.'),
                ('Una vez al mes.');                
SELECT * FROM opcion ORDER BY opc_Id;
INSERT INTO encuesta_pregunta  VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9);
SELECT * FROM encuesta_pregunta ORDER BY fk_pre_Id;
INSERT INTO pregunta_opcion  VALUES 
                (1,16),(1,23),(1,24),(1,8),(1,18),
                (2,21),(2,17),(2,14),(2,22),(2,18),
                (3,5),(3,20),(3,6),(3,4),(3,13),
                (4,10),(4,1),(4,9),(4,2),(4,11),
                (5,10),(5,1),(5,9),(5,2),(5,11),
                (6,10),(6,12),(6,9),(6,2),(6,15),
                (7,3),(7,12),(7,19),(7,7),(7,15),
                (8,16),(8,23),(8,24),(8,8),(8,18),
                (9,16),(9,23),(9,24),(9,8),(9,18);
SELECT * FROM pregunta_opcion ORDER BY fk_pre_Id;
INSERT INTO satisfaccion VALUES (1,2,3);
SELECT * FROM satisfaccion ORDER BY fk_enc_Id;
SELECT * FROM satisfaccion_respuesta ORDER BY fk_enc_Id;
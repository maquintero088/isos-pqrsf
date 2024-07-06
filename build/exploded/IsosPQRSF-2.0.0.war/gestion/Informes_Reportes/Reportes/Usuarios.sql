SELECT
     usuario.`usu_Id` AS usuario_usu_Id,
     usuario.`usu_Primernombre` AS usuario_usu_Primernombre,
     usuario.`usu_Segundonombre` AS usuario_usu_Segundonombre,
     usuario.`usu_Primerapellido` AS usuario_usu_Primerapellido,
     usuario.`usu_Segundoapellido` AS usuario_usu_Segundoapellido,
     usuario.`usu_Fechaingreso` AS usuario_usu_Fechaingreso,
     usuario.`usu_Correo` AS usuario_usu_Correo,
     usuario.`usu_Celular` AS usuario_usu_Celular,
     documento.`doc_Nombre` AS documento_doc_Nombre,
     genero.`gen_Nombre` AS genero_gen_Nombre,
     proceso.`pro_Nombre` AS proceso_pro_Nombre,
     municipio.`mun_Nombre` AS municipio_mun_Nombre,
     rol.`rol_nombre` AS rol_rol_nombre
FROM
     `documento` documento RIGHT OUTER JOIN `usuario` usuario ON documento.`doc_Codigo` = usuario.`fk_doc_Codigo`
     LEFT OUTER JOIN `genero` genero ON usuario.`fk_gen_Codigo` = genero.`gen_Codigo`
     LEFT OUTER JOIN `proceso` proceso ON usuario.`fk_pro_Codigo` = proceso.`pro_Codigo`
     LEFT OUTER JOIN `municipio` municipio ON usuario.`fk_mun_Codigo` = municipio.`mun_Codigo`
     LEFT OUTER JOIN `rol` rol ON usuario.`fk_rol_Codigo` = rol.`rol_Codigo`
<%--  
    Document   : S_Solicitud
    Created on : 8/05/2014, 07:07:37 PM
    Author     : Márcel
--%>


<%@page import="ISOSPQRSFDB.Consultas"%>
<%@page import="Gestion.Gestion"%>
<%@page import="GestionUsuarios.rol"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../../IMAGES/logo.png" type="image/x-icon" rel="shortcut icon" />
        <title>Enviando Rol...</title>
        <style>
            @import "../../../CSS/css.css";
        </style>
    </head>
    <body>
<% 
            rol Rol=new rol(); 
            Consultas consultas = new Consultas(); 
            Rol.Rol=consultas.valores("rol", "max(rol_Codigo)", "max(rol_Codigo)");
            Gestion gestion= new Gestion();             
                if(request.getParameter("update")==null){  
                    if(consultas.valores("rol","rol_Codigo","rol_Nombre", request.getParameter("Nombre"))==null){ 
                        Rol.Rol(request.getParameter("Nombre"));                     
                        String validacion = gestion.seguimiento(gestion.seguimiento(),1,"Nuevo Rol",""+(Rol.Rol[0]+1));      
                    if(validacion == null){
                        %>    
                        <form action="F_Rol.jsp" method="post">                    
                            <input type="submit" class="op1"  value="ERROR" />     
                        </form>   
                        <%
                    }else{                        
                        String[]
                                USUARIOS = {
                                    request.getParameter("crear-USUARIOS"),
                                    request.getParameter("actualizar-USUARIOS"),
                                    request.getParameter("estado-USUARIOS"),
                                    request.getParameter("consultar-USUARIOS")
                                },SOLICITUDES = {
                                    request.getParameter("crear-SOLICITUDES"),
                                    request.getParameter("actualizar-SOLICITUDES"),
                                    request.getParameter("estado-SOLICITUDES"),
                                    request.getParameter("consultar-SOLICITUDES")
                                },RESPUESTAS = {
                                    request.getParameter("crear-RESPUESTAS"),
                                    request.getParameter("actualizar-RESPUESTAS"),
                                    request.getParameter("estado-RESPUESTAS"),
                                    request.getParameter("consultar-RESPUESTAS")
                                },INFORMES = {
                                    request.getParameter("crear-INFORMES"),
                                    request.getParameter("actualizar-INFORMES"),
                                    request.getParameter("estado-INFORMES"),
                                    request.getParameter("consultar-INFORMES")
                                }; 
                        
                        Rol.Privilegios(1, (Integer.parseInt(Rol.Rol[0])+1) , USUARIOS); 
                        Rol.Privilegios(2, (Integer.parseInt(Rol.Rol[0])+1) , SOLICITUDES); 
                        Rol.Privilegios(3, (Integer.parseInt(Rol.Rol[0])+1) , RESPUESTAS); 
                        Rol.Privilegios(4, (Integer.parseInt(Rol.Rol[0])+1) , INFORMES); 
                        
                        %>
                        <form action="Rol.jsp" method="post">
                            <center>           
                                <table class="fondo" style="margin-top: 100px">      
                                    <tr>
                                        <td> 
                                            ROL CREADO CON EXITO A LA FECHA:  
                                            <h3><%= validacion%> </h3>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="submit" class="op1"  value="Aceptar" /> 
                                        </td>
                                    </tr>
                                </table> 
                            </center>
                        </form>        
                                            <%}
                    }else{ %>
            <form action="Rol.jsp" method="post">                    
                <input type="submit" class="op1"  value="El Usuario ya existe." />     
            </form>   
            <%}    
                }else{ 
                    int rol_Codigo=Integer.parseInt(request.getParameter("update"));
                    
                    Rol.update(rol_Codigo, request.getParameter("Nombre")); 
                    
                    Rol.privilegios(1, rol_Codigo , "Crear", request.getParameter("crear-USUARIOS"));
                    Rol.privilegios(2, rol_Codigo , "Crear", request.getParameter("crear-SOLICITUDES"));                    
                    Rol.privilegios(3, rol_Codigo , "Crear", request.getParameter("crear-RESPUESTAS"));
                    Rol.privilegios(4, rol_Codigo , "Crear", request.getParameter("crear-INFORMES"));                    
                    
                    Rol.privilegios(1, rol_Codigo , "Actualizar", request.getParameter("actualizar-USUARIOS"));
                    Rol.privilegios(2, rol_Codigo , "Actualizar", request.getParameter("actualizar-SOLICITUDES"));                    
                    Rol.privilegios(3, rol_Codigo , "Actualizar", request.getParameter("actualizar-RESPUESTAS"));
                    Rol.privilegios(4, rol_Codigo , "Actualizar", request.getParameter("actualizar-INFORMES"));
                    
                    Rol.privilegios(1, rol_Codigo , "Estado", request.getParameter("estado-USUARIOS"));
                    Rol.privilegios(2, rol_Codigo , "Estado", request.getParameter("estado-SOLICITUDES"));                    
                    Rol.privilegios(3, rol_Codigo , "Estado", request.getParameter("estado-RESPUESTAS"));
                    Rol.privilegios(4, rol_Codigo , "Estado", request.getParameter("estado-INFORMES"));
                    
                    
                    Rol.privilegios(1, rol_Codigo , "Consultar", request.getParameter("consultar-USUARIOS"));
                    Rol.privilegios(2, rol_Codigo , "Consultar", request.getParameter("consultar-SOLICITUDES"));                    
                    Rol.privilegios(3, rol_Codigo , "Consultar", request.getParameter("consultar-RESPUESTAS"));
                    Rol.privilegios(4, rol_Codigo , "Consultar", request.getParameter("consultar-INFORMES"));
                    
                    String validacion = gestion.seguimiento(gestion.seguimiento(),1,"Editar Rol",request.getParameter("update"));     
                    if(validacion == null){
                        %>    
                        <form action="F_Rol.jsp" method="post">                    
                            <input type="submit" class="op1"  value="Error" />     
                        </form>   
                        <%
                    }else{
                        %>
                        <form action="Rol.jsp" method="post">
                            <center>
                                <table class="fondo" style="margin-top: 100px">
                                    <tr>
                                        <td> 
                                            USUARIO ACTUALIZADO CON EXITO A LA FECHA:  
                                            <h3><%= validacion%> </h3>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="submit" class="op1"  value="Aceptar" /> 
                                        </td>
                                    </tr>
                                </table> 
                            </center>
                        </form>
                                            <% 
                    }
                }  
                    
            %>            
                                                            
    </body>
</html>

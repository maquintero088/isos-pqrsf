

<%@page import="ISOSPQRSFDB.Consultas"%>
<%-- 
    Document   : import_usuario
    Created on : 11/04/2014, 01:51:06 PM
    Author     : Márcel
--%>
<%@page import="Gestion.Gestion"%>
<%@page import="GestionUsuarios.usuario" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <link href="../../../IMAGES/logo.png" type="image/x-icon" rel="shortcut icon" /> 
        <title>Creando Usuario...</title>
        <style>
            @import "../../../CSS/css.css";
        </style>
    </head>
    <body>
        <% 
            usuario Usuario=new usuario();
            Consultas consultas = new Consultas(); 
            Gestion gestion= new Gestion();             
                if(request.getParameter("update")==null){  
                    if(consultas.valores("usuario","usu_Id","usu_Id", request.getParameter("id"))==null){ 
                    Usuario.Usuario(   
                            Integer.parseInt(request.getParameter("documento")),
                            request.getParameter("id"), 
                            request.getParameter("password"),
                            request.getParameter("nombre1"), 
                            request.getParameter("nombre2"), 
                            request.getParameter("apellido1"), 
                            request.getParameter("apellido2"),                   
                            request.getParameter("celular"),
                            request.getParameter("correo")+"@"+request.getParameter("cuenta"),
                            Integer.parseInt(request.getParameter("genero")),                    
                            Integer.parseInt(request.getParameter("municipio")),
                            Integer.parseInt(request.getParameter("proceso")),            
                            Integer.parseInt(request.getParameter("rol"))                
                    );  
                    String validacion = gestion.seguimiento(gestion.seguimiento(),1,"Nuevo Usuario",request.getParameter("id"));     
                    if(validacion == null){
                        %>    
                        <form action="F_Usuario.jsp" method="post">                    
                            <input type="submit" class="op1"  value="ERROR" />     
                        </form>   
                        <%
                    }else{
                        %>
                        <form action="Usuario.jsp" method="post">
                            <center>           
                                <table class="fondo" style="margin-top: 100px">      
                                    <tr>
                                        <td> 
                                            USUARIO CREADO CON EXITO A LA FECHA:  
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
            <form action="Usuario.jsp" method="post">                    
                <input type="submit" class="op1"  value="El Usuario ya existe." />     
            </form>   
            <%}    
                }else{        
                    Usuario.update(  
                            request.getParameter("update"),
                            Integer.parseInt(request.getParameter("documento")),
                            request.getParameter("id"), 
                            request.getParameter("nombre1"), 
                            request.getParameter("nombre2"), 
                            request.getParameter("apellido1"), 
                            request.getParameter("apellido2"),                   
                            request.getParameter("celular"),
                            request.getParameter("correo"),
                            Integer.parseInt(request.getParameter("genero")),
                            Integer.parseInt(request.getParameter("municipio")),
                            Integer.parseInt(request.getParameter("proceso"))
                    );                   
                    String validacion = gestion.seguimiento(gestion.seguimiento(),1,"Editar Usuario",request.getParameter("update"));     
                    if(validacion == null){
                        %>    
                        <form action="F_Usuario.jsp" method="post">                    
                            <input type="submit" class="op1"  value="Error" />     
                        </form>   
                        <%
                    }else{
                        %>
                        <form action="Usuario.jsp" method="post">
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

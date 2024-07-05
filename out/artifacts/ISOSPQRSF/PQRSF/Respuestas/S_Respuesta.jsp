<%--  
    Document   : S_Solicitud
    Created on : 8/05/2014, 07:07:37 PM
    Author     : Márcel
--%>

<%@page import="Gestion.Gestion"%>
<%@page import="GestionRespuestas.respuesta"%>
<%@page import="Gestion.SMTP"%>
<%@page import="ISOSPQRSFDB.Consultas"%> 
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../IMAGES/logo.png" type="image/x-icon" rel="shortcut icon" />
        <title>Enviando Solicitud...</title>
        <style>
            @import "../../CSS/css.css";
        </style>
    </head>
    <body>
        
        <% 
            respuesta Respuesta=new respuesta();
            Consultas consultas = new Consultas(); 
            Gestion gestion= new Gestion();       
            
        String Radicado=request.getParameter("Radicado"); 
        respuesta.res_Id=consultas.valores("respuesta", "max(res_Id)", "max(res_Id)");
        
                if(request.getParameter("update")==null){  
                    if(consultas.valores("gestion","fk_usu_Id","fk_mod_Codigo","3"
                            + " and formulario = 'Nueva Respuesta' "
                            + "and formulario_id = "+consultas.valores("respuesta", "res_Id", "fk_sol_Radicado", Radicado))==null){ 
                        Respuesta.respuesta(Integer.parseInt(Radicado), request.getParameter("Asunto"), request.getParameter("Contenido"));                    
                        
                    String validacion = gestion.seguimiento(gestion.seguimiento(),3,"Nueva Respuesta",""+(Integer.parseInt(respuesta.res_Id[0])+1));     
                    if(validacion == null){
                        %>    
                        <form action="F_Respuesta.jsp" method="post">                    
                            <input type="submit" class="op1"  value="ERROR" />     
                        </form>   
                        <%
                    }else{
                        %>
                        <form action="../../Gestion/Alertas.jsp" method="post">
                            <center>           
                                <table class="fondo" style="margin-top: 100px">      
                                    <tr>
                                        <td> 
                                           LA RESPUESTA HA SIDO CREADA CON EXITO A LA FECHA:  
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
            <form action="../../Gestion/Alertas.jsp" method="post">    
                <p>La Solicitud ya ha sido atentida por otra dependencia.</p>
                <input type="submit" class="op1"  value="Aceptar" />     
            </form>   
            <%}    
                }else{        
                    Respuesta.update(request.getParameter("update"), request.getParameter("Asunto"), request.getParameter("Contenido"));
                    String validacion = gestion.seguimiento(gestion.seguimiento(),3,"Corregir Respuesta",request.getParameter("update"));     
                    if(validacion == null){
                        %>    
                        <form action="F_Respuesta.jsp" method="post">                    
                            <input type="submit" class="op1"  value="Error" />     
                        </form>   
                        <%
                    }else{
                        %>
                        <form action="../../Gestion/Alertas.jsp" method="post">
                            <center>
                                <table class="fondo" style="margin-top: 100px">
                                    <tr>
                                        <td> 
                                            LA RESPUESTA HA SIDO CORREGIDA CON EXITO A LA FECHA:  
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

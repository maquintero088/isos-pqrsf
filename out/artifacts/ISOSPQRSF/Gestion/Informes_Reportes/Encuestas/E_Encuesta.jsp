<%-- 
    Document   : B_solicitud
    Created on : 24/05/2014, 02:08:32 PM
    Author     : Márcel
--%>

<%@page import="Gestion.Gestion"%>
<%@page import="ISOSPQRSFDB.Consultas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">              
        <link href="../../../IMAGES/logo.png" type="image/x-icon" rel="shortcut icon" />
        <title>Consulte su PQRSF</title>
        <style>
            @import "../../../CSS/css.css";
        </style>
    </head>
    <body>
        <%  
            Consultas consultas = new Consultas();            
            Gestion gestion= new Gestion();       
        %>
        <div class="usuarios">
            <header style="float: none ">
                <img src="../../../IMAGES/isospqrsf.png" width="100" onClick="document.location = 'index.html'" align="center" alt="LOGO"/>         
            </header>
            <table>             
            <tr> 
                <%if(gestion.privilegio(1, gestion.seguimiento(), "Crear")==1){%>
                <td class="sub3"  onclick="document.location='F_Usuario.jsp'">
                    <h3 >NUEVO USUARIO</h3>
                </td>
                <%}%>
                <%if(gestion.privilegio(1, gestion.seguimiento(), "Consultar")==1){%>
                <td  class="sub3" onclick="document.location='B_Usuario.jsp'">
                    <h3>MIS USUARIOS</h3>
                </td>
                <%}%>
            </tr>   
            </table>
        </div> 
        <section>
            <table class="usuarios">
                <tr>
                    <td>
                        <%
                        
                        %>
                        <table class="blanco2">
                            <tr>
                                <td colspan="2">
                                    
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="radio" name="Estado" value="1" checked="" />
                                </td>
                                <td>
                                    <input type="radio" name="Estado" value="1" checked="checked" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>                
            </table>
        </section>
    </body>
</html>

<%-- 
    Document   : f_Encuesta
    Created on : 7/05/2014, 04:49:40 PM
    Author     : ADMIN
--%>

<%@page import="Gestion.Gestion"%>
<%@page import="ISOSPQRSFDB.Consultas"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ficha de Encuesta</title>
        <style>
                 @import "../../../CSS/css.css";
        </style>
    </head>
    <body>
    <center>
        <%  
            Consultas consultas = new Consultas();            
            Gestion gestion= new Gestion();      
        %>        
        <div class="informes">
                        <header style="float: none ">
                            <img src="../../../IMAGES/isospqrsf.png" width="100" onClick="document.location = 'index.html'" align="center" alt="LOGO"/>                             
                        </header>
            <table>             
                <tr>
                    <td class="sub2" onClick="document.location = '../Gestion.jsp'">
                        <img src="../../../IMAGES/atras.png" width="30" title="Volver a Gestión"  alt="atras"/>
                    </td> 
                    <%if(gestion.privilegio(4, gestion.seguimiento(), "Crear")==1){%>
                    <td class="sub3"  onclick="document.location='F_Encuesta.jsp'">
                        <h3>NUEVA ENCUESTA</h3>
                    </td>
                    <%}%>
                    <%if(gestion.privilegio(4, gestion.seguimiento(), "Consultar")==1){%>
                    <td  class="sub3" onclick="document.location='B_Encuesta.jsp'">
                        <h3>MIS ENCUESTAS</h3>
                    </td>
                    <%}%>
                </tr>   
            </table>
        </div>          
    </center>        
    </body>
</html>

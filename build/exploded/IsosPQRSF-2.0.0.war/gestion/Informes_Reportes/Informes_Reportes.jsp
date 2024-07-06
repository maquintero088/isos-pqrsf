<%-- 
    Document   : menu_informes
    Created on : 19/05/2014, 03:00:36 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestion de Informes y Reportes</title>
         <link href="../../images/logo.png" type="image/x-icon" rel="shortcut icon" />  
        <style>
            @import "../../css/css.css";
        </style>
    </head>
    <body>
        <%
                if(request.getParameter("validacion")==null){%>
                <center>
                    <table class="fondo" style="margin-top: 200px">
                        <tr>
                            <td>
                                <img src="http://biblioteca2.uc3m.es/Leganes/sinlugaradudas/wp-content/uploads/2012/10/Error-s%C3%ADmbolo.png" width="50">                            
                            </td>
                            <td>
                                <h3>Por favor Inicie Sesión</h3>
                                <input type="button" class="op1" style="width: 100px" value="aceptar" onclick="document.location='../../sesion/F_Sesion.jsp'">
                            </td>                        
                        </tr>
                    </table>
                </center>   
                <%}else{
                %>
    <center>
        <table class="informes"> 
                <tr>
                    <td>
                            <img src="../../images/isospqrsf.png" width="115" onClick="document.location = 'index.html'" align="center" alt="LOGO"/>                            
                            <table class="fondo">
                                <tr>           
                                    <td>
                                        <hr class="informes">
                                    </td>
                                </tr>
                                <tr>           
                                    <td>
                                        <form action="Informes/Informe.jsp" method="post">
                                            <input type="hidden" name="validacion" id="validacion" value="<%=request.getParameter("password")%>">
                                            <input type="submit" class="op1" value="INFORMES" />  
                                        </form>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <form action="Reportes/Reporte.jsp" method="post">
                                            <input type="hidden" name="validacion" id="validacion" value="<%=request.getParameter("password")%>">  
                                            <input type="submit" class="op1" value="REPORTES" />  
                                        </form>
                                    </td>
                                </tr>                               
                                <tr>
                                    <td>
                                        <form action="Encuestas/Encuesta.jsp" method="post">
                                            <input type="hidden" name="validacion" id="validacion" value="<%=request.getParameter("password")%>">  
                                            <input type="submit" class="op1" value="ENCUESTAS" />  
                                        </form>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                <center> 
                                    <table>
                                        <tr>
                                            <td>
                                                <form action="../Gestion.jsp" method="post">
                                                    <input type="hidden" name="validacion" id="validacion" value="<%=request.getParameter("password")%>">
                                                    <input type="submit" class="sub2" value="Volver" />  
                                                </form>                                        
                                            </td>
                                        </tr>
                                    </table>
                        </center>
                    </td>
                </tr>
            </table>
                    </td>
                </tr>  
        </table>  
    </center>
            <%}%>
    </body>
</html>

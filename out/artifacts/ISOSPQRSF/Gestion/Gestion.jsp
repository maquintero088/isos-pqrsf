<%--  
    Document   : Gestion
    Created on : 2/05/2014, 02:47:16 AM
    Author     : Márcel
--%>
<%@page import="ISOSPQRSFDB.Consultas"%>
<%@page import="Gestion.Gestion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../IMAGES/logo.png" type="image/x-icon" rel="shortcut icon" />        
        <title>ISOS PQRSF - Gestión</title>
        <style>
            @import "../CSS/css.css";
        </style>
    </head>      
        <body style='padding-left: 60px;  padding-right: 50px;'>           
            <%Consultas consultas = new Consultas();
                if(request.getParameter("validacion")==null){%>
                <center>
                    <table class="fondo" style="margin-top: 200px">
                        <tr>
                            <td>
                                <img src="http://biblioteca2.uc3m.es/Leganes/sinlugaradudas/wp-content/uploads/2012/10/Error-s%C3%ADmbolo.png" width="50">                            
                            </td>
                            <td>
                                <h3>Por favor Inicie Sesión</h3>
                                <input type="button" class="op1" style="width: 100px" value="aceptar" onclick="document.location='../Sesion/F_Sesion.jsp'">
                            </td>                        
                        </tr>
                    </table>
                </center>   
                <%}else{
                %>
                <div>
                    <center>
                    <table> 
                    <tr>
                        <td style="width: 120px;" class="isos">
                            <img src="../IMAGES/isospqrsf.png" width="80"  align="center" alt="LOGO"> 
                        </td>
                        <td>
                            <table  style="width: 1000px;" class="fondo">
                                <tr>
                                    <td>
                                        <% Gestion gestion=new Gestion();%> 
                                        <h3><%= gestion.usuario(gestion.seguimiento()) %></h3>
                                    </td>
                                    <td class="usuarios">            
                                        <% if (gestion.modulo(gestion.seguimiento(),1)==1) {
                                            %>
                                        <form action="Usuarios_Roles/Usuarios_Roles.jsp" method="post">
                                            <input type="hidden" name="validacion" id="validacion" value="<%=request.getParameter("password")%>">
                                            <input type="submit" class="sub3"  value="USUARIOS/ROLES" />
                                        </form>  
                                        <%
                                        }else{
                                        %>
                                        USUARIOS/ROLES
                                        <%  
                                        }                                       
                                        %>                                        
                                    </td>
                                    <td class="informes">
                                        <% if (gestion.modulo(gestion.seguimiento(),4)==1) {
                                            %>
                                        <form action="../Gestion/Informes_Reportes/Informes_Reportes.jsp" method="post">
                                            <input type="hidden" name="validacion" id="validacion" value="<%=request.getParameter("password")%>">
                                            <input type="submit" class="sub3"  value="INFORMES/REPORTES" />
                                        </form>   
                                        <%
                                        }else{
                                        %>
                                         INFORMES/REPORTES
                                        <%  
                                        }                                       
                                        %>       
                                    </td>
                                    <td>
                                        <form action="../index.html" method="post">
                                            <input type="submit" class="sub2" value="Cerrar Sesión" onclick="<%gestion.seguimiento(gestion.seguimiento(), 5, "Salir", gestion.seguimiento());%>" />
                                        </form>     
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>   
                </center>                   
            </div>
                                            <div>
                                                 <object width="1200" height="650" data="http://localhost:8084/ISOS_PQRSF/Gestion/Alertas.jsp"> </object>
                                            </div>                                
        <footer>  
        </footer> 
            <%
            }%>
    </body>   
</html>

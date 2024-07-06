<%-- 
    Document   : Usuario
    Created on : 16/05/2014, 03:14:31 PM
    Author     : USUARIO
--%>

<%@page import="Gestion.Gestion"%>
<%@page import="ISOSPQRSFDB.Consultas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">          
        <link href="../../../images/logo.png" type="image/x-icon" rel="shortcut icon" />
        <title>Usuarios</title>
        <style>
            @import "../../../css/css.css";
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
                                <input type="button" class="op1" style="width: 100px" value="aceptar" onclick="document.location='../../../sesion/F_Sesion.jsp'">
                            </td>                        
                        </tr>
                    </table>
                </center>   
                <%}else{
                %>
        <center>
            <%            
            Gestion gestion= new Gestion();      
        %>
        <div class="usuarios">
                        <header style="float: none ">
                            <img src="../../../images/isospqrsf.png" width="100" onClick="document.location = 'index.html'" align="center" alt="LOGO"/>                             
                        </header>
            <table>             
                <tr>
                    <td class="sub2" onClick="document.location = '../../../sesion/F_Sesion.jsp'">
                        <img src="../../../images/atras.png" width="30" title="Volver a la Pagina Principal"  alt="atras"/>
                    </td> 
                    <%if(gestion.privilegio(1, gestion.seguimiento(), "Crear")==1){%>
                    <td>
                    <form action="F_Usuario.jsp" method="post">
                        <input type="hidden" name="validacion" id="validacion" value="<%=request.getParameter("password")%>">
                        <input type="submit" class="sub3" value="NUEVO USUARIO" />  
                    </form>
                </td>
                    <%}%>
                    <%if(gestion.privilegio(1, gestion.seguimiento(), "Consultar")==1){%>
                    <td>
                    <form action="B_Usuario.jsp" method="post">
                        <input type="hidden" name="validacion" id="validacion" value="<%=request.getParameter("password")%>">
                        <input type="submit" class="sub3" value="MIS USUARIOS" />  
                    </form>
                </td>
                    <%}%>
                </tr>   
            </table>
        </div>                         
    </center>   
                 <%}%>
    </body>
</html>

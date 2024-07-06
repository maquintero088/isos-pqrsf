<%-- 
    Document   : S_Sesion
    Created on : 5/05/2014, 10:54:08 AM
    Author     : USUARIO
--%>
<%@page import="com.qcmarcel.IsosPQRSF.Gestion.Gestion"%>
<%@page import="com.qcmarcel.IsosPQRSF.Sesion.login"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <link href="../images/fondo1.png" type="image/x-icon" rel="shortcut icon" />
        <title>Entrando ...</title>
        <style>
            @import "../css/css.css";
        </style>
    </head>
    <body>
    <center> 
        <%       
            login presentacionnegocio= new login();
            int validacion=presentacionnegocio.negocio(
                    request.getParameter("id"),
                    request.getParameter("password")
            );            
            if (validacion==1) {                     
                Gestion gestion=new Gestion();
                gestion.seguimiento(request.getParameter("id"), 5, "Acceder", request.getParameter("id"));
                %>
                <table class="fondo" style="margin-top: 300px">
                    <tr>
                        <td>
                           <form action="../gestion/Gestion.jsp" method="post">
                               <input type="hidden" name="validacion" id="validacion" value="<%=request.getParameter("password")%>">
                               <input type="submit" class="sub3" value="Bienvenido">
                           </form>  
                        </td>
                    </tr>
                </table>                                   
                                                                    <%
            }else{
                %> <script type="text/javascript">                               
                    alert("Incorrecto");   
                    document.location='F_Sesion.jsp'; 
                                     </script>         
                                                                    <% 
            }                
    %>     
    </center>        
    </body>
</html>

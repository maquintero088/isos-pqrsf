<%-- 
    Document   : Sesion1
    Created on : 6/04/2014, 06:27:24 PM
    Author     : Márcel
--%>
<%@page import="Sesion.login"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../IMAGES/fondo1.png" type="image/x-icon" rel="shortcut icon" />
        <title>Inicio de la Sesión</title>
        <style>
            @import "../CSS/css.css";   
        </style>       
    </head>
    <body style=" background-image: url('../IMAGES/sena.jpg'); ">   
    <center>
         <table class="fondo" style="margin-top: 100px;">
        <tr>
            <td onClick="document.location = '../index.html'">    
                <img src="../IMAGES/atras.png" width="100" title="Volver a la Pagina Principal"  alt="atras"/>
            </td>
             <td>
                <form method="POST" name="sesion" id="sesion" action="S_Sesion.jsp">
             <table  class="blanco2" style="width: 250px">                
                <tr>
                    <td>
                        <img src="../IMAGES/fondo1.png" width="150" onClick="document.location = 'Sesion/f_Sesion.jsp'" align="center" alt="LOGO"/>
                    </td>
                </tr>                
                <tr>
                    <td>
                        <p>Identificación</p>
                        <input name="id" type="text" required="required" id="id" align="center" pattern="[0-9]+" title="Solo números." placeholder="Número de Documento" />
                        <p>Contraseña</p>
                        <input name="password" type="password" required="required" id="password" align="center" placeholder="Contraseña" /> 
                    </td>
                </tr>                
                <tr>
                    <td>
                        <hr>
                        <input class='sub1' type="submit" name="s_Sesion" id="s_Sesion" value="Acceder">                        
                    </td>                    
                </tr>
            </table>
        </form>
            </td>
             <td onClick="document.location = 'Ayuda/Ayuda.jsp'">
                 <img src="../IMAGES/vigilancia.png" width="100" alt="nosesion" title="¿No puede acceder?"  />
            </td>
        </tr>
    </table>
    </center>
</body>
</html>
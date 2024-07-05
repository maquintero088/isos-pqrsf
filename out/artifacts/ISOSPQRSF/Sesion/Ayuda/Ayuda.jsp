<%-- 
    Document   : nosesion
    Created on : 2/05/2014, 02:58:51 AM
    Author     : Márcel
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../IMAGES/vigilancia.png" type="image/x-icon" rel="shortcut icon" />
        <title>Ayuda de la Sesión</title>
        <style>
            @import "../../CSS/css.css";   
        </style> 
    </head>
    <body>
    <center>
        <table class="block2" style=" margin-top: 100px">
            <tr>
                <td>
                    <img src="../../IMAGES/atras.png" width="100"  onClick="document.location = '../F_Sesion.jsp'"  alt="atras"/>
                </td>
                <td>
                    <table class="sesion" style="width: 400px;">  
                        <tr>
                            <td>
                                <header style="float: none">                        
                                    <table>
                                        <tr>
                                            <td>
                                                <img src="../../IMAGES/isospqrsf.png" width="65"  align="center" alt="LOGO"/> 
                                            </td>
                                            <td>
                                                <h4 style="color: #f1f1f1">Information System for Optimized Service of</h4>  
                                                <h6>Peticiones, Quejas y Reclamos, Sugerencias y Felicitaciones.</h6>                                                     
                                            </td>
                                        </tr>
                                    </table>
                                </header>
                            </td>
                        </tr>             
                        <tr>
                            <td>
                                <table class="blanco2">
                                    <tr>
                                        <td colspan="2" >
                                            <h3>Ayuda de la Sesión</h3>
                                        </td>
                                    </tr> 
                                    <tr> 
                                        <td>
                                            <img src="../../IMAGES/vigilancia.png" width="120" alt="nosesion" />
                                        </td>
                                        <td>                                
                                            <table class="blanco" >
                                                <tr>
                                                    <td colspan="2">
                                                        <h4>¿En qué le podemos servir?</h4>
                                                    </td>
                                                </tr> 
                                                <tr> 
                                                    <td class="sub3" style="margin: 10px">  
                                                        <img src="../../IMAGES/cambiar.png" height="80" alt="cambiar" onclick="document.location='CambiarContrasena.jsp'"/>
                                                        <h4>Cambiar Clave</h4>
                                                    </td>
                                                    <td style="margin: 10px" class="sub3">
                                                        <img src="../../IMAGES/recordar.png" height="80" alt="recordar" onclick="document.location='RecordarContrasena.jsp'"/>
                                                        <h4>Recordar Clave</h4>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>                        
                                </table>
                            </td>
                        </tr>        
                    </table>
                </td>
            </tr>
        </table>
            </center>
</body>
</html>

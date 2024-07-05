<%-- 
    Document   : SOLICTUD
    Created on : 21/05/2014, 11:19:34 PM
    Author     : Márcel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <link href="../../IMAGES/logo.png" type="image/x-icon" rel="shortcut icon" />
        <title>Sitio de la PQRSF</title>
        <link href="../../CSS/css.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="fondo">
            <center>
                <form action="F_PQRSF.jsp" method="post">  
                <table class="solicitudes">
                    <tr>
                        <td> 
                    <center>
                        <header >
                            <table>
                                <tr>
                                    <td>
                                        <img src="../../IMAGES/isospqrsf.png" width="105"  align="center" alt="LOGO"/>              
                                    </td>
                                    <td>
                                        <h3 style="color: #f1f1f1">Information System for Optimized Service of</h3>  
                                        <h5>Peticiones, Quejas y Reclamos, Sugerencias y Felicitaciones.</h5>                                                     
                                    </td>
                                </tr>
                            </table>
                        </header> 
            </center>
                    <aside  class="blanco2">
            <table>
                <tr>
                    <td>
                        
                    </td>
                </tr>                    
                <tr>
                    <%%>
                    <td class="sub3" onclick="document.location = 'F_Satisfaccion.jsp'">                                          
                        <img src="../../IMAGES/satisfaccion.png" height="80"  align="center" alt="LOGO"/>  
                        <h4>Encuesta de</h4>
                        <h4>Satisfacción</h4>                                            
                    </td>
                </tr>
                <tr>                                                          
                    <%%>
                    <td class="sub3" onclick="document.location = 'E_PQRSF.jsp'">  
                        <img src="../../IMAGES/BUSCAR.png" width="80"  align="center" alt="LOGO"/>  
                        <h4>Consulte el Estado</h4>
                        <h4> de la PQRSF</h4>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table class="blanco">  
                            <tr>
                                <td>
                                    <h3>¿Cómo desea Redactar </h3>
                                    <h3> la PQRSF?</h3>
                                    <hr>
                                </td>
                            </tr>
                            <tr>                                
                                <td>                                                    
                                    <h3>ANÓNIMO</h3>
                                    <input type="radio" name="pqrsf" value="1" title="Redactar Solicitud PQRSF como 'Anónimo'"/>
                                </td>
                            </tr>
                            <tr>
                                <td>                                                    
                                    <h3>ESTÁNDAR</h3>
                                    <input type="radio" name="pqrsf" value="2" checked title="Redactar Solicitud PQRSF Estándar"/>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </aside>
                    <table class="blanco2">
                        <tr>
                            <td>
                                <h4>Condiciones y Términos de Uso</h4>
                                    </td> 
                                </tr>
                                <tr>
                                    <td>
                                        <object class="blanco" data="http://localhost:8084/ISOS_PQRSF/PQRSF/Solicitudes/Terminos.pdf" width="1000" height="380" ></object>
                                    </td>  
                                </tr> 
                    </table>  
                        </td>
                    </tr>
                    <tr>
                        <td class="blanco2" >
                            <table style="width: 1250px">
                                <tr>
                                    <td>   
                                        <input type="button" value="Cancelar" class="sub2" onclick="document.location='../../index.html'"/> 
                                    </td>
                                    <td>
                                <center>
                                    <table class="blanco">
                                            <tr>
                                                <td>                                                    
                                                    <h3>Acepto las Condiciones y Términos de Uso</h3>
                                                </td>
                                                <td>                                                    
                                                    <input type="checkbox" name="acepto" required/>
                                                </td>
                                            </tr>
                                        </table>
                                </center>
                            </td>  
                                    <td style="float: right">
                                        <input type="submit" class="sub1"  value="Continuar" />
                                    </td>                                       
                                </tr>
                            </table>                           
                        </td>
                    </tr>
                </table> 
            </form>
            </center>            
        </div>                     
    </body>
</html>

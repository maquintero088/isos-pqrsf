<%-- 
    Document   : recordarContrasena
    Created on : 18/05/2014, 05:50:30 PM
    Author     : Márcel
--%>

<%@page import="Gestion.SMTP"%>
<%@page import="Gestion.Consultas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recordar la Clave</title>        
         <link href="../../IMAGES/recordar.png" type="image/x-icon" rel="shortcut icon" />
        <link href="../../CSS/css.css" type="text/css" rel="stylesheet"/>
    </head>
    <body>
        
    <center> <%
        if(request.getParameter("id")==null){
    %>
    <table class="fondo" style="margin-top: 100px">
        <tr>
            <td class="sub2" title="Volver al Inicio de la Sesión">
                  <img src="../../IMAGES/atras.png" width="100"  onClick="document.location = '../F_Sesion.jsp'"  alt="atras"/>
            </td>
            <td>
               <table class="blanco">
            <tr>
                <td>
            <center>
                <table class="blanco2" >
                                <tr>
                                    <td colspan="2">
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
            </center>                                                           
               </td>
            </tr>           
            <tr>
                <td>
                    <h3>Recordar la Contraseña</h3>
                </td>
            </tr>           
            <tr>
                <td>
                    <form action="RecordarContrasena.jsp" name="buscar"  method="post">
                    <table class="blanco2">
                        <tr>
                            <td>
                                <label for="id">Numero de Identificación</label>
                            </td>
                            <td>
                                <input type="text" name="id" id="id" pattern="[0-9]+" title="Solo números." required/>  
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <hr class="blanco2">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input class='sub1' type="submit" name="v_contrasena" id="v_contrasena" value="Enviar" /> 
                            </td>
                        </tr>
                    </table>
                    </form>
                </td>
            </tr>     
        </table> 
            </td>
        </tr>
    </table>
        
        <%
        }else{
            Consultas consultas=new Consultas();
            int validacion=consultas.id(request.getParameter("id"));                                     
            if(validacion==1){                
                String correo=consultas.valores("usuario", "usu_Correo", "usu_Id", request.getParameter("id"));
                %>
                    <p>SEÑOR USUARIO, LA CONTRASEÑA HA SIDO ENVIADA A SU CORREO ELECTRÓNICO</p>
                    <input class='sub1' type="submit" value="ACEPTAR" onmouseover="<%
                SMTP envio= new SMTP(correo,"ISOS PQRSF - Recordar Contraseña","Apreciado Usuario, Su Clave es: "
                        +consultas.valores("usuario", "cast(AES_DECRYPT(usu_Contrasena,1234) as char)", "usu_Id", request.getParameter("id")),"","Contraseña");
                    %>" onclick="document.location='../../Sesion/Ayuda/Ayuda.jsp'" />  
                    <%
            }else{
                %>
                <p>EL USUARIO NO EXISTE</p>
        <%                 
            }
        }
        %> 
    </center>    
    </body>
</html>

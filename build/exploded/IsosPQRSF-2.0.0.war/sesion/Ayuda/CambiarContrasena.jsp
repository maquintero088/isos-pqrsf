<%-- 
    Document   : cambiar
    Created on : 12/05/2014, 12:29:27 PM
    Author     : Márcel
--%>

<%@page import="com.qcmarcel.IsosPQRSF.Sesion.Ayuda"%>
<%@page import="java.util.Random"%>
<%@page import="com.qcmarcel.IsosPQRSF.Gestion.SMTP"%>
<%@page import="com.qcmarcel.IsosPQRSF.ISOSPQRSFDB.Consultas"%>
<%@page import="com.qcmarcel.IsosPQRSF.Gestion.Gestion"%>
<%@page import="com.qcmarcel.IsosPQRSF.GestionUsuarios.usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="../../images/cambiar.png" type="image/x-icon" rel="shortcut icon" />
        <title>Cambiar la Clave</title>
        <link href="../../css/css.css" type="text/css" rel="stylesheet"/>
    </head>
    <body>
    <center> <%
        if(
                request.getParameter("password")==null||
                request.getParameter("password2")==null|| 
                request.getParameter("id")==null){
    %>
    <table class="fondo" style="margin-top: 100px"> 
        <tr>            
            <td>        
            <table class="sesion" >
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
                                                        <img src="../../images/isospqrsf.png" width="65"  align="center" alt="LOGO"/> 
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
                                            <img src="../../images/vigilancia.png" width="120" alt="nosesion" />
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
                                                        <img src="../../images/cambiar.png" height="80" alt="cambiar" onclick="document.location='CambiarContrasena.jsp'"/>
                                                        <h4>Cambiar Clave</h4>
                                                    </td>
                                                    <td style="margin: 10px" class="sub3">
                                                        <img src="../../images/recordar.png" height="80" alt="recordar" onclick="document.location='RecordarContrasena.jsp'"/>
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
                <td >
                    <h3>Recordar la Contraseña</h3>
                </td>                
            </tr> 
            <tr>
                <td>
                    <form action="CambiarContrasena.jsp" name="buscar"  method="post">
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
                            <td>
                                <label for="password">Nueva Contraseña:</label>
                            </td>
                            <td>
                                <input type="password" name="password" id="password"  required/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                               <label for="password2">Confirmar Nueva Contraseña:</label>
                            </td>
                            <td>
                                <input type="password" name="password2" id="password2" required/> 
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <hr class="blanco2">
                            </td>
                        </tr>
                        <tr>  
                            <td>                                    
                                <input type="button" value="Cancelar" class="sub2" onClick="document.location = '../F_Sesion.jsp'" /> 
                            </td>
                            <td>
                                <input class='sub1' type="submit" name="s_contrasena" id="s_contrasena" value="Enviar" /> 
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
        }else {   
            Ayuda.cambiar[0]=request.getParameter("id");
            Ayuda.cambiar[1]=request.getParameter("password");
            Consultas consultas=new Consultas();
            int validacion=consultas.id(request.getParameter("id"));                                     
            if(validacion==1){
                usuario Usuario= new usuario();
                Gestion gestion=new Gestion();
                int R=Ayuda.Verificar(); 
                if(request.getParameter("Auto")==null){                    
                    new SMTP(consultas.valores("usuario", "usu_Correo", "usu_Id", request.getParameter("id")),
                            "ISOS-PQRSF: Verificación de Cambio de Contraseña",
                            "Su Código de Verificación es: "+R+" .","","");
                    %>
                    <form action="CambiarContrasena.jsp" name="auto"  method="post">
                        <table class="blanco2">
                            <tr>
                                <td>
                                    <h4>Se ha enviado a su Correo Electrónico un Código de Verificación</h4>
                                    <hr>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="Auto">Por favor Escriba aquí el Código.</label>
                                    <input type="text" name="Auto" id="Auto" pattern="[0-9]+" required/>
                                    <hr>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="submit" class="sub1" value="Verificar" />
                                </td>
                            </tr>
                        </table>
                    </form>
                    <% 
                }else{
                    
                Usuario.contraseña(Ayuda.cambiar[0], Ayuda.cambiar[1]);                
                gestion.seguimiento(Ayuda.cambiar[0], 5, "Cambiar Contraseña", Ayuda.cambiar[1]);
                %>
                <table class="fondo" style="margin-top: 100px" onmouseover="document.location='../F_Sesion.jsp'">
                    <tr>
                        <td>
                            <p>La Contraseña se cambió correctamente</p>
                        </td>                        
                    </tr>                    
                </table>     
        <%        
            }}else{
                %>
                <table class="fondo" style="margin-top: 100px" onmouseover="document.location='CambiarContrasena.jsp'">
                    <tr>
                        <td>
                            <p>Usuario no Existe</p>
                        </td>                        
                    </tr>                    
                </table>                      
        <%                
            }
        }
        %> 
    </center>        
    </body>
</html>

<%-- 
    Document   : f_Respuesta
    Created on : 7/05/2014, 06:59:46 PM
    Author     : USUARIO
--%>

<%@page import="GestionSolicitudes.solicitud"%>
<%@page import="ISOSPQRSFDB.Consultas"%>
<%@page import="GestionRespuestas.respuesta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <link href="../../IMAGES/logo.png" type="image/x-icon" rel="shortcut icon" />  
        <title>Formato de la Respuesta a PQRSF</title>
        <style>
         @import "../../CSS/css.css";
    </style>
    </head>
    <body>
         <%   Consultas consultas=new Consultas(); 
            if(request.getParameter("res_Id")==null){                
                %>
                 <section>
                     <form action="S_Respuesta.jsp" method="post">
                         <center>
            <table class="respuestas">
            <tr>
                <td>
                    <table style= "width: 700px;" class="blanco2">                
                <tr>
                    <td>
                        <table class="blanco" style="width: 700px" >
                            <tr>
                                <td>
                                    <img src="../../IMAGES/sena (12).jpg" width="100" alt=""/>
                                </td>
                                <td >
                                    <h4 class="letra">SERVICIO NACIONAL DE APRENDIZAJE SENA </h4>
                                    <h5 class="letra"> SISTEMA INTEGRADO DE GESTIÓN </h5>
                                    <h6 class="letra">Procedimiento Petición,Queja,Reclamo,Sugerencias y Felicitaciones </h6>
                                    <h6 class="letra">Formato de Respuesta de Petición, Queja, Reclamo, Sugerencia y Felicitación</h6>
                                </td>
                                <td>                                        
                                    <table class="membrete1">
                                        <tr>
                                            <td>
                                                Versión:
                                            </td>
                                            <td>
                                                01
                                            </td>                                           
                                        </tr> 
                                        <tr>
                                            <td colspan="2">
                                                <%
        String Radicado=request.getParameter("radicado"); 
        respuesta.res_Id=consultas.valores("respuesta", "max(res_Id)", "max(res_Id)"); %>
        F002-P004-REGC-<%=(Integer.parseInt(respuesta.res_Id[0])+1)%>
        <input type="hidden" name="Radicado" id="Radicado" value="<%=Radicado%>"/>  
                                            </td>                                        
                                        </tr> 
                                    </table>  
                                </td>
                            </tr>                            
                        </table>
                    </td>
                </tr>    
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    <label for="asunto">Asunto: </label>
                                </td>
                                <td>
                                    <input type="text" name="Asunto" id="Asunto" style="width: 400px" pattern="[A-z]+" />
                                </td>
                            </tr>
                        </table> 
                    </td>
                </tr>    
                <tr>
                    <td>
                        <table>                                
                            <tr>
                                <td> 
                                    <p>Contenido</P>                                   
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-left: 5px; ">
                                    <textarea class="letra"  cols="92"  rows="10" name="Contenido" id="Contenido" placeholder="Escriba su contenido" required></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td>                                
                                    <input type="reset" class="sub2" value="Cancelar" onclick='document.location="<%= request.getParameter("bandeja")%>"'/>    
                                    <input type="submit" class="sub1" value="Enviar" />                                                        
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
                     </form>
            
        </section>
         <%
            }else{
                %>
        <section>
            
            <form action="S_Respuesta.jsp" method="post"> 
            <center>
            <table class="respuestas">
            <tr>
                <td>
                    <table style= "width: 700px;" class="blanco2">                
                <tr>
                    <td>
                        <table class="blanco" style="width: 700px" >
                            <tr>
                                <td>
                                    <img src="../../IMAGES/sena (12).jpg" width="100" alt=""/>
                                </td>
                                <td >
                                    <h4 class="letra">SERVICIO NACIONAL DE APRENDIZAJE SENA </h4>
                                    <h5 class="letra"> SISTEMA INTEGRADO DE GESTIÓN </h5>
                                    <h6 class="letra">Procedimiento Petición,Queja,Reclamo,Sugerencias y Felicitaciones </h6>
                                    <h6 class="letra">Formato de Respuesta de Petición, Queja, Reclamo, Sugerencia y Felicitación</h6>
                                </td>
                                <td>                                        
                                    <table class="membrete1">
                                        <tr>
                                            <td>
                                                Versión:
                                            </td>
                                            <td>
                                                01
                                            </td>                                           
                                        </tr> 
                                        <tr>
                                            <td colspan="2">
                                                <%
        String Radicado=request.getParameter("radicado"); 
        String Res_Id=request.getParameter("res_Id"); %>
        F002-P004-REGC- <%=Res_Id%>
        <input type="hidden" name="update" id="update" value="<%=Res_Id%>"/>  
        <input type="hidden" name="Radicado" id="Radicado" value="<%=Radicado%>"/>  
                                            </td>                                        
                                        </tr> 
                                    </table>  
                                </td>
                            </tr>                            
                        </table>
                    </td>
                </tr>    
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    <label for="asunto">Asunto: </label>
                                </td>
                                <td>
                                    <input type="text" name="Asunto" id="Asunto" style="width: 400px" pattern="[A-z]+" value="<%= consultas.valores("respuesta", "res_Asunto", "res_Id", Res_Id) %>" />
                                </td>
                            </tr>
                        </table> 
                    </td>
                </tr>    
                <tr>
                    <td>
                        <table>                                
                            <tr>
                                <td> 
                                    <p>Contenido</P>                                   
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-left: 5px; ">
                                    <textarea class="letra"  cols="92"  rows="10" name="Contenido" id="Contenido" required> <%= consultas.valores("respuesta", "res_Asunto", "res_Id", Res_Id) %></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="reset" class="sub2" value="Cancelar" onclick='document.location="<%= request.getParameter("bandeja")%>"'/>    
                                    <input type="submit" class="sub1" value="Enviar" />                                                        
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
                                    </form>
        </section>
        
               
        <%
            }
        %>         
</body>
</html>

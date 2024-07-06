<%--  
    Document   : V_solicitud
    Created on : 12/05/2014, 03:39:55 PM
    Author     : ADMIN
--%>

<%@page import="Gestion.Gestion"%>
<%@page import="GestionRespuestas.respuesta"%>
<%@page import="ISOSPQRSFDB.Consultas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        <style>
            @import "../../css/css.css";
        </style>
    </head>
    <body>
    <%   Consultas consultas=new Consultas();             
                %>
                 <section>
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
                                    <img src="../../images/sena (12).jpg" width="100" alt=""/>
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
                                    <h3>Asunto: </h3>
                                </td>
                                <td>
                                    <%= consultas.valores("respuesta", "res_Asunto", "res_Id", Res_Id) %> 
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
                                    <h3>Contenido</h3>                                   
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-left: 5px; ">
                                    <%= consultas.valores("respuesta", "res_Contenido", "res_Id", Res_Id) %> 
                                </td>
                            </tr>                                        
                       </table> 
                    </td>
                </tr>    
                <tr>
                    <td>                                
                                    <%Gestion gestion= new Gestion();%>
                                        <table style="width: 700px">
                                            <tr>
                                                <% if(gestion.estado(gestion.seguimiento(), 3)==1){%>
                                                <td class="revisiones">                                                    
                                                    <form action="../../gestion/Revisiones/R_Respuesta.jsp" method="post" > 
                                                        <input type="hidden" name="res_Id" value="<%= Res_Id%>" />   
                                                        <input type="submit" class="op1" value="Calificar" name="Calificar" />
                                                    </form>                                                                                                    
                                                </td>
                                                <%}%>
                                                <%if(gestion.privilegio(3, gestion.seguimiento(), "Actualizar")==1){%>
                                                <td class="respuestas">                                                    
                                                    <form action="F_Respuesta.jsp" method="post">
                                                        <input type="hidden" name="res_Id" value="<%= Res_Id%>" />
                                                        <input type="submit" class="op1" value="Responder" name="Responder" />
                                                    </form>                                                                                                       
                                                </td>                                                
                                                <%}%>
                                            </tr>
                                        </table>               
                    </td>
                </tr>   
            </table> 
                </td>
            </tr>
        </table>
            </center>
                 </section>
    </body>
</html>

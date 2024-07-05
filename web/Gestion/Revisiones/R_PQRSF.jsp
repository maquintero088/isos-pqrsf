<%-- 
    Document   : R_Respuesta
    Created on : 1/06/2014, 05:11:10 PM
    Author     : Márcel
--%>

<%@page import="Revisiones.revision"%>
<%@page import="Gestion.Gestion"%>
<%@page import="ISOSPQRSFDB.Consultas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Revisión de Respuesta a PQRSF</title>
        <style>
            @import "../../CSS/css.css"; 
        </style>
    </head>
    <body>    
        <%
            Consultas consultas = new Consultas();
            Gestion gestion = new Gestion();
            String Radicado= request.getParameter("radicado");%>     
            <%if(revision.var==0){%>
        <section>
            <center>
                <table class="revisiones">                    
                    <tr>
                        <td>
                            <form action="R_PQRSF.jsp" method="post">
                                <table style="width: 450px" class="blanco2">
                                <tr>
                                    <td>
                                        <h3>Revisión de la Solicitud PQRSF</h3>
                                    </td>      
                                </tr>
                                <tr>
                                    <td>
                                        <table style="width: 450px">
                                          <tr>                                    
                                              <td colspan="2">   
                                                  <p class="revisiones">Calificación:</p>   
                                              </td>      
                                          </tr>
                                          <tr>
                                              <td>
                                                  <label>Aprobada:</label>
                                                  <br>
                                                  <input type="radio" checked name="estado" id="estado" value="3" />  
                                              </td>
                                              <td>
                                                  <label>No Aprobada:</label>
                                                  <br>
                                                  <input type="radio" name="estado" id="estado"  value="2" />                                
                                              </td>
                                          </tr> 
                                      </table>  
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <hr>
                                        <table >
                                            <tr>
                                                <td>
                                                    <h4>Observaciones</h4>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <textarea name="Observaciones" style="max-width: 425px;max-height: 200px" rows="8" cols="50"></textarea>
                                                </td>
                                            </tr>
                                        </table>                                 
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                         <input type="reset" class="sub2" value="Cancelar" onclick='document.location="../Alertas.jsp"'/>    
                                         <input type="submit" class="sub1" value="Enviar" onclick="<%revision.var=1;%>"/> 
                                         <input type="hidden" name="Radicado" id="Radicado" value="<%= Radicado%>"/>
                                    </td>      
                                </tr>
                            </table>
                            </form>                            
                        </td>
                    </tr>
                </table>
            </center>
        </section>   
                 <%  
            }else{
                new  revision("solicitud","sol_Radicado = "+request.getParameter("Radicado"),request.getParameter("estado"),request.getParameter("Observaciones"));  
                %>
                <form action="../Alertas.jsp" method="post">
                    <center>
                        <table class="fondo" style="margin-top: 100px">
                                    <tr>
                                        <td> 
                                            REVISION DE SOLICITUD EFECTUADA CON EXITO.
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="submit" class="op1"  value="Aceptar" /> 
                                        </td>
                                    </tr>
                                </table> 
                            </center> 
                        </form>
        <%
            }%>                   
    </body>
</html>

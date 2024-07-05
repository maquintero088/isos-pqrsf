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
            String Res_Id= request.getParameter("res_Id");
            String Radicado= consultas.valores("respuesta", "fk_sol_Radicado", "res_Id", Res_Id);
    if(revision.var==0){%>
        <section>
            <center>
                <table class="revisiones">                    
                    <tr>
                        <td>
                            <form action="R_Respuesta.jsp" method="post">
                                <table style="width: 450px" class="blanco2">
                                <tr>
                                    <td>
                                        <h3>Revisión de la Respuesta a PQRSF</h3>
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
                                                  <input type="radio" name="estado" id="estado" value="6" />  
                                              </td>
                                              <td>
                                                  <label>No Aprobada:</label>
                                                  <br>
                                                  <input type="radio" name="estado" id="estado"  value="4" />                                
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
                                         <input type="hidden" name="res_Id" id="res_Id" value="<%= Res_Id%>"/>   
                                         <input type="submit" class="sub1" value="Enviar" onclick="<%revision.var=1;%>"/>                                          
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
                String url; 
                new  revision("respuesta","fk_sol_Radicado = "+consultas.valores("respuesta", "fk_sol_Radicado", "res_Id", request.getParameter("res_Id")),request.getParameter("estado"),request.getParameter("Observaciones"));  
                if(request.getParameter("estado")=="6"){
                    url="../../PQRSF/Respuestas/Final.jsp"; 
                }else{ 
                    url="../Alertas.jsp";
                }
                %>
                <form action="<%= url%>" method="post">
                    <center>
                        <table class="fondo" style="margin-top: 100px">
                                    <tr>
                                        <td> 
                                            REVISION DE LA RESPUESTA A PQRSF EFECTUADA CON EXITO.
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
            }
        %>                   
    </body>
</html>

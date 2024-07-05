<%-- 
    Document   : lista
    Created on : 4/05/2014, 07:30:39 PM
    Author     : Márcel
--%>

<%@page import="ISOSPQRSFDB.Consultas"%>
<%@page import="Gestion.Gestion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>listado</title>
        <style>
            @import "../../CSS/css.css"; 
        </style>
    </head><body class="blanco"> 
    <center>
        <%
            Gestion gestion= new Gestion();
            Consultas listas=new Consultas();    
            %> 
            <table>
                 <tr>
                    <td>
                        <aside class="blanco">
                            <table>
                                <%if(gestion.privilegio(2, gestion.seguimiento(), "Estado")==1){%>
                                <tr>
                                    <td class="bnav" onclick="document.location='../../Gestion/Revisiones/B_PQRSF.jsp'">
                                        <h3>Solicitudes por Aprobar</h3>   
                                        <hr>  
                                    </td>
                                </tr>                            
                                <%}%> 
                                <%if(gestion.privilegio(3, gestion.seguimiento(), "Crear")==1){%>
                                <tr> 
                                    <td class="bnav" onclick="document.location='BA_PQRSF.jsp'">                       
                                        <h3>Solicitudes por Responder</h3> 
                                        <hr>  
                                    </td>
                                </tr>                            
                                <%}%>
                                <%if(gestion.privilegio(3, gestion.seguimiento(), "Estado")==1){%>                             
                                <tr>
                                    <td class="bnav" onclick="document.location='../../Gestion/Revisiones/B_Respuesta.jsp'">
                                        <h3>Respuestas por Aprobar</h3>
                                        <hr>  
                                    </td>
                                </tr>
                                <%}%>
                                <%if(gestion.privilegio(3, gestion.seguimiento(), "Actualizar")==1){%>
                                <tr>
                                    <td class="bnav" onclick="document.location='BN_Respuesta.jsp'">
                                        <h3>Respuestas por Corregir</h3>
                                        <hr>  
                                    </td>
                                </tr>
                                <%}%>
                            </table> 
                        </aside>
                    </td>
    <td>
                        <section>     
                            <p style="font-size: 16px; ">Bandeja de Respuestas a PQRSF</p>
                            <form action="O_Respuesta.jsp" method="post">
                                <input type="hidden" name="password" id="password" value="<%= request.getParameter("password")%>"/>
                                <input type="hidden" name="bandeja" id="bandeja" value="BN_Respuesta.jsp"/> 
                                <hr> 
                                <table style="padding: 0px;  width: 900px; color: #000" class="blanco2">  
                                    <tr>
                                        <td>
                                            <h3 class="letra2" style="width: 120px">FECHA</h3>
                                        </td>      
                                        <td>
                                            <h3 class="letra2" style="width: 120px">PQRSF</h3>
                                        </td> 
                                        <td>
                                            <h3 class="letra2" style="width: 120px">TIPO DE PQRSF</h3>
                                        </td> 
                                        <td>
                                            <h3 class="letra2" style="width: 120px">FECHA DE LA PQRSF</h3>
                                        </td>                                                  
                                        <td>
                                            <h3 class="letra2" style="width: 120px">ASUNTO</h3>
                                        </td>     
                                        <td>
                                            <input type="submit" class="sub3" style="width: 120px" value="ORDENAR POR"/>
                                        </td> 
                                    </tr>                     
                                </table>
                            </form>
                                <%                                             
                                int proceso=gestion.proceso(request.getParameter("password"));     
                                System.out.println(request.getParameter("filtro"));
                                String [][] Lrespuesta=listas.respuesta(request.getParameter("filtro"),4);  
                                 if(Lrespuesta[0][5]==null){
                                     %>
                                     <p>Ninguna Respuesta a PQRSF por Corregir</p>   
                                     <%
                                 }else{
                                for (int i=0;i<Lrespuesta.length;i++){
                                    if(Lrespuesta[i][0]!=null){
                                    %>
                                    <form action="../../PQRSF/Respuestas/V_Respuesta.jsp">                    
                                      <table class="respuestas" style="margin-bottom: 50px; padding: 0px;  width: 900px; border: thin solid #c0c0c0">  
                                          <tr>
                                              <td style="border: thin solid #fff;width: 120px">
                                                  <input  type="hidden" name="res_Id" id="res_Id" class="notext" value="<%= Lrespuesta[i][5]%>" />
                                                  <%= Lrespuesta[i][0]%>
                                              </td >                                
                                              <td style="border: thin solid #fff;width: 120px">
                                                  <input type="hidden" name="radicado" id="radicado" class="notext" value="<%= Lrespuesta[i][1]%>" />                                               
                                                  F001-P004-REGC-<%= Lrespuesta[i][1]%>
                                              </td>      
                                              <td style="border: thin solid #fff;width: 120px">
                                                  <%= Lrespuesta[i][2]%>  
                                              </td> 
                                              <td style="border: thin solid #fff;width: 120px">
                                                  <%= Lrespuesta[i][3]%>
                                              </td> 
                                              <td style="border: thin solid #fff;width: 120px">
                                                  <%= Lrespuesta[i][4]%> 
                                              </td>
                                              <td style="width: 120px">
                                                  <input type="submit" name="V_Respuesta" class="op1" style="width: 120px;height: 60px" value="Vista Previa">
                                              </td> 
                                          </tr>                    
                                      </table>               
                                    </form>                   
                                                                <% 
                                }          }
                                 }  
                                %>
                        </section>                        
                    </td>
                </tr>
            </table>
    </center>
</body>
</html>

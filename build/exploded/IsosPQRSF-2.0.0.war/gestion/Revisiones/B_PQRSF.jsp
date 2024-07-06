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
            @import "../../css/css.css"; 
        </style>
    </head>
    <body class="blanco"> 
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
                                    <td class="bnav" onclick="document.location='B_PQRSF.jsp'">
                                        <h3>Solicitudes por Aprobar</h3> 
                                        <hr>  
                                    </td>
                                </tr>                            
                                <%}%> 
                                <%if(gestion.privilegio(3, gestion.seguimiento(), "Crear")==1){%>
                                <tr> 
                                    <td class="bnav" onclick="document.location='../../pqrsf/Respuestas/BA_PQRSF.jsp'">                       
                                        <h3>Solicitudes por Responder</h3>   
                                        <hr>  
                                    </td>
                                </tr>                            
                                <%}%>
                                <%if(gestion.privilegio(3, gestion.seguimiento(), "Estado")==1){%>                             
                                <tr>
                                    <td class="bnav" onclick="document.location='B_Respuesta.jsp'">
                                        <h3>Respuestas por Aprobar</h3>   
                                        <hr>  
                                    </td>
                                </tr>
                                <%}%>
                                <%if(gestion.privilegio(3, gestion.seguimiento(), "Actualizar")==1){%>
                                <tr>
                                    <td class="bnav" onclick="document.location='../../pqrsf/Respuestas/BN_Respuesta.jsp'">
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
                            <p style="font-size: 16px; ">Bandeja de Solicitudes PQRSF</p>
                            <form action="../../pqrsf/Respuestas/O_PQRSF.jsp" method="post">
                                <input type="hidden" name="bandeja" id="bandeja" value="../../gestion/Revisiones/B_PQRSF.jsp"/> 
                                <hr> 
                                <table style="padding: 0px;  width: 900px; color: #000" class="blanco2"> 
                                    <tr>
                                        <td> 
                                            <h3 class="letra2" style="width: 120px">TIPO DE PQRSF</h3>
                                        </td >                                
                                        <td>
                                            <h3 class="letra2" style="width: 120px">FECHA</h3>
                                        </td>      
                                        <td>
                                            <h3 class="letra2" style="width: 120px">ASUNTO</h3>
                                        </td> 
                                        <td>
                                            <h3 class="letra2" style="width: 120px">DEPENDENCIA</h3>
                                        </td> 
                                        <td>
                                            <h3 class="letra2" style="width: 120px">CIUDADANO</h3>
                                        </td>                                                  
                                        <td>
                                            <h3 class="letra2" style="width: 120px">MUNICIPIO</h3>
                                        </td>     
                                        <td>
                                            <input type="submit" class="sub3" style="width: 120px" value="ORDENAR POR"/>
                                        </td> 
                                    </tr>                    
                                </table>
                            </form>
                                <%     
                                System.out.println(request.getParameter("filtro"));
                                String [][] Lsolicitud=listas.solicitud(request.getParameter("filtro"),0,1);  
                                 if(Lsolicitud[0][6]==null){
                                     %>
                                     <p>Ninguna Solicitud PQRSF por Aprobar</p>   
                                     <%
                                 }else{
                                for (int i=0;i<Lsolicitud.length;i++){
                                    if(Lsolicitud[i][0]!=null){ 
                                        %>
                                    <form action="../../pqrsf/Respuestas/V_PQRSF.jsp">                    
                                        <table class="revisiones" style="margin-bottom: 50px; padding: 0px;  width: 900px; border: thin solid #c0c0c0">  
                                                        <tr>
                                                            <td style="border: thin solid #fff;width: 120px">
                                                                <input  type="hidden" name="Radicado" id="Radicado" class="notext" value="<%= Lsolicitud[i][6]%>" />
                                                                <%= Lsolicitud[i][2]%>
                                                            </td >                                
                                                            <td style="border: thin solid #fff;width: 120px">
                                                                <input type="hidden" name="fechal" id="fechal" class="notext" value="<%= Lsolicitud[i][0]%>" />                                               
                                                                <%= Lsolicitud[i][0]%>
                                                            </td>      
                                                            <td style="border: thin solid #fff;width: 120px">
                                                                <%= Lsolicitud[i][5]%>  
                                                            </td> 
                                                            <td style="border: thin solid #fff;width: 120px">
                                                                <%= Lsolicitud[i][4]%>
                                                            </td> 
                                                            <td style="border: thin solid #fff;width: 120px">
                                                                <%= Lsolicitud[i][3]%> 
                                                            </td>                                                  
                                                            <td style="border: thin solid #fff;width: 120px">
                                                                <%= Lsolicitud[i][1]%>  
                                                            </td>     
                                                             <td style="width: 120px">
                                                                <input type="submit" name="V_PQRSF" class="op1" style="width: 120px;height: 60px" value="Vista Previa">
                                                            </td> 
                                                        </tr>                    
                                                    </table> 
                                    </form>                   
                                                                <% 
                                    }
                                    
                                }          
                                 }  
                                %>
                        </section>                        
                    </td>
                </tr>
            </table>
    </center>
</body>
</html>

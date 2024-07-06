<%-- 
    Document   : B_solicitud
    Created on : 24/05/2014, 02:08:32 PM
    Author     : Márcel
--%>

<%@page import="com.qcmarcel.IsosPQRSF.ISOSPQRSFDB.Consultas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">              
        <link href="../../images/BUSCAR.png" type="image/x-icon" rel="shortcut icon" />
        <title>Estado de la PQRSF</title>
        <style>
            @import "../../css/css.css"; 
        </style>
    </head>
    <body>
    <center>
        <table class="fondo" style="margin-top: 100px">
            <tr>
                <td title="Volver al Sitio de la PQRSF">
                    <img src="../../images/atras.png" width="100"  onClick="document.location = 'PQRSF.jsp'"  alt="atras"/>
                </td>
                <td>
            <center>
                <table class="solicitudes" >
            <tr>
                <td>
                    <div style="background: #238276">
                        <table>
                            <tr>
                                <td>
                                    <img src="../../images/isospqrsf.png" width="105"  align="center" alt="LOGO"/>  
                                </td>
                                <td>
                                    <h3 style="color: #f1f1f1">Information System for Optimized Service of</h3>  
                                    <h5>Peticiones, Quejas y Reclamos, Sugerencias y Felicitaciones.</h5>                                                     
                                </td>
                            </tr>
                        </table>
                    </div> 
        <%
            Consultas consultas= new Consultas();
            if(request.getParameter("Radicado")==null){
                %>
                <form action="E_PQRSF.jsp" method="post">
                    <center>
                        <table class="blanco2">
                             <tr>
                                <td colspan="2">
                                    <h3>CONSULTE EL ESTADO DE SU PQRSF</h3>
                                    <h4>Tenga en cuenta el número de radicado generado en la solicitud.</h4>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p>F001-P004-REGC</p>
                                    <input type="text" name="Radicado" style="width: 50px" value="" pattern="[0-9]+" title="Solo números" /> 
                                </td>
                                <td>
                                    <input type="submit" class="sub1" value="Consultar" name="b_solicitud" /> 
                                </td>
                            </tr>
                        </table>
                    </center>                    
                </form>                
                <% 
            }else if(consultas.valores("solicitud", "sol_Radicado", "sol_Radicado", request.getParameter("Radicado"))==null){
                    %>
    <center>
        <table class="blanco2">
            <tr>
                <td onmouseover="document.location='E_PQRSF.jsp'">
                    <h3>Senor Ciudadano - Cliente</h3> 
                    <h3>no existe la solicitud referente al numero de Radicado: </h3>
                    <h2><%=request.getParameter("Radicado")%></h2>
                </td>  
            </tr>
        </table>
   </center>
                    <%  
                }else{
                String estado = consultas.valores("solicitud", "fk_est_Codigo", "sol_Radicado", request.getParameter("Radicado"));
                String tipo = consultas.valores("tipo", "tip_Nombre", "tip_Codigo",consultas.valores("solicitud", "fk_tip_Codigo", "sol_Radicado",request.getParameter("Radicado")));
                    %>
                    <center>
                        <table class="blanco2"> 
                        <tr>
                            <td>                                
                                <h2>Senor Ciudadano - Cliente <br><br> Solicitud PQRSF tipo: <%=tipo%></h2>
                                <hr>
                                <h3>Referente al Número de Radicado: F001-P004-REGC-<%=request.getParameter("Radicado")%></h3>                                
                                <h3>generada con Fecha de: <%= consultas.valores("solicitud", "sol_Fecha", "sol_Radicado", request.getParameter("Radicado")) %></h3>
                                <h3>Se encuentra en estado: <%= consultas.valores("estado", "est_Nombre", "est_Codigo", estado) %>.</h3>
                            </td>
                        </tr>
                    </table>
                    </center>                    
        </td>
            </tr>
        </table>
    </center>
                </td>
            </tr>
        </table>
      </center>  
                    <%  
                }
            %>        
    </body>
</html>

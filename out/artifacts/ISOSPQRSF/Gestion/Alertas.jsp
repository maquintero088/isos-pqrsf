<%-- 
    Document   : alerta
    Created on : 21/05/2014, 05:14:20 PM
    Author     : ADMIN
--%>

<%@page import="ISOSPQRSFDB.Consultas"%>
<%@page import="Gestion.Gestion"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>alerta</title>
        <style>
            @import "../CSS/css.css";
        </style>
    </head>
    <body>
        <%
        Gestion gestion= new Gestion();
        Consultas listas=new Consultas();
        int proceso=gestion.proceso(listas.valores("usuario", "cast(AES_DECRYPT(usu_Contrasena,1234) as char)", "usu_Id", gestion.seguimiento()));        
        %>
    <center>
        <section>
            <table class="blanco"> 
                <tr>
                    <td>
                        <h3>
                            BIENVENIDO A LA PLATAFORMA DE GESTIÓN DE ISOS PQRSF:
                        </h3>  
                    </td>
                </tr>                
                <tr>
                    <%if(gestion.privilegio(2, gestion.seguimiento(), "Estado")==1){%>
                    <td>
                <center>
                    <table class="blanco2">
                            <tr>
                                <td>                    
                                    <%       
        String [][] Lsolicitud=listas.solicitud(request.getParameter("filtro"),0,1); 
        if(Lsolicitud[0][6]==null){
            %>
                            <p>Ninguna Solicitud PQRSF por Aprobar</p>   
            <%
        }else{
        for (int i=0;i<Lsolicitud.length;i++){
            Gestion.alertas[0]=i;
        } 
        %>
        <h2>Solicitudes PQRSF sin Aprobar: <%= Gestion.alertas[0] %></h2> 
                                </td>
                            </tr>  
                            <tr>
                                <td>
                                    <%  
                                    for (int i=0;i<Lsolicitud.length;i++){
                                        if(Lsolicitud[i][0]!=null){
                                           %>
                                        <table class="solicitudes" style="width:500px;">
                                            <tr>
                                                <td>
                                                    <%= Lsolicitud[i][0]%>    
                                                <td>                                                    
                                                    <%= Lsolicitud[i][2]%>                                
                                                </td>
                                                <td>
                                                    <%= Lsolicitud[i][3]%>
                                                </td>
                                            <tr>                        
                                        </table> 
                                                <hr>
                                                    <% 
                                        }                                        
                                    } 
        }                               
                                    %> 
                                </td>
                            </tr>
                        </table>
                </center>
            </td>
             </tr>  
                            <tr>
                    <%}
                    if(gestion.privilegio(3, gestion.seguimiento(), "Crear")==1){%>
                    <td>
                    <center>
                        <table class="blanco2">
                            <tr>
                                <td>                    
                                    <%       
        String [][] Lsolicitud2=listas.solicitud(request.getParameter("filtro"),proceso,3); 
        if(Lsolicitud2[0][6]==null){ 
            %>
            <p>Ninguna Solicitud PQRSF para Contestar</p>  
            <% 
        }else{
        for (int i=0;i<Lsolicitud2.length;i++){
            Gestion.alertas[1]=i;
        } 
        %>
        <h2>Solicitudes PQRSF para Contestar: <%= Gestion.alertas[1] %></h2> 
                                </td>
                            </tr>  
                            <tr>
                                <td>
                                    <%  
                                    for (int i=0;i<Lsolicitud2.length;i++){
                                       if(Lsolicitud2[i][0]!=null){
                                           %>
                                        <table class="solicitudes" style="width:500px;">
                                            <tr>
                                                <td>
                                                    <%= Lsolicitud2[i][0]%>    
                                                <td>                                                    
                                                    <%= Lsolicitud2[i][2]%>                                
                                                </td>
                                                <td>
                                                    <%= Lsolicitud2[i][3]%> 
                                                </td>
                                            <tr>                        
                                        </table> 
                                                <hr>
                                                    <%
                                       }                                        
                                    }       
        }                         
                                    %> 
                                </td>
                            </tr>
                        </table>
                    </center>
                        
                    </td>
                     </tr>   
                            <tr>
                    <%}
                    if(gestion.privilegio(3, gestion.seguimiento(), "Estado")==1){%>
                    <td>
                <center>
                    <table class="blanco2">
                            <tr>
                                <td>                    
                                    <%       
        String [][] Lrespuesta=listas.respuesta(request.getParameter("filtro"),1); 
        if(Lrespuesta[0][5]==null){
            %>
                            <p>Ninguna Respuesta a PQRSF por Aprobar</p>   
            <%
        }else{
        for (int i=0;i<Lrespuesta.length;i++){
            Gestion.alertas[2]=i;
        } 
        %>
        <h2>Respuestas a PQRSF sin Aprobar: <%= Gestion.alertas[2] %></h2> 
                                </td>
                            </tr>  
                            <tr>
                                <td>
                                    <%  
                                    for (int i=0;i<Lrespuesta.length;i++){
                                        if(Lrespuesta[i][0]!=null){
                                          %>
                                        <table class="solicitudes" style="width:500px;">
                                            <tr>
                                                <td>
                                                    <%= Lrespuesta[i][0]%>    
                                                <td>                                                    
                                                    <%= Lrespuesta[i][3]%>                                
                                                </td>
                                                <td>
                                                    <%= listas.valores("usuario", "concat("
                                                            + "usu_Primernombre,' ',"
                                                            + "usu_Segundonombre,' ',"
                                                            + "usu_Primerapellido,' ',"
                                                            + "usu_Segundoapellido)", "usu_Id", 
                                                            listas.valores("gestion", "fk_usu_Id", "formulario_id", Lrespuesta[0][5])) %>
                                                </td>
                                            <tr>                        
                                        </table> 
                                                <hr>
                                                    <%  
                                        }                                        
                                    } 
        }                               
                                    %> 
                                </td>
                            </tr>
                        </table>
                </center>
            </td> 
            </tr> 
            <tr>
                    <%}
                    if(gestion.privilegio(3, gestion.seguimiento(), "Actualizar")==1){%>
                    <td>
                    <center>
                        <table class="blanco2">
                            <tr>
                                <td>                    
                                    <%       
        String [][] Lrespuesta2=listas.respuesta(request.getParameter("filtro"),4); 
        if(Lrespuesta2[0][5]==null){ 
            %>
            <p>Ninguna Respuesta a PQRSF para Corregir</p>  
            <% 
        }else{
        for (int i=0;i<Lrespuesta2.length;i++){
            Gestion.alertas[3]=i;
        } 
        %>
        <h2>Solicitudes PQRSF para Contestar: <%= Gestion.alertas[3] %></h2> 
                                </td>
                            </tr>  
                            <tr>
                                <td>
                                    <%  
                                    for (int i=0;i<Lrespuesta2.length;i++){
                                        if(Lrespuesta2[i][0]!=null){
                                             %>
                                        <table class="solicitudes" style="width:500px;">
                                            <tr>
                                                <td>
                                                    <%= Lrespuesta2[i][0]%>    
                                                <td>                                                    
                                                    <%= Lrespuesta2[i][3]%>                                
                                                </td>
                                                <td>
                                                   <%= listas.valores("usuario", "concat("
                                                            + "usu_Primernombre,' ',"
                                                            + "usu_Segundonombre,' ',"
                                                            + "usu_Primerapellido,' ',"
                                                            + "usu_Segundoapellido)", "usu_Id", 
                                                            listas.valores("gestion", "fk_usu_Id", "formulario_id", Lrespuesta2[i][5])) %>
                                                </td>
                                            <tr>                        
                                        </table> 
                                                <hr>
                                                    <%
                                        }                                       
                                    }       
        }                         
                                    %> 
                                </td>
                            </tr>
                        </table>
                    </center>                        
                    </td>
                    <%}%>
            </tr>
                <tr>
                    <td> 
                <center>
                                    <%if(gestion.estado(gestion.seguimiento(), 2)==1){%>
                                    <form action="Revisiones/B_PQRSF.jsp">
                                        <input type="submit" class="sub1" value="Iniciar en Bandeja">
                                    </form>
                                    <%}else{
                                        %>
                                        <form action="../PQRSF/Respuestas/BA_PQRSF.jsp">
                                            <input type="submit" class="sub1" value="Iniciar en Bandeja">
                                        </form>
                                        <%
                                    }%>
                </center>
            </td>
                </tr>
            </table>
        </section>
    </center>
</body>
</html>

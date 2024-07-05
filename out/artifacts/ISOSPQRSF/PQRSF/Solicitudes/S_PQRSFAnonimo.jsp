<%-- 
    Document   : S_anonimo
    Created on : 13/05/2014, 02:20:38 PM
    Author     : USUARIO
--%>
<%@page import="java.util.Random"%>
<%@page import="ISOSPQRSFDB.Consultas"%>
<%@page import="Gestion.SMTP"%>
<%@page import="GestionSolicitudes.solicitud"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    
        <link href="../IMAGES/logo.png" type="image/x-icon" rel="shortcut icon" />  
        <title>Enviando Solicitud...</title>
        <style>
            @import "../../CSS/css.css";
        </style>
    </head>
    <body> 
       
         
        <%         
            Consultas consultas=new Consultas();
            solicitud Solicitud=new solicitud();  
            if(solicitud.var==0){ 
        %> <center>
            <form action="S_PQRSF.jsp" method="post">
            <table class="fondo">
                <tr>
                    <td>
                         Senor Usuario, agradecemos su tiempo y esperamos atender su PQRSF a Satisfacción com oportunidad, transparencia y calidad.
                         <br>
                         <hr class="solicitudes">
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="hidden" value="<%= request.getParameter("medio")%>" name="medio"/>
                        <input type="submit" class="sub1" onclick="<%
                        Random R = new Random();
                        Solicitud.Solicitud(
                                Integer.parseInt(request.getParameter("tipo")), 
                                4, 
                                1,  
                                8, 
                                3, 
                                ""+R.nextInt(8), 
                                "no aplica", 
                                "no aplica", 
                                "no aplica", 
                                "no aplica",                                 
                                "no aplica",
                                ""+R.nextInt(10),
                                "no aplica",                               
                                10,
                                Integer.parseInt(request.getParameter("proceso")), 
                                Integer.parseInt(request.getParameter("medio")),                  
                                request.getParameter("asunto"),
                                request.getParameter("Contenido")
                        );              
                        solicitud.var=1; 
                        solicitud.radicado=consultas.valores("solicitud", "max(sol_Radicado)", "max(sol_Radicado)");   
                        %>" value="Aceptar"/> 
                    </td>
                </tr>
            </table>
        </form>   
    </center>
        <%             
        }else{
        %>
    <center>
       <table class="isos">  
           <tr>
               <td>
                   <header style="float: none; background: #238276">
                        <img src="../../IMAGES/isospqrsf.png" width="105" onClick="document.location = 'index.html'" align="center" alt="LOGO"/>         
                    </header>
               </td>
           </tr>
            <tr>
                <td>
                    <%
                    switch(Integer.parseInt(request.getParameter("medio"))){
                        case 1:
                            if(request.getParameter("Direccion")==null){
                                %>
                            <form action="S_PQRSF.jsp" method="post">
                                <table class="fondo">
                                <tr>
                                    <td colspan="2">
                                         <h3>Por último, Confirme el medio de notificación de la respuesta a su PQRSF:</h3> 
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Dirección de Residencia
                                        <input type="text" name="Direccion" id="Direccion" />
                                        <input type="hidden" value="<%= request.getParameter("medio")%>" name="medio"/>
                                        </td>
                                    <td>
                                        <input type="submit" class="sub1" value="Enviar"/>  
                                    </td>
                                </tr>
                            </table> 
                            </form>       <% 
                            }else{
                                Solicitud.update(consultas.valores("solicitud", "sol_Radicado", "sol_Contenido",request.getParameter("Contenido")), 
                                        "sol_Direccion", "'"+request.getParameter("Direccion")+"'");                           
                                String Fecha=consultas.valores("solicitud", "sol_Fecha", "sol_Radicado", request.getParameter("Radicado"));
                                %>
                               <form action="../../index.html" method="post">
                                    <table class="fondo">
                                <tr>
                                    <td colspan="2">
                                        <label>Su Solicitud PQRSF se generó correctamente con fecha:</label>  <h3><%= Fecha%></h3>                                       
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>con el número de Radicado: </label> <h3>F001-P004-REGC-<%= solicitud.radicado[0] %></h3>                                       
                                    </td>
                                    <td>
                                        <input type="submit" class="sub1"  value="Aceptar"/>
                                    </td>
                                </tr>
                            </table>
                                </form>
                            <%
                            }
                            
                            break;
                        case 2:
                            if(request.getParameter("Correo")==null||request.getParameter("cuenta")==null){
                              %> 
                            <form action="S_PQRSF.jsp" method="post">
                                <table class="fondo">
                                <tr>
                                    <td colspan="2">
                                        <h3>Por último, Confirme el medio de notificación de la respuesta a su PQRSF:</h3> 
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label  for="Correo">Correo Electrónico: </label> 
                                        <input type="text"  name="Correo" style="text-align: right" id="Correo" placeholder="" />
                                        @
                                        <select name="cuenta" id="cuenta" required>
                                            <option selected value="">Seleccione una </option>
                                            <% Consultas lista5=new Consultas(); 
                                            String [] cuenta=lista5.valores("cuenta", "concat(cue_Nombre,'.',cue_Dominio)", "*");                                                                                 
                                            for (int row =0;row<cuenta.length; row++){
                                                %>
                                                <option value="<%= row+1%>"><%=cuenta[row]%></option>   
                                                <%                   
                                            }                          
                                            %>                                                                                    
                                        </select>    
                                        <input type="hidden" value="<%= request.getParameter("medio")%>" name="medio"/>
                                        </td>
                                    <td>                                        
                                        <input type="submit" class="sub1"  value="Enviar"/>
                                    </td>
                                </tr>
                            </table>  
                            </form>
                            <%   
                            }else{                         
                            Solicitud.update(solicitud.radicado[0],"sol_Correo", "'"+request.getParameter("Correo")+"'");
                            Solicitud.update(solicitud.radicado[0],"fk_cue_Codigo", request.getParameter("cuenta"));                           
                            String Fecha=consultas.valores("solicitud", "sol_Fecha", "sol_Radicado", solicitud.radicado[0]); 
                            String cuenta=consultas.valores("cuenta", "concat(cue_Nombre,'.',cue_Dominio)","cue_Codigo",request.getParameter("cuenta")); 
                            new SMTP(request.getParameter("Correo")+"@"+cuenta,"ISOS PQRSF - Notificación de Solicitud Generada",
                                    "Apreciado Usuario, su solicitud ha sido generada con exito\n\n"
                                    +"contestaremos su solicitud a traves de este medio durante los "  
                        +consultas.valores("tipo", "tip_Limite", "tip_Codigo", consultas.valores("solicitud", "fk_tip_Codigo", "sol_Radicado",solicitud.radicado[0]))
                                            + " días habiles, establecidos por la normatividad vigente.\n\n"
                                            + "Cordialmente:\n"
                                            + "SENA - Centro Agroecólogico y Empresarial\n"
                                            + "+ trabajo.\n\n"
                                    ,cuenta,"");                            
                            %>
                            <form action="../../index.html" method="post">
                                    <table class="fondo">
                                <tr>
                                    <td colspan="2">
                                        <label>Su Solicitud PQRSF se generó correctamente con fecha:</label>  <h3><%= Fecha%></h3>                                       
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>con el número de Radicado: </label> <h3>F001-P004-REGC-<%= solicitud.radicado[0] %></h3>                                       
                                    </td>
                                    <td>
                                        <input type="submit" class="sub1"  value="Aceptar"/>
                                    </td>
                                </tr>
                            </table>
                                </form>
                                            <%}
                            break;
                        case 3:                         
                            String Fecha=consultas.valores("solicitud", "sol_Fecha", "sol_Radicado", request.getParameter("Radicado"));
                            %>
                            <form action="../../index.html" method="post">
                                    <table class="fondo">
                                <tr>
                                    <td colspan="2">
                                        <label>Su Solicitud PQRSF se generó correctamente con fecha:</label>  <h3><%= Fecha%></h3>                                       
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>con el número de Radicado: </label> <h3>F001-P004-REGC-<%= solicitud.radicado[0] %></h3>                                       
                                    </td>
                                    <td>
                                        <input type="submit" class="sub1"  value="Aceptar"/>
                                    </td>
                                </tr>
                            </table>
                                </form>
                            <%
                            break;                      
                    } }%>  
                </td>
            </tr>
        </table>   
    </center>               
    </body>
</html>

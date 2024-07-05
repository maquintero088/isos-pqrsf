<%-- 
    Document   : f_Satisfaccion
    Created on : 7/05/2014, 03:00:52 PM
    Author     : ADMIN
--%>

<%@page import="Revisiones.encuesta"%>
<%@page import="ISOSPQRSFDB.Consultas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../IMAGES/satisfaccion.png" type="image/x-icon" rel="shortcut icon" /> 
        <title>Encuesta de Satisfacción</title>
        <style>
            @import "../../CSS/css.css";
        </style>
    </head>
    <body>
    <center>
        <table class="fondo" >
            <tr>
                <td>
            <center>
                <header>
                    <table>
                        <tr>
                            <td>
                                <img src="../../IMAGES/isospqrsf.png" width="105"  align="center" alt="LOGO"/> 
                            </td>
                            <td>
                                <h3 style="color: #f1f1f1">Sistema de Información para el Servicio Optimizado</h3>  
                                <h5>Peticiones, Quejas y Reclamos, Sugerencias y Felicitaciones.</h5>                                                                                     
                            </td>
                        </tr>
                    </table>
                </header>
            </center>                    
                </td>
            </tr>
            <tr>
                <td>
                    
                        <center>
                            <%
                        Consultas 
                                    consultas = new Consultas(),
                                    consultas2;
                        
                        String Radicado = request.getParameter("radicado"); 
                        
                        String Encuesta = consultas.valores("encuesta", "max(enc_Id)", "fk_est_Codigo", "7");
                        if(consultas.valores("respuesta", "res_Id", "fk_sol_Radicado", Radicado)!=null&&
                                consultas.valores(
                             "satisfaccion_respuesta",
                             "fk_enc_Id", 
                             "fk_res_Id", 
                             consultas.valores("respuesta", "res_Id", "fk_sol_Radicado", Radicado)
                             )!=Encuesta){ 
                            %>
            <table class="solicitudes">
                <tr>
                    <td>                       
                        <form name="satisfaccion" action="S_Satisfaccion.jsp" method="post">
                            <input type="hidden" name="encuesta" id="encuesta" value="<%=Encuesta%>">
                            <table class="blanco2">
                                <tr>
                                    <td>
                                        <h2>Encuesta de Satisfacción</h2>
                                        <h4> Publicación N°<%=Encuesta%></h4>
                                    </td>                                
                                </tr>
                                <tr>
                                    <td>
                                        <div style="width: 700px; height: 300px; overflow:scroll;">
                                            <table class="block2"> 
                                                <tr>
                                                    <%
                                                    String[] preguntas = consultas.valores("pregunta pre, encuesta_pregunta fkpre, encuesta enc "
                                                            + " WHERE pre.pre_Id = fkpre.fk_pre_Id and "
                                                            + "enc.enc_Id = fkpre.fk_enc_Id and fkpre.fk_enc_Id = "+Encuesta+"", "pre.pre_Id", "pre.pre_Id"),
                                                            preguntas2 = preguntas;
                                                    int p=0;
                                                    while(p<preguntas.length){
                                                        %>                                                                                                                                                   
                                                        <td>
                                                <center>
                                                    <table width="650" id="pre<%= preguntas[p]%>" >
                                                        <tr>
                                                            <%if((Integer.parseInt(preguntas2[p])-1)>0){%>
                                                            <td>                                                                
                                                                <a href="#pre<%= (Integer.parseInt(preguntas2[p])-1)%>">
                                                                    <img src="../../IMAGES/atras.png" width="40" alt="vinculo"/>
                                                                </a>                                                                                                                             
                                                            </td>
                                                            <%}%>   
                                                            <td>
                                                                <h4>¿<%= consultas.valores("pregunta", "pre_Descripcion", "pre_Id",  preguntas[p])%>? </h4>    
                                                                <input type="hidden" name="pregunta<%=preguntas[p]%>" value="<%=preguntas[p]%>"/>
                                                            </td>
                                                            <%if((Integer.parseInt(preguntas2[p])+1)<=preguntas2.length){%>
                                                            <td>                                                                 
                                                                <a href="#pre<%= (Integer.parseInt(preguntas2[p])+1)%>">
                                                                    <img src="../../IMAGES/siguiente.png" width="40" alt="vinculo"/>
                                                                </a>
                                                            </td>
                                                            <%}%>  
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">
                                                        <center>
                                                            <table  class="block2">
                                                                <%
                                                                consultas2 = new Consultas();
                                                                String [] opciones = consultas2.valores("opcion opc, pregunta_opcion fkopc, pregunta pre"
                                                                        + " WHERE opc.opc_Id = fkopc.fk_opc_Id and "
                                                                        + "pre.pre_Id = fkopc.fk_pre_Id and fkopc.fk_pre_Id = "+preguntas[p]+"", "opc.opc_Id", "opc.opc_Id");
                                                                int o=0;
                                                                while(o<opciones.length){
                                                                    %>
                                                                    <tr>
                                                                        <td style="text-align: left">
                                                                            <label><%= consultas2.valores("opcion", "opc_Descripcion", "opc_Id",  opciones[o])%></label>                                                                                    </td>
                                                                        <td>  
                                                                            <input type="radio"  name="opcion<%=preguntas[p]%>" value="<%=opciones[o]%>" />                                                      
                                                                        </td>
                                                                    </tr>
                                                                    <%
                                                                    o++;                                  
                                                                }
                                                                    %> 
                                                            </table>   
                                                        </center>                                                                                                                                 
                                                    </td>                   
                                                    </tr>
                                                    </table>
                                                </center>
                                            </td>
                                            <%p++;
                                                    }%>                                                
                                            </tr>
                                        </table>
                                            </div> 
                                    </td>                                
                                </tr>
                                <tr>
                                    <td>
                                        <input type="submit" class="sub1" value="Enviar">
                                    </td>                                
                                </tr>
                            </table>
                        </form>
                    </td>
                </tr>
            </table>
                    <%}else{
                        String nota="", color="";
                    if(request.getParameter("radicado")!=null){
                        nota="La Solicitud no existe o no ha sido Resuelta";
                        color="fc7323";
                    }
                    if(
                            consultas.valores(
                                    "satisfaccion_respuesta",
                                    "fk_enc_Id", 
                                    "fk_res_Id", 
                                    consultas.valores("respuesta", "res_Id", "fk_sol_Radicado", Radicado)
                            ).equalsIgnoreCase(null)&&
                            consultas.valores(
                                    "satisfaccion_respuesta",
                                    "fk_enc_Id", 
                                    "fk_res_Id", 
                                    consultas.valores("respuesta", "res_Id", "fk_sol_Radicado", Radicado)
                            ).equals(Encuesta)){
                        nota="Usted ya ha Realizado esta Encuesta";
                        color="56b548";
                    }
                    %>
                    <form action="F_Satisfaccion.jsp" method="post">
                        <table class="blanco2">
                            <tr>
                                <td colspan="3">
                                    <h3>EVALUE LA SATISFACCIÓN DE LA RESPUESTA A SU PQRSF</h3>
                                    <h4>Tenga en cuenta el número de radicado generado en la solicitud.</h4>
                                    <h5 style="color: #<%= color%>;"><%= nota%></h5>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p>F001-P004-REGC</p> 
                                </td>
                                <td>
                                    <input type="text" name="radicado" id="radicado" style="width: 50px; text-align: right" value="" pattern="[0-9]+" title="Solo números" /> 
                                </td>
                                <td>
                                    <input type="submit" class="sub1" value="Siguiente" name="b_solicitud" /> 
                                </td>
                            </tr>                   
                        </table>
                    </form>
                                    <%}%>                        
                        </center>                        
                      
                </td>
            </tr>
            <tr>                
                <td class="block" onClick="document.location = 'PQRSF.jsp'">
                    <img src="../../IMAGES/atras.png" width="80" title="Volver al Sitio de la PQRSF" alt="atras"/>
                </td>  
            </tr>
        </table>
    </center>
</body>
</html>

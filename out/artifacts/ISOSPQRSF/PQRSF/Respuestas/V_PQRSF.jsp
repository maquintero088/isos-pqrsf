<%--   
    Document   : V_solicitud
    Created on : 12/05/2014, 03:39:55 PM
    Author     : ADMIN
--%>
 
<%@page import="GestionSolicitudes.solicitud"%>
<%@page import="Gestion.Gestion"%>
<%@page import="ISOSPQRSFDB.Consultas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        <style>
            @import "../../CSS/css.css"; 
        </style>
    </head>
    <body class="fondo">
    <center>
        <table class="solicitudes">
                <tr>
                    <td> 
                        <input type="hidden" name="radicado" id="radicado" />  
                            <table class="blanco2">
                                <tr>                
                                    <td> 
                                        <table class="blanco" id="ver" style="width: 800px">
                                            <tr>
                                                <td>
                                                    <img src="../../IMAGES/sena (12).jpg" width="100" alt=""/>
                                                </td>
                                                <td >
                                                    <h3 class="letra">SERVICIO NACIONAL DE APRENDIZAJE SENA </h3>
                                                    <h4 class="letra">SISTEMA INTEGRADO DE GESTIÓN </h4>
                                                    <h5 class="letra">Procedimiento Petición,Queja,Reclamo,Sugerencias y Felicitaciones </h5>
                                                    <h6 class="letra">Formato Peticiones, Quejas, Reclamos, Sugerencias y Felicitaciones</h6>
                                                </td>
                                                <td>              
                                                    <table class="membrete1">
                                                        <%Consultas consultas=new Consultas();
                                                        String Radicado = request.getParameter("Radicado");
                                                        %>                                                        
                                                        <tr>
                                                            <td>
                                                                <%= request.getParameter("fechal")%>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                               F001-P004-REGC-<%=Radicado%>
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
                                        <table style="width: 800px">
                                            <tr>
                                                <td>   
                                                    <h3 class="solicitudes" >Tipo de PQRSF:</h3> 
                                                    <%
                                                    String tipo=consultas.valores("solicitud", "fk_tip_Codigo", "sol_Radicado", Radicado);%>    
                                                </td> 
                                            </tr>  
                                            <tr>                                         
                                                <td>                                                                                                     
                                                    <%=consultas.valores("tipo", "tip_Nombre", "tip_Codigo", tipo)
                                                    %>                                                   
                                                </td>                                                
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table style="width: 800px">
                                            <tr>
                                                <td class="solicitudes">
                                                    <h3>Tipo de Ciudadano - Cliente: </h3>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <%String ciudadano=consultas.valores("solicitud", "fk_ciu_Codigo", "sol_Radicado", Radicado);%>
                                        <%= consultas.valores("ciudadano", "ciu_Nombre", "ciu_Codigo", ciudadano)%>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>               
                                </tr>
                                <%if(!consultas.valores("solicitud", "sol_Primernombre", "sol_Radicado", Radicado).equals("no aplica")){%>
                                <tr>
                                    <td>
                                        <table style="width: 800px">                                           
                                            <tr>           
                                                <td style="padding: 0px"> 
                                                            <p class="solicitudes"> DATOS  DEL CIUDADANO CLIENTE QUE RADICA LA PQRSF</p>
                                                        </td>
                                                    </tr>
                                                    <tr> 
                                                        <td>
                                                            <table style="width: 1200px"> 
                                                                <tr>                             
                                                                    <td  >
                                                                        <label for="documento">Tipo de Documento:</label>
                                                                        <br>
                                                                        <select name="documento" id="documento" title="Eliga tipo de Documento de Identificación." required>
                                                                            <option value="">seleccione una</option> 
                                                                            <% Consultas lista2=new Consultas();
                                                                            String [] documento=lista2.valores("documento", "doc_Nombre", "*");   
                                                                            for (int row =0;row<documento.length; row++){
                                                                                %>
                                                                                <option value="<%= row+1%>"><%=documento[row]%></option>  
                                                                                <%                   
                                                                            }                          
                                                                            %> 
                                                                        </select>    
                                                                    </td>
                                                            <td>
                                                                <label  for="id">Número de Documento: </label>
                                                                 <br>
                                                                 <input type="text" name="id" id="id" placeholder="" pattern="[0-9]+" title="Solo números." required  />                                                                    
                                                            </td>
                                                            <td>
                                                                <label  for="municipio">Ciudad o Municipio: </label> 
                                                                 <br>
                                                                <select name="municipio" id="municipio" title="Eliga municipio donde reside (en la Regional)." required>
                                                                    <option selected value="">Seleccione una </option>
                                                                    <% Consultas lista3=new Consultas(); 
                                                                    String [] municipio=lista3.valores("municipio", "mun_Nombre", "*");   
                                                                    for (int row =0;row<municipio.length; row++){
                                                                        %>
                                                                        <option value="<%= row+1%>"><%=municipio[row]%></option>    
                                                                        <%                   
                                                                    }                          
                                                                    %>
                                                                </select>                
                                                            </td>
                                                            <td>
                                                                <label  for="genero">Género: </label>
                                                                 <br>
                                                                <select name="genero" id="genero" required title="Si desea omitir eliga 'No especifica'.">
                                                                    <option selected value="">Seleccione una </option>
                                                                  <% Consultas lista4=new Consultas(); 
                                                                  String [] genero=lista4.valores("genero", "gen_Nombre", "*");   
                                                                  for (int row =0;row<genero.length; row++){
                                                                      %>
                                                                      <option value="<%= row+1%>"><%=genero[row]%></option> 
                                                                      <%                   
                                                                  }                          
                                                                  %>
                                                                </select>  
                                                            </td>                                                            
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <label  for="Primernombre">Primer Nombre: </label>  
                                                                <br>
                                                                <input type="text" name="Primernombre" id="Primernombre" placeholder="" pattern="[A-Z][a-z]+" title="ejemplo: Sofia." required />                                 
                                                            </td>                                                        
                                                            <td>
                                                                <label  for="Segundonombre">Segundo Nombre: </label>    
                                                                 <br>
                                                                <input type="text" name="Segundonombre" id="Segundonombre" placeholder="" pattern="[A-Z][a-z]+" title="ejemplo: Hernando."  />
                                                            </td>                                                        
                                                            <td>  
                                                                <label  for="Primerapellido">Primer Apellido: </label>                
                                                                 <br>
                                                                <input type="text" name="Primerapellido" id="Primerapellido" placeholder="" pattern="[A-Z][a-z]+" title="ejemplo: Nuñez." required />
                                                            </td>                                                            
                                                            <td  > 
                                                                <label  for="Segundoapellido">Segundo Apellido: </label>       
                                                                 <br>
                                                                <input type="text" name="Segundoapellido" id="Segundoapellido" placeholder="" pattern="[A-Z][a-z]+" title="ejemplo: Marquez."  />
                                                            </td>
                                                        </tr> 
                                                        <tr> 
                                                            <td colspan="4">
                                                                 <label  for="Celular">Telefono o Celular: </label>
                                                                  <br>
                                                                <input type="text" name="Celular" id="Celular" placeholder="" pattern="[0-9]+" title="Solo números." required />
                                                            </td> 
                                                        </tr>         
                                                </table> 
                                                </td> 
                                            </tr>         
                                        </table>
                                    </td>               
                                </tr>
                                <%}%>
                                <tr>
                                    <td>
                                        <table style="width: 800px">
                                            <tr>
                                                <td colspan="2">
                                                    <h3 class="solicitudes">Medio de notificación de la Respuesta: </h3>
                                                    <%   
                                                    String medio=consultas.valores("solicitud", "fk_med_Codigo", "sol_Radicado", Radicado);%> 
                                                </td>                                               
                                            </tr>
                                                    <%String cuenta=consultas.valores("solicitud", "fk_cue_Codigo", "sol_Radicado", Radicado);%>
                                                    <%if(medio.equalsIgnoreCase("1")){%> 
                                                        <tr>
                                                            <td>
                                                                <h3 class="letra2">Dirección:</h3>                                                     
                                                            </td>
                                                            <td>
                                                                <%= consultas.valores("solicitud", "sol_Direccion", "sol_Radicado", Radicado)%>
                                                            </td>
                                                        </tr>  
                                                    <%}%>        
                                                    <%if(medio.equalsIgnoreCase("2")){%> 
                                                        <tr>
                                                            <td>
                                                                <h3 class="letra2">Correo Electrónico:</h3>                                                     
                                                            </td>
                                                            <td>
                                                                <%= consultas.valores("solicitud", "sol_Correo", "sol_Radicado", Radicado)%>
                                                                @
                                                                <%= consultas.valores("cuenta", "cue_Nombre", "cue_Codigo", cuenta)%> 
                                                                .
                                                                <%= consultas.valores("cuenta", "cue_Dominio", "cue_Codigo", cuenta)%> 
                                                            </td>
                                                        </tr> 
                                                    <%}%>  
                                                    <%if(medio.equalsIgnoreCase("3")){%> 
                                                        <tr>
                                                            <td>
                                                                Número de Secuencia para la Consulta Estado PQRSF:                                                   
                                                            </td>
                                                            <td style="width:100px">
                                                                <%= Radicado%>
                                                            </td>
                                                        </tr>     
                                                    <%}%>                                                                             
                                        </table> 
                                    </td>
                                </tr><tr>
                                    <td>
                                        <table style="width: 800px"> 
                                            <tr> 
                                                <td>
                                                    <h3 class="solicitudes">
                                                        <%= consultas.valores("solicitud", "sol_Asunto", "sol_Radicado", Radicado)                                                   
                                                            %>
                                                    </h3>                                                    
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                            <center>
                                                    <table width="500">
                                                        <tr> 
                                                            <td style="text-align: justify;">
                                                                <%= consultas.valores("solicitud", "sol_Contenido", "sol_Radicado", Radicado)                                                   
                                                                    %>
                                                                    <hr>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td> 
                                                                <table class="block2">
                                                                    <tr>
                                                                        <td>
                                                                            <h3 class="letra2">Dirigido a:</h3>
                                                                            <%String proceso=consultas.valores("solicitud", "fk_pro_Codigo", "sol_Radicado", Radicado);%>
                                                                        </td>
                                                                        <td style="text-align: justify;" > 
                                                                            <%= consultas.valores("proceso", "pro_Nombre", "pro_Codigo", proceso)                                                   
                                                                                    %>                                                     
                                                                        </td>
                                                                    </tr>                                                                                                                                    
                                                                </table>
                                                            </td> 
                                                        </tr>  
                                                    </table>
                                            </center>                                                    
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <%if(Integer.parseInt(consultas.valores("solicitud", "fk_est_Codigo", "sol_Radicado", Radicado))>1){%>
                                  <tr>
                                    <td>
                                  <center>
                                      <table class="revisiones">                    
                                            <tr>
                                                <td>
                                                    <table style="width: 450px" class="blanco2">
                                                        <tr>
                                                            <td colspan="2">
                                                                <h3>Revisión de la Solicitud PQRSF</h3>
                                                            </td>      
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <p>Calificación:</p>                                           
                                                            </td>
                                                            <td>
                                                                <h4><%= consultas.valores("estado", "est_Nombre", "est_Codigo", consultas.valores("solicitud", "fk_est_Codigo", "sol_Radicado", Radicado)) %></h4>                                           
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">
                                                                            <h4>Observaciones</h4>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2">
                                                                                <%= consultas.valores("solicitud", "Observaciones", "sol_Radicado", Radicado) %>
                                                                        </td>
                                                                    </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                  </center>                                        
                                    </td>
                                  </tr>  
                                  <%}%>
                                  <tr>
                                    <td>
                                        <%Gestion gestion= new Gestion();%>
                                        <table style="width: 800px">
                                            <tr>
                                                <% if(gestion.estado(gestion.seguimiento(), 2)==1){%>
                                                <td class="revisiones">                                                    
                                                    <form action="../../Gestion/Revisiones/R_PQRSF.jsp" method="post" > 
                                                        <input type="hidden" name="radicado" value="<%= Radicado%>" />  
                                                        <input type="submit" class="op1" value="Calificar" name="Calificar" />
                                                    </form>                                                                                                    
                                                </td>
                                                <%}%>
                                                <%if(gestion.privilegio(3, gestion.seguimiento(), "Crear")==1){%>
                                                <td class="respuestas">                                                    
                                                    <form action="F_Respuesta.jsp" method="post">
                                                        <input type="hidden" name="radicado" value="<%= Radicado%>" />
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
       
    </body>
</html>

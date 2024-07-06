<%--  
    Document   : f_Solicitud
    Created on : 14/04/2014, 09:19:13 PM
    Author     : Márcel
--%>
<%@page import="com.qcmarcel.IsosPQRSF.ISOSPQRSFDB.Consultas"%>    
<%@page import="com.qcmarcel.IsosPQRSF.GestionSolicitudes.solicitud"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    
        <link href="../../images/logo.png" type="image/x-icon" rel="shortcut icon" />  
        <title>Formato PQRSF</title>
        <style>
            @import "../../css/css.css"; 
        </style>
    </head>
    <body>       
    <center>
        <%   Consultas consultas=new Consultas(); 
            if(Integer.parseInt(request.getParameter("pqrsf"))==1){               
                %>
        <section style="float: none">
            <table class='solicitudes' >  
                <tr>
                    <td> 
                        <form name="Solicitud" action="S_PQRSFAnonimo.jsp" method="post">
                            <table class='blanco2'> 
                                <tr>                
                                    <td class='solicitudes'>
                                        <table style="width: 1250px">
                                            <tr>
                                                <td>
                                                    <img src="../../images/isospqrsf.png" width="105"  align="center" alt="LOGO"/> 
                                                </td>
                                                <td>
                                                    <h3 style='color: #f1f1f1'>Information Systems for Optimizing Services.</h3>  
                                                    <h5>Peticiones, Quejas y Reclamos, Sugerencias y Felicitaciones.</h5>                                                     
                                                </td>
                                                <td>
                                                    <%@include file="../../WEB-INF/reloj.jspf" %>
                                                </td>  
                                            </tr>
                                        </table>
                                    </td>               
                                </tr>                                
                                <tr>
                                    <td> 
                                        <table class="blanco" style="width: 1250px">
                                            <tr>
                                                <td>
                                                    <img src="../../images/sena (12).jpg" width="100" alt=""/>
                                                </td>
                                                <td>
                                                    <h3 class="letra">SERVICIO NACIONAL DE APRENDIZAJE SENA </h3>
                                                    <h4 class="letra">SISTEMA INTEGRADO DE GESTIÓN </h4>
                                                    <h5 class="letra">Procedimiento Petición,Queja,Reclamo,Sugerencias y Felicitaciones </h5>
                                                    <h6 class="letra">Formato Peticiones, Quejas, Reclamos, Sugerencias y Felicitaciones</h6>
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
                                                                <% solicitud.radicado=consultas.valores("solicitud", "max(sol_Radicado)", "max(sol_Radicado)"); 
                                                                if (solicitud.radicado.length > 0 && solicitud.radicado[0] != null) { %>
                                                                F001-P004-REGC-<%=(Integer.parseInt(solicitud.radicado[0])+1)%>
                                                                <% } %>
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
                                        <table style="width: 1250px">
                                            <tr>
                                                <td colspan="5" style="padding: 0px">   
                                                    <p class="solicitudes">Tipo de PQRSF:</p>
                                                </td>      
                                            </tr>
                                            <tr>
                                                <td title="Petición:
Es cualquier actuación del Ciudadano-Cliente que se dirige al SENA o a un Colaborador SENA
con el propósito de requerir su intervención en un asunto concreto. ">
                                                    <label>Petición:</label>
                                                    <br>
                                                    <input type="radio" checked name="tipo" value="1" />  
                                                </td>
                                                <td title="Queja:
Es la manifestación de No-Conformidad, insatisfacción, desagrado o descontento que un 
Ciudadano-Cliente pone en conocimiento del SENA, por conductas irregulares realizadas
por sus Colaboradores SENA en cumplimiento de sus funciones o por particulares que 
tienea su cargo la prestación de un servicio público.">
                                                    <label>Queja:</label>
                                                    <br>
                                                    <input type="radio" name="tipo"  value="2" />
                                                </td>
                                                <td title="Reclamo:
Es una exigencia presentada por cualquier Ciudadano-Cliente ante la ausencia irregular
o mala prestación de un servicio, por una obligación incumplida o por la prestación 
deficiente de una función a cargo del SENA.">
                                                    <label>Reclamo:</label>
                                                    <br>
                                                    <input type="radio"  name="tipo"  value="3" />
                                                </td>
                                                <td title="Sugerencia:
Es una proposición, insinuación, indicación o propuesta que se  presenta con el objetivo
de sugerir una acción para adecuar o mejorar algún servicio, producto o proceso de la Entidad.">
                                                    <label>Sugerencia:</label>
                                                    <br>
                                                    <input type="radio" name="tipo"  value="4" />
                                                </td>
                                                <td title="Felicitación:
Es la manifestación de agradecimiento o exaltación por la satisfacción recibida en la utilización
de un servicio o la actuación de un Colaborador SENA en el ejercicio de sus funciones. ">
                                                    <label>Felicitación:</label>
                                                    <br>
                                                    <input type="radio" name="tipo"  value="5" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table style="width: 1250px" >
                                            <tr>
                                                <td colspan="3">                                                    
                                                    <p class="solicitudes">Desea que se le notifique la Respuesta por que medio:</p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td title="Tomando en cuenta la Dirección de Residencia.">
                                                    <label>Físico</label>
                                                    <br>
                                                    <input type="radio" name="medio" id="medio" value="1"/>
                                                </td>
                                                <td title="Le enviaremos notificación a su Correo Electrónico.">
                                                    <label>Correo Electrónico</label>
                                                    <br>
                                                    <input type="radio" name="medio"  id="medio" value="2"/>
                                                </td>
                                                <td title="Desde nuestra opción (CONSULTAR ESTADO PQRSF).">
                                                    <label>Web (ISOS PQRSF)</label>
                                                    <br>
                                                    <input type="radio" name="medio" checked id="medio" value="3"/>
                                                </td> 
                                            </tr>                                     
                                        </table>       
                                    </td>
                                </tr>    
                                <tr>
                                    <td>
                                        <table style="width: 1250px">
                                            <tr>
                                                <td>
                                                    <label for="asunto">Asunto: </label> 
                                                    <br>
                                                    <input type="text" style="width: 400px;" class="letra" id="asunto" name="asunto" pattern="[A-Z][a-z- ]+" placeholder=""/>
                                                </td>   
                                                <td>
                                                    <label for="proceso">Dependencia a la cual corresponde la PQRSF: </label>  
                                                    <br>
                                                    <select name="proceso" id="proceso" style="width: 350px" title="Eliga el área responsable de su Solicitud PQRSF." required>
                                                        <option selected value="">Seleccione una </option>  
                                                        <% Consultas lista6=new Consultas();
                                                        String [] Lproceso=lista6.valores("proceso", "pro_Nombre", "*");   
                                                        for (int row =0;row<Lproceso.length; row++){
                                                            %>
                                                            <option value="<%= row+1%>"><%=Lproceso[row]%></option>
                                                            <%                   
                                                        }                          
                                                        %>
                                                    </select>
                                                </td>
                                            </tr>
                                        </table> 
                                    </td>
                                </tr>    
                                <tr>
                                    <td>
                                        <table style="width: 1250px">                                
                                            <tr>
                                                <td style="padding: 0px">                   
                                                    <p class="solicitudes">DESCRIBA LA SITUACIÓN PRESENTADA</p> 
                                                    <p class="letra2" >(Trate de indicar los datos más exactos posibles)</p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td  style="padding-left: 5px; ">
                                                    <textarea class="letra"  cols="102"  rows="10" name="Contenido"  id="Contenido" title="Recuerde que no se aceptará lenguaje obsceno, irrespetuoso, y cualquier otro tipo de expresión verbal ofensiva." placeholder="" required="required" ></textarea>
                                                  </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="anexo">Si anexa documentos relaciónelos aquí: </label> 
                                                    <input type="file" name="anexo" id="anexo" /> 
                                                </td>                                            
                                            </tr>                               
                                        </table>     
                                    </td>                   
                                </tr>    
                                <tr>
                                    <td>       
                                        <hr class="solicitudes"/>                                
                                    </td>
                                </tr>
                                <tr>
                                    <td>   
                                        <input type="reset" class="sub2" onclick="document.location='PQRSF.jsp'" value="Cancelar" /> 
                                        <input type="submit" class="sub1" value="Enviar" onclick="<%solicitud.var=0; %>"/>                                                                
                                    </td>
                                </tr>
                            </table>
                        </form>                                   
                    </td> 
                </tr>  
            </table>
        </section>  
        <%
            }else{
                %>
        <section>
            <table class="solicitudes">
                                <tr>                
                                    <td>
                                        <form name="Solicitud" action="S_PQRSF.jsp" method="post">
                            <table class='blanco2'>
                                <tr>                
                                    <td class="solicitudes">
                                        <table style="width: 1250px">
                                            <tr>
                                                <td>
                                                    <img src="../../images/isospqrsf.png" width="105"  align="center" alt="LOGO"/> 
                                                </td>
                                                <td>
                                                    <h3 style='color: #f1f1f1'>Information Systems for Optimizing Services.</h3>  
                                                    <h5>Peticiones, Quejas y Reclamos, Sugerencias y Felicitaciones.</h5>                                                     
                                                </td>
                                                <td>
                                                    <%@include file="../../WEB-INF/reloj.jspf" %>
                                                </td>  
                                            </tr>
                                        </table>
                                    </td>
                                                 
                                </tr>                                
                                <tr>
                                    <td> 
                                        <table class="blanco" style="width: 1250px">
                                            <tr>
                                                <td>
                                                    <img src="../../images/sena (12).jpg" width="100" alt=""/>
                                                </td>
                                                <td>
                                                    <h3 class="letra">SERVICIO NACIONAL DE APRENDIZAJE SENA </h3>
                                                    <h4 class="letra">SISTEMA INTEGRADO DE GESTIÓN </h4>
                                                    <h5 class="letra">Procedimiento Petición,Queja,Reclamo,Sugerencias y Felicitaciones </h5>
                                                    <h6 class="letra">Formato Peticiones, Quejas, Reclamos, Sugerencias y Felicitaciones</h6>
                                                </td>
                                                <td>      
                                            <center>
                                                <table class="block2">
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
                                                                Formato: 
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                Codígo:
                                                            </td>
                                                            <td>
                                                                F001-P004-REGC
                                                            </td>
                                                        </tr>
                                                    </table> 
                                            </center>                                                     
                                                </td>
                                            </tr>
                                        </table>
                                    </td>               
                                </tr>                                
                                <tr>
                                    <td>
                                        <table style="width: 1250px">
                                            <tr>
                                                <td colspan="5" style="padding: 0px" >   
                                                    <p class="solicitudes">TIPO DE PQRSF:</p>
                                                </td>      
                                            </tr>
                                            <tr>
                                                <td title="Petición:
Es cualquier actuación del Ciudadano-Cliente que se dirige al SENA o a un Colaborador SENA
con el propósito de requerir su intervención en un asunto concreto. ">
                                                    <label>Petición:</label>
                                                    <br>
                                                    <input type="radio" checked name="tipo" value="1" />  
                                                </td>
                                                <td title="Queja:
Es la manifestación de No-Conformidad, insatisfacción, desagrado o descontento que un 
Ciudadano-Cliente pone en conocimiento del SENA, por conductas irregulares realizadas
por sus Colaboradores SENA en cumplimiento de sus funciones o por particulares que 
tienea su cargo la prestación de un servicio público.">
                                                    <label>Queja:</label>
                                                    <br>
                                                    <input type="radio" name="tipo"  value="2" />
                                                </td>
                                                <td title="Reclamo:
Es una exigencia presentada por cualquier Ciudadano-Cliente ante la ausencia irregular
o mala prestación de un servicio, por una obligación incumplida o por la prestación 
deficiente de una función a cargo del SENA.">
                                                    <label>Reclamo:</label>
                                                    <br>
                                                    <input type="radio"  name="tipo"  value="3" />
                                                </td>
                                                <td title="Sugerencia:
Es una proposición, insinuación, indicación o propuesta que se  presenta con el objetivo
de sugerir una acción para adecuar o mejorar algún servicio, producto o proceso de la Entidad.">
                                                    <label>Sugerencia:</label>
                                                    <br>
                                                    <input type="radio" name="tipo"  value="4" />
                                                </td>
                                                <td title="Felicitación:
Es la manifestación de agradecimiento o exaltación por la satisfacción recibida en la utilización
de un servicio o la actuación de un Colaborador SENA en el ejercicio de sus funciones. ">
                                                    <label>Felicitación:</label>
                                                    <br>
                                                    <input type="radio" name="tipo"  value="5" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table style="width: 1250px">
                                            <tr>
                                                <td>
                                                    <label>Tipo de Ciudadano - Cliente</label>
                                                </td>
                                                <td>
                                                    <select name="ciudadano" id="ciudadano" style="width: 400px" title="Eliga como desea ser tratado." required>
                                                        <option value="">seleccione una</option> 
                                                        <% Consultas lista1=new Consultas(); 
                                                        String [] ciudadano=lista1.valores("ciudadano", "ciu_Nombre", "*");   
                                                        for (int row =0;row<ciudadano.length; row++){
                                                            %>
                                                            <option value="<%= row+1%>"><%=ciudadano[row]%></option> 
                                                            <%                   
                                                        }                          
                                                        %>
                                                    </select>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>               
                                </tr>
                                <tr>
                                    <td>
                                        <table style="width: 1250px" >
                                            <tr>           
                                                <td style="padding: 0px"> 
                                                    <p class="solicitudes"> DATOS  DEL CIUDADANO CLIENTE QUE RADICA LA PQRSF</p>
                                                    <p class="letra2">Señor(a) usuario favor relacione los datos que se solicitan para poder brindarle una respuesta.</p>
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
                                                            <td>
                                                                 <label  for="Celular">Telefono o Celular: </label>
                                                                  <br>
                                                                <input type="text" name="Celular" id="Celular" placeholder="" pattern="[0-9]+" title="Solo números." required />
                                                            </td>                                            
                                                            <td colspan="3"> 
                                                                <table>
                                                                    <tr>
                                                                        <td class="letra2">
                                                                            Desea que se le notifique la Respuesta por que medio:
                                                                        </td> 
                                                                        <td title="Tomando en cuenta la Dirección de Residencia.">
                                                                            <label>Físico</label>
                                                                            <br>
                                                                            <input type="radio" name="medio" id="medio" value="1"/>
                                                                        </td>
                                                                        <td title="Le enviaremos notificación a su Correo Electrónico.">
                                                                            <label>Correo Electrónico</label>
                                                                            <br>
                                                                            <input type="radio" name="medio" id="medio" value="2"/>
                                                                        </td>
                                                                        <td title="Desde nusetra opción (CONSULTAR ESTADO PQRSF).">
                                                                            <label>Web (ISOS PQRSF)</label>
                                                                            <br>
                                                                            <input type="radio" name="medio" checked id="medio" value="3"/>
                                                                        </td>                                                         
                                                                    </tr>
                                                                </table>
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
                                        <table style="width: 1250px">
                                            <tr>
                                                <td>
                                                    <label for="asunto">Asunto: </label> 
                                                    <br>
                                                    <input type="text" style="width: 400px;" class="letra" id="asunto" name="asunto" placeholder="" title="Si desea omitir escriba 'Sin asunto'." pattern="[A-Z][a-z- ]+"/>
                                                </td>   
                                                <td>
                                                    <label for="proceso">Dependencia a la cual corresponde la PQRSF: </label>  
                                                    <br>
                                                    <select name="proceso" id="proceso" style="width: 350px" title="Eliga el área responsable de su Solicitud PQRSF." required>
                                                        <option selected value="">Seleccione una </option>  
                                                        <% Consultas lista6=new Consultas();
                                                        String [] Lproceso=lista6.valores("proceso", "pro_Nombre", "*");   
                                                        for (int row =0;row<Lproceso.length; row++){
                                                            %>
                                                            <option value="<%= row+1%>"><%=Lproceso[row]%></option>
                                                            <%                   
                                                        }                          
                                                        %>
                                                    </select>
                                                </td>
                                            </tr>
                                        </table> 
                                    </td>
                                </tr>    
                                <tr>
                                    <td>
                                        <table style="width: 1250px">                                
                                            <tr>
                                                <td style="padding: 0px">                   
                                                    <p class="solicitudes">DESCRIBA LA SITUACIÓN PRESENTADA</p> 
                                                    <p class="letra2" >(Trate de indicar los datos más exactos posibles)</p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td  style="padding-left: 5px; ">
                                                    <textarea class="letra"  cols="102"  rows="10" name="Contenido" id="Contenido" title="Recuerde que no se aceptará lenguaje obsceno, irrespetuoso, y cualquier otro tipo de expresión verbal ofensiva." placeholder="" required="required" ></textarea>
                                                  </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="anexo">Si anexa documentos relaciónelos aquí: </label> 
                                                    <input type="file" name="anexo" id="anexo" /> 
                                                </td>                                            
                                            </tr>                               
                                        </table>     
                                    </td>                   
                                </tr>    
                                <tr>
                                    <td>       
                                        <hr class="solicitudes"/>                                
                                    </td>
                                </tr>
                                <tr>
                                    <td>   
                                        <input type="button" class="sub2" onclick="document.location='../../index.html'" value="Cancelar" />
                                        <input type="submit" class="sub1" value="Enviar" onclick="<%solicitud.var=0; %>" />
                                    </td>
                                </tr>
                            </table>
                        </form>   
                                    </td>
                                </tr>
            </table>
        </section>       
        <%
            }
        %>
        
                                                    <footer class="fondo" >
                                                        <p>También puede radicar su PQRS directamente en aplicativo de la pagina web o escribiendo al correo servicioalciudadano@sena.edu.co
                                                            Mayor información: www.sena.edu.co en Servicio al Ciudadano</p>                                                        
                                                    </footer>  
    </center>                           
    </body>
</html>
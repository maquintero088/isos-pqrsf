<%-- 
    Document   : f_Rol
    Created on : 7/05/2014, 02:46:48 PM
    Author     : USUARIO
--%>
 
<%@page import="Gestion.Gestion"%>
<%@page import="GestionUsuarios.rol"%>
<%@page import="ISOSPQRSFDB.Consultas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <link href="../../../images/logo.png" type="image/x-icon" rel="shortcut icon" />
        <title>Formato del Rol</title>
        <style>
                 @import "../../../css/css.css";
        </style>
    </head>
    <body>
        <center>
            <%  
            Consultas consultas = new Consultas();
                if(request.getParameter("validacion")==null){%>
                <center>
                    <table class="fondo" style="margin-top: 200px">
                        <tr>
                            <td>
                                <img src="http://biblioteca2.uc3m.es/Leganes/sinlugaradudas/wp-content/uploads/2012/10/Error-s%C3%ADmbolo.png" width="50">                            
                            </td>
                            <td>
                                <h3>Por favor Inicie Sesión</h3>
                                <input type="button" class="op1" style="width: 100px" value="aceptar" onclick="document.location='../../../sesion/F_Sesion.jsp'">
                            </td>                        
                        </tr>
                    </table>
                </center>   
                <%}else{
                %>
        <center>
            <%            
            Gestion gestion= new Gestion();      
        %>
            <div class="usuarios"> 
            <header style="float: none ">
                <img src="../../../images/isospqrsf.png" width="100" onClick="document.location = 'index.html'" align="center" alt="LOGO"/>         
            </header>            
            <table>             
            <tr> 
                <td class="sub2" onClick="document.location = '../../../sesion/F_Sesion.jsp'">
                    <img src="../../../images/atras.png" width="30" title="Volver a la Pagina Principal"  alt="atras"/>
                </td> 
                <%if(gestion.privilegio(1, gestion.seguimiento(), "Crear")==1){%>
                <td>
                    <form action="F_Rol.jsp" method="post"> 
                        <input type="hidden" name="validacion" id="validacion" value="<%=request.getParameter("password")%>">
                        <input type="submit" class="sub3" value="NUEVO ROL" />  
                    </form>
                </td>
                <%}%>  
                <%if(gestion.privilegio(1, gestion.seguimiento(), "Consultar")==1){%>
                <td>
                    <form action="B_Rol.jsp" method="post">
                        <input type="hidden" name="validacion" id="validacion" value="<%=request.getParameter("password")%>">
                        <input type="submit" class="sub3" value="MIS ROLES" />  
                    </form>
                </td>
                <%}%>
            </tr>   
            </table>
            </div> 
    </center>  
             
        <section style="float: none">
            <% 
                if(consultas.valores("rol", "rol_Codigo", "rol_Codigo", request.getParameter("Codigo"))==null){
                    System.out.println(request.getParameter("Codigo"));
                    %>
                    <form action="S_Rol.jsp" method="post">
                        <table class="usuarios" >
                            <tr>
                                <td>
                                    <table class="fondo">
                                        <tr>                
                                            <td> 
                                        <center>                                            
                                            <table style="width: 800px">
                                                <tr>
                                                    <td>
                                                        <label for="Nombre">Nombre: </label>
                                                        <input type="text" name="Nombre" id="Nombre" placeholder="Digite el nombre del rol" required/>                   
                                                    </td>                                         
                                                </tr>
                                                <tr>
                                                    <td>
                                                <center>
                                                    <table class="blanco2">                                                            
                                                        <tr>    
                                                            <td >                                                                    
                                                            </td>
                                                            <td class="blanco">
                                                                <h5>USUARIOS/ROLES</h5>                                                           
                                                            </td>
                                                            <td class="blanco">
                                                                <h5>SOLICITUDES</h5>
                                                            </td>
                                                            <td class="blanco">
                                                                <h5>RESPUESTAS</h5>
                                                            </td>
                                                            <td class="blanco">
                                                                <h5>INFORMES/REPORTES</h5>
                                                            </td>                                                            
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <label for="Nombre">Crear: </label>
                                                            </td>
                                                            <td>
                                                                <select style="width: 100px" name="crear-USUARIOS" id="crear-USUARIOS">
                                                                    <option value="0">No</option>
                                                                    <option value="1">Si</option>
                                                                </select>
                                                            </td>
                                                            <td>
                                                                <select style="width: 100px"  name="crear-SOLICITUDES" id="crear-SOLICITUDES">
                                                                    <option value="0">No</option>
                                                                    <option value="1">Si</option>
                                                                </select>
                                                            </td>
                                                            <td>
                                                                <select style="width: 100px" name="crear-RESPUESTAS" id="crear-RESPUESTAS">
                                                                    <option value="0">No</option>
                                                                    <option value="1">Si</option>
                                                                </select>
                                                            </td>
                                                            <td>
                                                                <select style="width: 100px" name="crear-INFORMES" id="crear-INFORMES">
                                                                    <option value="0">No</option>
                                                                    <option value="1">Si</option>
                                                                </select>
                                                            </td>
                                                        </tr>                                                        
                                                        <tr>
                                                            <td>
                                                                <label for="Nombre">Actualizar: </label>
                                                            </td>
                                                            <td>
                                                                <select style="width: 100px" name="actualizar-USUARIOS" id="actualizar-USUARIOS">
                                                                    <option value="0">No</option>
                                                                    <option value="1">Si</option>
                                                                </select>
                                                            </td>
                                                            <td>
                                                                <select style="width: 100px"  name="actualizar-SOLICITUDES" id="actualizar-SOLICITUDES">
                                                                    <option value="0">No</option>
                                                                    <option value="1">Si</option>
                                                                </select>
                                                            </td>
                                                            <td>
                                                                <select style="width: 100px" name="actualizar-RESPUESTAS" id="actualizar-RESPUESTAS">
                                                                    <option value="0">No</option>
                                                                    <option value="1">Si</option>
                                                                </select>
                                                            </td>
                                                            <td>
                                                                <select style="width: 100px" name="actualizar-INFORMES" id="actualizar-INFORMES">
                                                                    <option value="0">No</option>
                                                                    <option value="1">Si</option>
                                                                </select>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <label for="Nombre">Estado: </label>
                                                            </td>
                                                            <td>
                                                                <select style="width: 100px" name="estado-USUARIOS" id="estado-USUARIOS">
                                                                    <option value="0">No</option>
                                                                    <option value="1">Si</option>
                                                                </select>
                                                            </td>
                                                            <td>
                                                                <select style="width: 100px"  name="estado-SOLICITUDES" id="estado-SOLICITUDES">
                                                                    <option value="0">No</option>
                                                                    <option value="1">Si</option>
                                                                </select>
                                                            </td>
                                                            <td>
                                                                <select style="width: 100px" name="estado-RESPUESTAS" id="estado-RESPUESTAS">
                                                                    <option value="0">No</option>
                                                                    <option value="1">Si</option>
                                                                </select>
                                                            </td>
                                                            <td>
                                                                <select style="width: 100px" name="estado-INFORMES" id="estado-INFORMES">
                                                                    <option value="0">No</option>
                                                                    <option value="1">Si</option>
                                                                </select>
                                                            </td>                                                          
                                                        </tr> 
                                                        <tr>
                                                            <td>
                                                                <label for="Nombre">Consultar: </label>
                                                            </td>
                                                            <td>
                                                                <select style="width: 100px" name="consultar-USUARIOS" id="consultar-USUARIOS">
                                                                    <option value="0">No</option>
                                                                    <option value="1">Si</option>
                                                                </select>
                                                            </td>
                                                            <td>
                                                                <select style="width: 100px"  name="consultar-SOLICITUDES" id="consultar-SOLICITUDES">
                                                                    <option value="0">No</option>
                                                                    <option value="1">Si</option>
                                                                </select>
                                                            </td>
                                                            <td>
                                                                <select style="width: 100px" name="consultar-RESPUESTAS" id="consultar-RESPUESTAS">
                                                                    <option value="0">No</option>
                                                                    <option value="1">Si</option>
                                                                </select>
                                                            </td>
                                                            <td>
                                                                <select style="width: 100px" name="consultar-INFORMES" id="consultar-INFORMES">
                                                                    <option value="0">No</option>
                                                                    <option value="1">Si</option>
                                                                </select>
                                                            </td>     
                                                        </tr>                                             
                                                    </table> 
                                                </center>
                                            </tr>
                                            <tr>
                                                <td>       
                                                    <hr/>                                
                                                </td>
                                            </tr>
                                            <tr>
                                                <td> 
                                                    <input type="reset" class="sub2" value="Cancelar" onclick="document.location='Rol.jsp'" /> 
                                                    <input type="submit" class="sub1" value="Guardar" />   
                                                </td>                                   
                                            </tr>
                                            </table>
                                        </center>                                                                                                                                                                                        
                                    </td>
                                </tr>
                        </table>  
                                </td>
                            </tr>
                        </table>                        
                    </form> 
                    <%
                }else{
                    String rol_Codigo=request.getParameter("Codigo");
                    %>
                    <form action="S_Rol.jsp" method="post">
                        <table class="usuarios" >
                            <tr>
                                <td>
                                    <table class="fondo">
                                        <tr>                
                                            <td> 
                                        <center>                                            
                                            <table style="width: 800px">
                                                <tr>
                                                    <td>
                                                        <label for="Nombre">Nombre: </label>
                                                        <input type="text" name="Nombre" id="Nombre" value="<%= consultas.valores("rol", "rol_Nombre", "rol_Codigo", rol_Codigo) %>" required/>                   
                                                    </td>                                         
                                                </tr>
                                                <tr>
                                                    <td>
                                                <center>
                                                    <table class="blanco2">                                                            
                                                        <tr>    
                                                            <td >                                                                    
                                                            </td>
                                                            <td class="blanco">
                                                                <h5>USUARIOS/ROLES</h5>                                                           
                                                            </td>
                                                            <td class="blanco">
                                                                <h5>SOLICITUDES</h5>
                                                            </td>
                                                            <td class="blanco">
                                                                <h5>RESPUESTAS</h5>
                                                            </td>
                                                            <td class="blanco">
                                                                <h5>INFORMES/REPORTES</h5>
                                                            </td>                                                            
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <label for="Nombre">Crear: </label>
                                                            </td>
                                                            <td>
                                                                <select style="width: 100px" name="crear-USUARIOS" id="crear-USUARIOS" required>
                                                                    <option selected value="" disabled><%= consultas.privilegios(1, rol_Codigo, "Crear") %></option>
                                                                    <option value="0">No</option>
                                                                    <option value="1">Si</option>
                                                                </select>
                                                            </td>
                                                            <td>
                                                                <select style="width: 100px"  name="crear-SOLICITUDES" id="crear-SOLICITUDES">
                                                                    <option selected value="" disabled><%= consultas.privilegios(2, rol_Codigo, "Crear") %></option>
                                                                    <option value="0">No</option>
                                                                    <option value="1">Si</option>
                                                                </select>
                                                            </td>
                                                            <td>
                                                                <select style="width: 100px" name="crear-RESPUESTAS" id="crear-RESPUESTAS">
                                                                    <option selected value="" disabled><%= consultas.privilegios(3, rol_Codigo, "Crear") %></option>
                                                                    <option value="0">No</option>
                                                                    <option value="1">Si</option>
                                                                </select>
                                                            </td>
                                                            <td>
                                                                <select style="width: 100px" name="crear-INFORMES" id="crear-INFORMES">
                                                                    <option selected value="" disabled><%= consultas.privilegios(4, rol_Codigo, "Crear") %></option> 
                                                                    <option value="0">No</option>
                                                                    <option value="1">Si</option>
                                                                </select>
                                                            </td>
                                                        </tr>                                                        
                                                        <tr>
                                                            <td>
                                                                <label for="Nombre">Actualizar: </label>
                                                            </td>
                                                            <td>
                                                                <select style="width: 100px" name="actualizar-USUARIOS" id="actualizar-USUARIOS">
                                                                    <option selected value="" disabled><%= consultas.privilegios(1, rol_Codigo, "Actualizar") %></option>
                                                                    <option value="0">No</option>
                                                                    <option value="1">Si</option>
                                                                </select>
                                                            </td>
                                                            <td>
                                                                <select style="width: 100px"  name="actualizar-SOLICITUDES" id="actualizar-SOLICITUDES">
                                                                    <option selected value="" disabled><%= consultas.privilegios(2, rol_Codigo, "Actualizar") %></option>
                                                                    <option value="0">No</option>
                                                                    <option value="1">Si</option>
                                                                </select>
                                                            </td>
                                                            <td>
                                                                <select style="width: 100px" name="actualizar-RESPUESTAS" id="actualizar-RESPUESTAS">
                                                                    <option selected value="" disabled><%= consultas.privilegios(3, rol_Codigo, "Actualizar") %></option>
                                                                    <option value="0">No</option>
                                                                    <option value="1">Si</option>
                                                                </select>
                                                            </td>
                                                            <td>
                                                                <select style="width: 100px" name="actualizar-INFORMES" id="actualizar-INFORMES">
                                                                    <option selected value="" disabled><%= consultas.privilegios(4, rol_Codigo, "Actualizar") %></option>
                                                                    <option value="0">No</option>
                                                                    <option value="1">Si</option>
                                                                </select>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <label for="Nombre">Estado: </label>
                                                            </td>
                                                            <td>
                                                                <select style="width: 100px" name="estado-USUARIOS" id="estado-USUARIOS">
                                                                    <option selected value="" disabled><%= consultas.privilegios(1, rol_Codigo, "Estado") %></option>
                                                                    <option value="0">No</option>
                                                                    <option value="1">Si</option>
                                                                </select>
                                                            </td>
                                                            <td>
                                                                <select style="width: 100px"  name="estado-SOLICITUDES" id="estado-SOLICITUDES">
                                                                    <option selected value="" disabled><%= consultas.privilegios(2, rol_Codigo, "Estado") %></option>
                                                                    <option value="0">No</option>
                                                                    <option value="1">Si</option>
                                                                </select>
                                                            </td>
                                                            <td>
                                                                <select style="width: 100px" name="estado-RESPUESTAS" id="estado-RESPUESTAS">
                                                                    <option selected value="" disabled><%= consultas.privilegios(3, rol_Codigo, "Estado") %></option>
                                                                    <option value="0">No</option>
                                                                    <option value="1">Si</option>
                                                                </select>
                                                            </td>
                                                            <td>
                                                                <select style="width: 100px" name="estado-INFORMES" id="estado-INFORMES">
                                                                    <option selected value="" disabled><%= consultas.privilegios(4, rol_Codigo, "Estado") %></option>
                                                                    <option value="0">No</option>
                                                                    <option value="1">Si</option>
                                                                </select>
                                                            </td>                                                          
                                                        </tr> 
                                                        <tr>
                                                            <td>
                                                                <label for="Nombre">Consultar: </label>
                                                            </td>
                                                            <td>
                                                                <select style="width: 100px" name="consultar-USUARIOS" id="consultar-USUARIOS">
                                                                    <option selected value="" disabled><%= consultas.privilegios(1, rol_Codigo, "Consultar") %></option>
                                                                    <option value="0">No</option>
                                                                    <option value="1">Si</option>
                                                                </select>
                                                            </td>
                                                            <td>
                                                                <select style="width: 100px"  name="consultar-SOLICITUDES" id="consultar-SOLICITUDES">
                                                                    <option selected value="" disabled><%= consultas.privilegios(2, rol_Codigo, "Consultar") %></option>
                                                                    <option value="0">No</option>
                                                                    <option value="1">Si</option>
                                                                </select>
                                                            </td>
                                                            <td>
                                                                <select style="width: 100px" name="consultar-RESPUESTAS" id="consultar-RESPUESTAS">
                                                                    <option selected value="" disabled><%= consultas.privilegios(3, rol_Codigo, "Consultar") %></option>
                                                                    <option value="0">No</option>
                                                                    <option value="1">Si</option>
                                                                </select>
                                                            </td>
                                                            <td>
                                                                <select style="width: 100px" name="consultar-INFORMES" id="consultar-INFORMES">
                                                                    <option selected value="" disabled><%= consultas.privilegios(4, rol_Codigo, "Consultar") %></option>
                                                                    <option value="0">No</option>
                                                                    <option value="1">Si</option>
                                                                </select>
                                                            </td>     
                                                        </tr>                                             
                                                    </table> 
                                                </center>
                                            </tr>
                                            <tr>
                                                <td>       
                                                    <hr/>                                
                                                </td>
                                            </tr>
                                            <tr>
                                                <td> 
                                                     <input type="hidden" name="update" id="update" value="<%= rol_Codigo%>"/> 
                                                    <input type="submit" class="sub1" value="Guardar" />   
                                                </td>                                   
                                            </tr>
                                            </table>
                                        </center>                                                                                                                                                                                        
                                    </td>
                                </tr>
                        </table>  
                                </td>
                            </tr>
                        </table>                        
                    </form> 
                    <%
                }
            %>
            
                                            
        </section>
            <%}%>
        </center>
</body>
</html>

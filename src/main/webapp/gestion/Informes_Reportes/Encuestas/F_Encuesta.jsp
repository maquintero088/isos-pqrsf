<%-- 
    Document   : formulario
    Created on : 11/04/2014, 08:01:10 AM
    Author     : M�rcel
--%>

<%@page import="Gestion.Gestion"%>
<%@page import="ISOSPQRSFDB.Consultas"%>
<%@page import="GestionUsuarios.usuario"%>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../../images/logo.png" type="image/x-icon" rel="shortcut icon" /> 
        <title>Nuevo Usuario</title>            
        <style>
            @import "../../../css/css.css";
        </style>
    </head>
    <body >               
    <center>        
        <%  
            Consultas consultas = new Consultas();            
            Gestion gestion= new Gestion();      
        %>        
        <div class="usuarios">
                        <header style="float: none ">
                            <img src="../../../images/isospqrsf.png" width="100" onClick="document.location = 'index.html'" align="center" alt="LOGO"/>                             
                        </header>
            <table>             
                <tr>
                    <td class="sub2" onClick="document.location = '../../Gestion.jsp'">
                        <img src="../../../images/atras.png" width="30" title="Volver a la Pagina Principal"  alt="atras"/>
                    </td> 
                    <%if(gestion.privilegio(1, gestion.seguimiento(), "Crear")==1){%>
                    <td class="sub3"  onclick="document.location='F_Usuario.jsp'">
                        <h3>NUEVO USUARIO</h3>
                    </td>
                    <%}%>
                    <%if(gestion.privilegio(1, gestion.seguimiento(), "Consultar")==1){%>
                    <td  class="sub3" onclick="document.location='B_Usuario.jsp'">
                        <h3>MIS USUARIOS</h3>
                    </td>
                    <%}%>
                </tr>   
            </table>
        </div> 
        <section  style="float: none">      
            <% 
                if(consultas.valores("usuario", "usu_Id", "usu_Id", request.getParameter("Id"))==null){
                    System.out.println(request.getParameter("Id"));
            %>
            <form name="usuario"  id="usuario" action="S_Usuario.jsp" method="post">  
                <table style="text-align: center;">
                    <tr>
                        <td>                                     
                            <table>
                                <tr>
                                    <td colspan="4"> 
                                        
                                        
                                    </td>  
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <table class="blanco" style="width: 900px">
                                            <tr>
                                                <td>
                                                    <img src="../../../images/sena (12).jpg" width="100" alt=""/>                                            
                                                </td>  
                                                <td>
                                                    <h4 class="letra">SERVICIO NACIONAL DE APRENDIZAJE SENA </h4>
                                                    <h5 class="letra"> SISTEMA INTEGRADO DE GESTIÓN </h5>
                                                    <h6 class="letra">Procedimiento Petición,Queja,Reclamo,Sugerencias y Felicitaciones </h6>
                                                    <h6 class="letra">Formato Registro para Lideres de Proceso de Gestión SENA</h6>
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
                                                            <td>
                                                                Codígo:
                                                            </td>
                                                            <td>
                                                                F001-P004-REGC
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
                                        <label for="nombre1">* Primer Nombre:</label>
                                        <br>
                                        <input type="text" name="nombre1" id="nombre1" placeholder="Aaaaa" pattern="[A-Z][a-z- ]+" required />                   
                                    </td>                                    <td>
                                        <label for="nombre2">Segundo Nombre:</label>
                                        <br>
                                        <input type="text" name="nombre2" id="nombre2" placeholder="Aaaaa" pattern="[A-Z][a-z- ]+"/>                       
                                    </td>
                                    <td>
                                        <label for="apellido1">* Primer Apellido:</label>
                                        <br>
                                        <input type="text" name="apellido1" id="apellido1" placeholder="Aaaaa" pattern="[A-Z][a-z- ]+" required/>
                                    </td>
                                    <td>
                                        <label for="apellido2">Segundo Apellido:</label>
                                        <br>
                                        <input type="text" name="apellido2" id="apellido2" placeholder="Aaaaa" pattern="[A-Z][a-z- ]+" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="celular" >* Celular:</label>
                                        <br>
                                        <input type="tel" name="celular" id="celular" placeholder="Aaaaa" pattern="[0-9]+" required>
                                    </td>  
                                    <td>
                                        <label for="genero">Género:</label>
                                        <br>
                                        <select name="genero" id="genero" required>
                                            <option selected value="">Seleccione una </option>
                                            <% Consultas lista3=new Consultas();  
                                            String [] Lgenero=lista3.valores("genero", "gen_Nombre", "*");   
                                            for (int row =0;row<Lgenero.length; row++){
                                                %>
                                                <option value="<%= row+1%>"><%=Lgenero[row]%></option>
                                                <%                   
                                            }                          
                                            %>
                                          </select> 
                                    <td colspan="2">
                                        <label for="municipio">Municipio:</label>
                                        <br>
                                        <select name="municipio" id="municipio" required>
                                            <option selected value="">Seleccione una </option>
                                            <% Consultas lista4=new Consultas();
                                            String [] Lmunicipio=lista4.valores("municipio", "mun_Nombre", "*");   
                                            for (int row =0;row<Lmunicipio.length; row++){
                                                %>
                                                <option value="<%= row+1%>"><%=Lmunicipio[row]%></option>
                                                <%}%>
                                        </select>
                                    </td>      
                                </tr>               
                                <tr>
                                    <td colspan="4">
                                <center>
                                    <table>
                                        <tr>
                                            <td colspan="2">
                                                <label for="correo">* Correo Institucional:</label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <input type="text" style="text-align: right" title="correo" name="correo" id="correo"  required/> 
                                            </td>
                                            <td style="padding: 0px; text-align: left;">                                    
                                                    @                 
                                                    <select name="cuenta" id="cuenta" required>            
                                                        <option selected value="">Seleccione una </option>
                                                        <option value="misena.edu.co">misena.edu.co</option>
                                                        <option value="sena.edu.co">sena.edu.co</option>
                                                    </select> 
                                                </td>  
                                            </tr>
                                        </table>
                                </center>                                          
                                        </td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="padding: 0px;">
                                        <hr/>
                                    </td>                      
                                </tr>
                                <tr>
                                     <td>
                                        <label for="documento">Tipo de Documento:</label>
                                        <br>
                                        <select name="documento" id="documento" required>
                                            <option selected value="">Seleccione una </option>
                                            <% Consultas lista=new Consultas();
                                            String [] Ldocumento=lista.valores("documento", "doc_Nombre", "*");   
                                            for (int row =0;row<Ldocumento.length; row++){
                                                %>
                                                <option value="<%= row+1%>"><%=Ldocumento[row]%></option>
                                                <%                   
                                            }                          
                                            %>
                                        </select>
                                    </td>
                                    <td>
                                        <label for="id">Numero de Documento:</label>
                                        <br>
                                        <input type="text" name="id" id="id"  required/>
                                    </td>
                                    <td colspan="2">
                                         <label for="proceso">Proceso de Gestion SENA:</label>
                                        <br>
                                        <select name="proceso" id="proceso" required>
                                            <option selected value="">Seleccione una </option>   
                                            <% Consultas lista2=new Consultas();
                                            String [] Lproceso=lista2.valores("proceso", "pro_Nombre", "*");   
                                            for (int row =0;row<Lproceso.length; row++){
                                                %>
                                                <option value="<%= row+1%>"><%=Lproceso[row]%></option>
                                                <%                   
                                            }                          
                                            %>
                                        </select> 
                                    </td>
                                </tr>
                                <tr>  
                                    <td>
                                        <label for="password">Contraseña:</label>
                                        <br>
                                        <input type="password" name="password" id="password" title="Mínimo 8 carcteres" pattern="{8}+" required/>
                                    </td>
                                    <td>
                                        <label for="password2">Confirmar Contraseña:</label>
                                        <br>
                                        <input type="password" name="password2" id="password2" title="Mínimo 8 carcteres" pattern="{8}+" required/> 
                                    </td>
                                    <td colspan="2">
                                        <label for="rol">Rol:</label>
                                        <br>
                                        <select name="rol" id="rol" required>
                                            <option selected value="">Seleccione una </option>   
                                            <% 
                                            String [] Lrol=consultas.valores("rol", "rol_Nombre", "*");    
                                            for (int row =0;row<Lrol.length; row++){
                                                %>
                                                <option value="<%= row+1%>"><%=Lrol[row]%></option>
                                                <%                   
                                            }                          
                                            %>
                                        </select> 
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="padding: 0px;">
                                        <hr class="marco4"/>
                                    </td>                      
                                </tr>
                                <tr>
                                    <td colspan="4">
                                <center>
                                    <table>
                                        <tr>                                  
                                            <td>
                                                <input class='sub2' type="button" name="r_usuario" id="r_usuario" value="Cancelar" onclick="document.location='Usuario.jsp'" /> 
                                            </td>  
                                            <td>                   
                                                <input class='sub1' type="submit" name="s_usuario" id="s_usuario" value="Guardar"/>
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
            <%}else{
                    String usu_Id=request.getParameter("Id");
            %>
            <form name="usuario"  id="usuario" action="S_Usuario.jsp" method="post">  
                <table style="text-align: center;">
                    <tr>
                        <td>                                     
                            <table>
                                <tr>
                                    <td colspan="4"> 
                                        
                                        
                                    </td>  
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <table class="blanco" style="width: 900px">
                                            <tr>
                                                <td>
                                                    <img src="../../../images/sena (12).jpg" width="100" alt=""/>                                            
                                                </td>  
                                                <td>
                                                    <h4 class="letra">SERVICIO NACIONAL DE APRENDIZAJE SENA </h4>
                                                    <h5 class="letra"> SISTEMA INTEGRADO DE GESTIÓN </h5>
                                                    <h6 class="letra">Procedimiento Petición,Queja,Reclamo,Sugerencias y Felicitaciones </h6>
                                                    <h6 class="letra">Formato Registro para Lideres de Proceso de Gestión SENA</h6>
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
                                                            <td>
                                                                Codígo:
                                                            </td>
                                                            <td>
                                                                F001-P004-REGC
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
                                        <label for="nombre1">* Primer Nombre:</label>
                                        <br>
                                        <input type="text" name="nombre1" id="nombre1" value="<%= consultas.valores("usuario", "usu_Primernombre", "usu_Id", usu_Id)%>" pattern="[A-Z-Ñ][a-z ]+"  />                   
                                    </td>                                    <td>
                                        <label for="nombre2">Segundo Nombre:</label>
                                        <br>
                                        <input type="text" name="nombre2" id="nombre2" value="<%= consultas.valores("usuario", "usu_Segundonombre", "usu_Id", usu_Id)%>" pattern="[A-Z-Ñ][a-z ]+"/>                       
                                    </td>
                                    <td>
                                        <label for="apellido1">* Primer Apellido:</label>
                                        <br>
                                        <input type="text" name="apellido1" id="apellido1" value="<%= consultas.valores("usuario", "usu_Primerapellido", "usu_Id", usu_Id)%>" pattern="[A-Z-Ñ][a-z ]+" />
                                    </td>
                                    <td>
                                        <label for="apellido2">Segundo Apellido:</label>
                                        <br>
                                        <input type="text" name="apellido2" id="apellido2" value="<%= consultas.valores("usuario", "usu_Segundoapellido", "usu_Id", usu_Id)%>" pattern="[A-Z-Ñ][a-z ]+" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="celular" >* Celular:</label>
                                        <br>
                                        <input type="tel" name="celular" id="celular" value="<%= consultas.valores("usuario", "usu_Celular", "usu_Id", usu_Id)%>" pattern="[0-9]+" >
                                    </td>  
                                    <td>
                                        <label for="genero">Género:</label>
                                        <br>
                                        <select name="genero" id="genero" >
                                            <option selected value="<%=consultas.valores("usuario", "fk_gen_Codigo", "usu_Id", usu_Id)%>">
                                                <%= consultas.valores("genero", "gen_Nombre", "gen_Codigo", 
                                                    consultas.valores("usuario", "fk_gen_Codigo", "usu_Id", usu_Id))%></option>
                                            <% Consultas lista3=new Consultas();  
                                            String [] Lgenero=lista3.valores("genero", "gen_Nombre", "*");   
                                            for (int row =0;row<Lgenero.length; row++){
                                                %>
                                                <option value="<%= row+1%>"><%=Lgenero[row]%></option>
                                                <%                   
                                            }                          
                                            %>
                                          </select> 
                                    <td>
                                        <label for="municipio">Municipio:</label>
                                        <br>
                                        <select name="municipio" id="municipio" >
                                            <option selected value="<%=consultas.valores("usuario", "fk_mun_Codigo", "usu_Id", usu_Id)%>">
                                                <%= consultas.valores("municipio", "mun_Nombre", "mun_Codigo", 
                                                    consultas.valores("usuario", "fk_mun_Codigo", "usu_Id", usu_Id))%></option>
                                            <% Consultas lista4=new Consultas();
                                            String [] Lmunicipio=lista4.valores("municipio", "mun_Nombre", "*");   
                                            for (int row =0;row<Lmunicipio.length; row++){
                                                %>
                                                <option value="<%= row+1%>"><%=Lmunicipio[row]%></option>
                                                <%}%>
                                        </select>
                                    </td>  
                                    <td>
                                <center>
                                    <table>
                                        <tr>
                                            <td>
                                                <label for="correo">* Correo Institucional:</label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <input type="email" style="text-align: right" title="correo" name="correo" id="correo" value="<%= consultas.valores("usuario", "usu_Correo", "usu_Id", usu_Id)%>" /> 
                                            </td>                                             
                                            </tr>
                                        </table>
                                </center>                                          
                                        </td>     
                                </tr> 
                                <tr>
                                    <td colspan="4" style="padding: 0px;">
                                        <hr/>
                                    </td>                      
                                </tr>
                                <tr>
                                     <td>
                                        <label for="documento">Tipo de Documento:</label>
                                        <br>
                                        <select name="documento" id="documento" >
                                            <option selected value="<%=consultas.valores("usuario", "fk_doc_Codigo", "usu_Id", usu_Id)%>">
                                                <%= consultas.valores("documento", "doc_Nombre", "doc_Codigo", 
                                                    consultas.valores("usuario", "fk_doc_Codigo", "usu_Id", usu_Id))%></option>
                                            <% Consultas lista=new Consultas();
                                            String [] Ldocumento=lista.valores("documento", "doc_Nombre", "*");   
                                            for (int row =0;row<Ldocumento.length; row++){
                                                %>
                                                <option value="<%= row+1%>"><%=Ldocumento[row]%></option>
                                                <%                   
                                            }                          
                                            %>
                                        </select>
                                    </td>
                                    <td>
                                        <label for="id">Número de Documento:</label>
                                        <br>
                                        <input type="text" name="id" id="id" value="<%= usu_Id%>" />
                                    </td>
                                    <td>
                                         <label for="proceso">Proceso de Gestion SENA:</label>
                                        <br>
                                        <select name="proceso" id="proceso" >   
                                            <option selected value="<%=consultas.valores("usuario", "fk_pro_Codigo", "usu_Id", usu_Id)%>">
                                                <%= consultas.valores("proceso", "pro_Nombre", "pro_Codigo", 
                                                    consultas.valores("usuario", "fk_pro_Codigo", "usu_Id", usu_Id))%></option>  
                                            <% Consultas lista2=new Consultas();
                                            String [] Lproceso=lista2.valores("proceso", "pro_Nombre", "*");   
                                            for (int row =0;row<Lproceso.length; row++){
                                                %>
                                                <option value="<%= row+1%>"><%=Lproceso[row]%></option>
                                                <%                   
                                            }                          
                                            %>
                                        </select> 
                                    </td>
                                    <td> 
                                        <label for="rol">Rol:</label>
                                        <br>
                                        <select name="rol" id="rol" >
                                            <option selected value="<%=consultas.valores("usuario", "fk_rol_Codigo", "usu_Id", usu_Id)%>" disabled>
                                                <%= consultas.valores("rol", "rol_Nombre", "rol_Codigo", 
                                                    consultas.valores("usuario", "fk_rol_Codigo", "usu_Id", usu_Id))%></option> 
                                        </select> 
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="padding: 0px;">
                                        <hr/>
                                    </td>                      
                                </tr>
                                <tr>
                                    <td colspan="4">
                                <center>
                                    <table>
                                        <tr>                                  
                                            <td>
                                                <input class='sub2' type="button" name="r_usuario" id="r_usuario" value="Cancelar" onclick="document.location='Usuario.jsp'" /> 
                                            </td>  
                                            <td>  
                                                <input type="hidden" name="update" id="update" value="<%= usu_Id%>"/>
                                                <input class='sub1' type="submit" name="s_usuario" id="s_usuario" value="Guardar"/>
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
            <%}%>
            
        </section> 
    </center>               
    </body>
</html>

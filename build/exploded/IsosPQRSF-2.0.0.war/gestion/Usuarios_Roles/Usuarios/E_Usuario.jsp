<%-- 
    Document   : B_solicitud
    Created on : 24/05/2014, 02:08:32 PM
    Author     : Márcel
--%>

<%@page import="GestionUsuarios.usuario"%>
<%@page import="Gestion.Gestion"%>
<%@page import="ISOSPQRSFDB.Consultas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">              
        <link href="../../../images/logo.png" type="image/x-icon" rel="shortcut icon" />
        <title>Consulte su PQRSF</title>
        <style>
            @import "../../../css/css.css";
        </style>
    </head>
    <body>
        <%  Gestion gestion= new Gestion();  
            if(usuario.estado==0){
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
                    <form action="F_Usuario.jsp" method="post">
                        <input type="hidden" name="validacion" id="validacion" value="<%=request.getParameter("password")%>">
                        <input type="submit" class="sub3" value="NUEVO USUARIO" />  
                    </form>
                </td>
                    <%}%>
                    <%if(gestion.privilegio(1, gestion.seguimiento(), "Consultar")==1){%>
                    <td>
                    <form action="B_Usuario.jsp" method="post">
                        <input type="hidden" name="validacion" id="validacion" value="<%=request.getParameter("password")%>">
                        <input type="submit" class="sub3" value="MIS USUARIOS" />  
                    </form>
                </td>
                    <%}%>
                </tr>   
            </table>
        </div>                         
    </center>   
               
        <section>
            <table class="usuarios">
                <tr>
                    <td>
                        <%
                        String usu_Id=request.getParameter("usu_Id");
                        %>
                        <form action="E_Usuario.jsp" method="post">
                            <table class="blanco2">
                            <tr>
                                <td colspan="2">
                                    <h3>Estado del Usuario</h3>
                                </td>
                            </tr>
                            <tr>
                            <select name="estado" id="estado" required="">
                                <%if(consultas.valores("usuario", "fk_est_Codigo" , "usu_Id", usu_Id)=="7"){
                                    %>
                                    <option selected value="7">Activo</option>
                                    <option value="8">Inactivo</option>
                                <%
                                }else{
                                    %>
                                    <option  value="7">Activo</option>
                                    <option selected value="8">Inactivo</option>
                                <%
                                }%>
                            </select>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <input type="hidden" name="usu_Id" id="usu_Id" value="<%=usu_Id%>"/>
                                    <input class='sub1' type="submit" name="s_usuario" id="s_usuario" value="Guardar"/>
                                </td>
                            </tr>
                        </table>
                        </form>                        
                    </td>
                </tr>                
            </table>
        </section>
                          <%}
            }else{ 
                
               new ISOSPQRSFDB.ISOSPQRSFDB().Ejecutar("UPDATE usuario SET fk_est_Codigo = "+request.getParameter("estado")+" WHERE usu_Id = "+request.getParameter("usu_Id")+" ;");
              String validacion = gestion.seguimiento(gestion.seguimiento(),1,"Editar Usuario",request.getParameter("update"));  
                %>
                <form action="Usuario.jsp" method="post">
                            <center>
                                <table class="fondo" style="margin-top: 100px">
                                    <tr>
                                        <td> 
                                            EL ESTADO DEL USUARIO HA SIDO ACTUALIZADO CON EXITO A LA FECHA:  
                                            <h3><%= validacion%> </h3>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="submit" class="op1"  value="Aceptar" /> 
                                        </td>
                                    </tr>
                                </table> 
                            </center>
                        </form>
    <%
            }%>
    </body>
</html>

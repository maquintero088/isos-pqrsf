<%-- 
    Document   : B_solicitud
    Created on : 24/05/2014, 02:08:32 PM
    Author     : Márcel
--%>

<%@page import="Gestion.Gestion"%>
<%@page import="ISOSPQRSFDB.Consultas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">              
        <link href="../../../IMAGES/logo.png" type="image/x-icon" rel="shortcut icon" />
        <title>Consulte su PQRSF</title>
        <link href="../../../CSS/css.css" rel="stylesheet" type="text/css"/>
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
                                <input type="button" class="op1" style="width: 100px" value="aceptar" onclick="document.location='../../../Sesion/F_Sesion.jsp'">
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
                            <img src="../../../IMAGES/isospqrsf.png" width="100" onClick="document.location = 'index.html'" align="center" alt="LOGO"/>                             
                        </header>
            <table>             
                <tr>
                    <td class="sub2" onClick="document.location = '../../../Sesion/F_Sesion.jsp'">
                        <img src="../../../IMAGES/atras.png" width="30" title="Volver a la Pagina Principal"  alt="atras"/>
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
    <%
                if(request.getParameter("usu_Id")==null){
                %>
            <form action="B_Usuario.jsp" method="post">
                <table class="blanco2">    
                    <tr>
                        <td>
                            <label for="usu_Id">Numero de Identificación: </label>
                            <input type="text" name="usu_Id" id="usu_Id" pattern="[0-9]+" placeholder="Digite Número de Identificación del Usuario" required/>
                            <input type="submit" value="Buscar" name="Buscar" />
                        </td>
                    </tr>                    
                </table>
            </form>
            <%
            }else  if(consultas.valores("usuario WHERE usu_Id LIKE '"+request.getParameter("usu_Id")+"%'", "usu_Id","usu_Id")==null){
                %>
            <form action="B_Usuario.jsp" method="post">
                <table class="blanco2">
                    <tr>
                        <td>
                            <h3>No se encuentra ningún Rol.</h3>
                        </td>
                    </tr>                    
                </table>
            </form>
            <% 
            }else{                
                        String [] Usuarios = consultas.valores("usuario WHERE usu_Id LIKE '"+request.getParameter("usu_Id")+"%'", "usu_Id","usu_Id");
                        %>
    <form action="B_Usuario.jsp" method="post">
                <table class="blanco2">    
                    <tr>
                        <td>
                            <label for="usu_Nombre">Numero de Identificación: </label>
                            <input type="text" name="usu_Id" id="usu_Id" pattern="[0-9]+" placeholder="Digite Número de Identificación del Usuario" required/>                            
                            <input type="submit" value="Buscar" name="Buscar" />
                        </td>
                    </tr>                    
                </table>
            </form>
            <hr>
    <%
            for(int i=1;i<Usuarios.length;i++){
                if(consultas.valores("usuario", 
                                "concat(usu_Primernombre,' ',usu_Segundonombre,' ',usu_Primerapellido,' ',usu_Segundoapellido)",
                                "usu_Id", Usuarios[i])!=null){                
            %>  <table class="usuarios" style="width: 800px">
                <tr>
                    <td style="width: 300px">
                        <%= consultas.valores("usuario", 
                                "concat(usu_Primernombre,' ',usu_Segundonombre,' ',usu_Primerapellido,' ',usu_Segundoapellido)",
                                "usu_Id", Usuarios[i]) %>
                    </td>
                    <%if(gestion.privilegio(1, gestion.seguimiento(), "Actualizar")==1){%>
                    <td>                         
                        <form action="F_Usuario.jsp" method="post">                        
                            <input type="hidden" name="Id" id="Id" value="<%=Usuarios[i]%>"/> 
                            <input type="submit" class="sub1" value="Abrir"/> 
                        </form>
                    </td>
                    <%}%>
                    <%if(gestion.privilegio(1, gestion.seguimiento(), "Estado")==1){%>
                    <td>
                        <input type="hidden" name="eId" id="eId" value="<%=Usuarios[i]%>"/> 
                        <input type="submit" class="sub1" value="Cambiar Estado"/> 
                    </td>
                    <%}%>
                </tr>
            </table>
                    <%}}}%>
</section>
<%}%>
    </center>        
    </body>
</html>

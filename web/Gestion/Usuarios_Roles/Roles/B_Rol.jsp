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
        <style>
            @import "../../../CSS/css.css";
        </style>
    </head>
    <body>
        <center>
            <%
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
             <%}%>
                
        <section style="float: none">
            <%
                Consultas consultas = new Consultas();
                if(request.getParameter("rol_Nombre")==null){
                %>
            <form action="B_Rol.jsp" method="post">
                <table class="blanco2">
                    <tr>
                        <td>
                            <label for="rol_Nombre">Nombre: </label>
                            <input type="text" name="rol_Nombre" id="rol_Nombre" pattern="[A-Z][a-z- -ñ]+" placeholder="Digite el nombre del rol" required/>
                            <input type="submit" value="Buscar" name="Buscar" />
                        </td>
                    </tr>                    
                </table>
            </form>
            <%
            }else  if(consultas.valores("rol WHERE rol_Nombre LIKE '"+request.getParameter("rol_Nombre")+"%'", "rol_Nombre","rol_Nombre")==null){
                %>
            <form action="B_Rol.jsp" method="post">
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
                        String [] Roles = consultas.valores("rol WHERE rol_Nombre LIKE '"+request.getParameter("rol_Nombre")+"%'", "rol_Codigo","rol_Codigo");
            for(int i=1;i<Roles.length;i++){
            %>
            <form action="B_Rol.jsp" method="post">
                <table class="blanco2">
                    <tr>
                        <td>
                            <label for="rol_Nombre">Nombre: </label>
                            <input type="text" name="rol_Nombre" id="rol_Nombre" pattern="[A-Z][a-z- -ñ]+" placeholder="Digite el nombre del rol" required/>
                            <input type="submit" value="Buscar" name="Buscar" />
                        </td>
                    </tr>                    
                </table>
            </form>
            
                <table class="usuarios" style="width: 800px">
                <tr>
                    <td>
                        <form action="F_Rol.jsp" method="post">                        
                        <%= consultas.valores("rol", 
                                "rol_Nombre", 
                                "rol_Codigo", Roles[i]) %>
                                <input type="hidden" name="Codigo" id="Codigo" value="<%=Roles[i]%>"/>
                                <input type="submit" class="block2" value="Abrir"/>
                        </form>
                    </td>
                </tr>
            </table>  
            
            <%}
                
}%>
        </section>
        </center>
</body>
</html>

<%-- 
    Document   : B_solicitud
    Created on : 24/05/2014, 02:08:32 PM
    Author     : Márcel
--%>

<%@page import="Informes.encuesta"%>
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
            Gestion gestion= new Gestion();      
        %>        
        <div class="informes">
                        <header style="float: none ">
                            <img src="../../../IMAGES/isospqrsf.png" width="100" onClick="document.location = 'index.html'" align="center" alt="LOGO"/>                             
                        </header>
            <table>             
                <tr>
                    <td class="sub2" onClick="document.location = '../Gestion.jsp'">
                        <img src="../../../IMAGES/atras.png" width="30" title="Volver a Gestión"  alt="atras"/>
                    </td> 
                    <%if(gestion.privilegio(4, gestion.seguimiento(), "Crear")==1){%>
                    <td class="sub3"  onclick="document.location='F_Encuesta.jsp'">
                        <h3>NUEVA ENCUESTA</h3>
                    </td>
                    <%}%>
                    <%if(gestion.privilegio(4, gestion.seguimiento(), "Consultar")==1){%>
                    <td  class="sub3" onclick="document.location='B_Encuesta.jsp'">
                        <h3>MIS ENCUESTAS</h3>
                    </td>
                    <%}%>
                </tr>   
            </table>
        </div> 
<section>
    <%
                if(encuesta.Fecha==null){
                %>
            <form action="B_Encuesta.jsp" method="post">
                <table class="blanco2">    
                    <tr>
                        <td>
                            <label for="day">Día</label>
                            <input type="number" name="day" id="day" pattern="[0-3][0-9]" required />
                        </td>
                        <td>
                            <label for="month">Mes</label>
                            <input type="number" name="month" id="month" pattern="[0-1][0-9]" required />
                        </td>
                        <td>                            
                            <label for="year">Año</label>
                            <input type="number" name="year" id="year" pattern="[0-2][0-9]{3}" required />
                        </td>
                        <td>
                            <input type="submit" value="Buscar" name="Buscar" onclick="<%
                    encuesta.Fecha=request.getParameter("day")+"-"+request.getParameter("month")+"-"+request.getParameter("year"); %>" />
                        </td>
                    </tr>                    
                </table>
            </form>
            <%
            }else  if(consultas.valores("encuesta WHERE enc_Fecha LIKE '"+encuesta.Fecha+"%'", "enc_Id","enc_Id")==null){
                %>
            <form action="B_Encuesta.jsp" method="post">
                <table class="blanco2">
                    <tr>
                        <td>
                            <h3>No se encuentra ningúna Encuesta con esta fecha: <%= encuesta.Fecha%> .</h3>
                        </td>
                    </tr>                    
                </table>
            </form>
            <% 
            }else{                
                        String [] Encuesta = consultas.valores("encuesta WHERE enc_Fecha LIKE '"+encuesta.Fecha+"%'", "enc_Id","enc_Id");
                        %>
    <form action="B_Encuesta.jsp" method="post">
                <table class="blanco2">    
                    <tr>
                        <td>
                            <label for="day">Día</label>
                            <input type="number" name="day" id="day" pattern="[0-3][0-9]" required />
                        </td>
                        <td>
                            <label for="month">Mes</label>
                            <input type="number" name="month" id="month" pattern="[0-1][0-9]" required />
                        </td>
                        <td>                            
                            <label for="year">Año</label>
                            <input type="number" name="year" id="year" pattern="[0-2][0-9]{3}" required />
                        </td>
                        <td>
                            <input type="submit" value="Buscar" name="Buscar" />
                        </td>
                    </tr>                    
                </table>
            </form>
            <hr>
    <%
            for(int i=1;i<Encuesta.length;i++){
                if(consultas.valores("encuesta", 
                                "enc_Fecha",
                                "enc_Id", Encuesta[i])!=null){                
            %>  <table class="informes" style="width: 800px">
                <tr>
                    <td style="width: 300px">
                        <%= consultas.valores("encuesta", 
                                "enc_Fecha",
                                "enc_Id", Encuesta[i]) %>
                    </td>
                    <%if(gestion.privilegio(4, gestion.seguimiento(), "Actualizar")==1){%>
                    <td>                         
                        <form action="F_Encuesta.jsp" method="post">                        
                            <input type="hidden" name="Id" id="Id" value="<%=Encuesta[i]%>"/> 
                            <input type="submit" class="sub1" value="Abrir"/> 
                        </form>
                    </td>
                    <%}%>
                    <%if(gestion.privilegio(4, gestion.seguimiento(), "Estado")==1){%>
                    <td>
                         <form action="E_Encuesta.jsp" method="post">         
                        <input type="hidden" name="eId" id="eId" value="<%=Encuesta[i]%>"/> 
                        <input type="submit" class="sub1" value="Cambiar Estado"/> 
                        </form>
                    </td>
                    <%}%>
                </tr>
            </table>
                    <%}}}%>
</section>      
    </center>        
    </body>
</html>

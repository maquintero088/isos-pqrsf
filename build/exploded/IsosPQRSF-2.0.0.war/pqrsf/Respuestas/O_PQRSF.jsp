<%-- 
    Document   : filtros
    Created on : 21/05/2014, 02:15:37 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>filtros</title>
        <style>
            @import "../../css/css.css";
        </style>
    </head>
    <body>
        <section style="height: 450px">
            <center>
                <form action="<%= request.getParameter("bandeja")%>" method="post">  
                    <table style="padding: 5px; margin-bottom: -50px"> 
                        <tr>
                            <td>
                                <img class="icon1" src="../../images/filtro-alfabetico.png" title="Por Orden Alfabético"/>
                            </td>
                            <td>
                                <img class="icon1" src="../../images/filtro_tipo.png" title="Por Tipo de Solicitud (PQRSF)" />
                            </td>
                            <td>
                                <img class="icon1" src="../../images/filtro_ciudadano.png" title="Por Tipo de Ciudadano - Cliente" />
                            </td> 
                            <td>
                                <img class="icon1" src="../../images/filtro_proceso.png" title="Por Proceso o Dependencia" />
                            </td>
                            <td>
                                <img class="icon1" src="../../images/filtro-fecha.png" title="Por Fecha de Radicación" />
                            </td>                     
                        </tr>
                        <tr>
                            <td>
                                <input type="radio" name="filtro" id="filtro" checked value="sol_Asunto"/>
                            </td>
                            <td>
                                <input type="radio" name="filtro" id="filtro" value="fk_tip_Codigo"/>
                            </td>
                            <td>
                                <input type="radio" name="filtro" id="filtro" value="fk_ciu_Codigo"/>
                            </td> 
                            <td>
                                <input type="radio" name="filtro" id="filtro" value="fk_pro_Codigo"/>
                            </td>
                            <td>
                                <input type="radio" name="filtro" id="filtro" value="sol_Fecha"/>
                            </td>                     
                        </tr>
                        <tr>
                            <td colspan="5">
                                <input type="submit" class="sub1" value="ACEPTAR"/>
                            </td>                     
                        </tr>
                    </table> 
                </form>
            </center>            
        </section>         
    </body>
</html>

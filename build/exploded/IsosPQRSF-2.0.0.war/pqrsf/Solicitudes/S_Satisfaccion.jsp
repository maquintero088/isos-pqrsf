<%-- 
    Document   : S_anonimo
    Created on : 13/05/2014, 02:20:38 PM
    Author     : USUARIO
--%>
<%@page import="Revisiones.encuesta"%>
<%@page import="java.util.Random"%>
<%@page import="ISOSPQRSFDB.Consultas"%>
<%@page import="Gestion.SMTP"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    
        <link href="../images/logo.png" type="image/x-icon" rel="shortcut icon" />  
        <title>Enviando Solicitud...</title>
        <style>
            @import "../../css/css.css";
        </style>
    </head>
    <body> 
       
         
        <%         
            Consultas consultas=new Consultas();
            encuesta encuesta=new encuesta();  
            if(encuesta.var==0){  
        %> <center>
            <form action="PQRSF.jsp" method="post">
            <table class="fondo">
                <tr>
                    <td>
                         Senor Usuario, agradecemos su tiempo para opinar acerca de la Satisfacción de la Respuesta su PQRSF.
                         <br>
                         <hr class="solicitudes">
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" class="sub1" onclick="<%
                Random R = new Random();
                String[] preguntas = consultas.valores("pregunta pre, encuesta_pregunta fkpre, encuesta enc "
                        + " WHERE pre.pre_Id = fkpre.fk_pre_Id and "
                        + "enc.enc_Id = fkpre.fk_enc_Id and fkpre.fk_enc_Id = "+request.getParameter("encuesta")+"", "pre.pre_Id", "pre.pre_Id"); 
                int p=0;
                while(p<preguntas.length){
                    System.out.println(
                            request.getParameter("Radicado")+" "+ 
                                    request.getParameter("encuesta")+" "+
                                    request.getParameter("pregunta"+preguntas[p])+" "+
                                    request.getParameter("opcion"+preguntas[p])+" "+
                                    consultas.valores("respuesta", "res_Id", "fk_sol_Radicado", request.getParameter("Radicado"))
                    );
                    encuesta.Satisfaccion(
                            request.getParameter("encuesta"), 
                            request.getParameter("pregunta"+preguntas[p]) ,  
                            request.getParameter("opcion"+preguntas[p]), 
                            consultas.valores("respuesta", "res_Id", "fk_sol_Radicado", request.getParameter("Radicado"))
                    );
                    p++; 
                }                        
                encuesta.var=1; 
                %>" value="Aceptar"/> 
                    </td>
                </tr>
            </table>
        </form>   
    </center>
        <%             
        }else{}        %>
             
    </body>
</html>

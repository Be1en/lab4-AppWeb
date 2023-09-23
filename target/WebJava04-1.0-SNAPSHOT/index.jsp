<%-- 
    Document   : index
    Created on : 22/09/2023, 02:17:53 PM
    Author     : valer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--validacion de sesion--%>
<%
HttpSession misession= (HttpSession) request.getSession();
String usuario= (String) misession.getAttribute("usuario");  
String estado= (String) misession.getAttribute("estado");  
if(misession == null || misession.getAttribute("usuario") == null){
      out.print("<link rel=\"stylesheet\" \n"
                + "              href=\"webjars/bootstrap/5.3.1/css/bootstrap.min.css\" type=\"text/css\" />");
      out.println("<center>");           
      out.println("<h3 class=\"mt-5\">No tiene permisos para acceder a esta seccion</h3>");
      out.println("<a class='btn btn-primary ' href='/WebJava04/login.jsp'>Ir a pagina de acceso</a>");
      out.println("</center>");
      return;
  }    
%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <title>Inicio</title>
        <link rel="stylesheet" 
              href="webjars/bootstrap/5.3.1/css/bootstrap.min.css" type="text/css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <div class="m-5">
            <div style="display: flex;" >
            <div>
            <h1 class="m-5">Enlaces a Tablas</h1>
            <div style="display: flex;" class="m-5">
                
            <div class="form-check mt-5">
                <a href="areas.jsp">
                    <button class="btn btn-primary">AREAS</button>
                </a>
            </div>
            <div class="form-check mt-5">
                <a href="cargos.jsp">
                    <button class="btn btn-primary">CARGOS</button>
                </a>
            </div>
                
            </div>
            
            </div>
            <div class="m-5">
            <h3 class="m-5">Usuario Logeado: <b><% out.print(usuario); %></b></h3>
            <h3 class="m-5">Estado del Usuario: <b><% if(estado.equals("A")){ out.print("Activo"); } else{out.print("No Activo");} %></b></h3>
            <div class="m-5">
            <h3 ><a class='btn btn-danger' href="/WebJava04/ServletSesion">Cerrar Sesion</a></h3>
            </div>
            </div>
            </div>
            
            
        </div>
            
    </body>
</html>
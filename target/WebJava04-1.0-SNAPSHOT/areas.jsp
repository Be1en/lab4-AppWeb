<%-- 
    Document   : areas
    Created on : 18/09/2023, 04:38:23 PM
    Author     : valer
--%>

<%@page import="java.sql.*"%>
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
      out.println("<a class='btn btn-primary' href='/WebJava04/login.jsp'>Ir a pagina de acceso</a>");
      out.println("</center>");
      return;
  }    
%>


<%
  String driver = "com.mysql.cj.jdbc.Driver";
  String url   = "jdbc:mysql://localhost:3306/test?useSSL=false&serverTimezone=UTC";
  String user   = "root";
  String pass   = "123456";
  
  Class.forName(driver);
  Connection xcon = DriverManager.getConnection(url, user, pass);
  
  String sql = "select * from areas";
  Statement stm = xcon.createStatement();
  ResultSet rs = stm.executeQuery(sql);
%>
 

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="webjars/bootstrap/5.3.1/css/bootstrap.min.css" type="text/css" />
    <link rel="stylesheet" href="estilos.css" type="text/css" />
    <title>JSP Page</title>
</head>
<body>
    <div class="container m-5">
        <h3>Usuario Logeado: <b><% out.print(usuario); %></b></h3>
        <h3>Estado del Usuario: <b><% if(estado.equals("A")){ out.print("Activo"); } else{out.print("No Activo");} %></b></h3>
        <a class='btn btn-danger' href="/WebJava04/ServletSesion">Cerrar Sesion</a>
        <a class='btn btn-primary ' href='/WebJava04/index.jsp'>Inicio</a>
        <h1 class="m-5">Listado de Areas</h1>
        <table class="styled-table"> 
            <thead>
                <tr>
                    <th scope="col">CODIGO</th>
                    <th scope="col">NOMBRE</th>
                    <th scope="col">ESTADO</th>
                </tr>
            </thead>
            <tbody>
                <%
int rowNumber = 0; // Variable para rastrear el número de fila
while (rs.next()) {
    rowNumber++;
    String rowClass = (rowNumber % 2 == 0) ? "even" : "odd"; // Determina la clase CSS para la fila
    out.print("<tr class=\"" + rowClass + "\">");
    out.print("<td>" + rs.getString(1) + "</td>");
    out.print("<td>" + rs.getString(2) + "</td>");
    out.print("<td>" + rs.getString(3) + "</td>");
    out.print("</tr>");
}
%>

            </tbody>
        </table>
    </div>
</body>
</html>

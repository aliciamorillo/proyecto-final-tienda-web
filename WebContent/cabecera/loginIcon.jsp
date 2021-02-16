<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="modelo.*" %>

<%
    String nombreUsuario="";
    HttpSession sesionOK=request.getSession();
    
	if(sesionOK.getAttribute("perfil")!=null) {
		nombreUsuario=(String)sesionOK.getAttribute("nombreUsuario");
	}
%>

<!DOCTYPE HTML>

<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>MASTER JAVA</title>
	</head>
	
	<body>
	
		<img src="imagenes/login.jpg" width="75" title="VER USUARIO"
					onclick=""/>

		<span style="color:blueviolet; font-size:25px; font-weight:bold">
		   <%if(sesionOK.getAttribute("perfil")!=null){
                    %>
           		<td><%out.println("Bienvenido : " + nombreUsuario);%></td>
                <%
                    }
                %>
		</span>
		
	</body>
	
</html>
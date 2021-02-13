<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>MASTER JAVA</title>
	</head>
	
	<body>
	
		<img src="imagenes/login.jpg" width="75" title="VER USUARIO"
					onclick="window.location.href='verUsario.jsp';"/>

		<span style="color:blueviolet; font-size:25px; font-weight:bold">
		   <%--  <%= session.getId() %> --%> USUARIO
		</span>
		
	</body>
	
</html>
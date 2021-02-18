<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>

<%
    String usu="";
    String nom="";
    HttpSession sesionOK=request.getSession();
    
	if(sesionOK.getAttribute("perfil")!=null) {
	    nom=(String)sesionOK.getAttribute("nom");
	}
%>

<!DOCTYPE HTML>

<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>MASTER JAVA</title>
		
		<link rel="stylesheet" type="text/css" href="estilos/estilos.css"/>
		
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" 
				rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">			
	
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" 
				integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="css/flaticon.css"> 
		
	</head>
	
	<body>
	
		<div align="center">
		
		<!--Cabecera-->
		<%@include file="/WEB-INF/include/header.jsp" %>
		
			<nav style="margin-left: 900px;">
				<jsp:include page="cabecera/carro.jsp"/>
				&nbsp;&nbsp;&nbsp;
				<jsp:include page="cabecera/loginIcon.jsp"/>
			</nav>
			
			<div id="navegador" style="margin-top: 10px;">
				<ul>
				<li><a href="index.jsp">Catalogo</a></li>
					<li><a href="consultarVentas.jsp">Consultar Ventas</li>
					<%if(sesionOK.getAttribute("perfil")!=null){
		                    %>
					<li><a href="LoginServlet?accion=cerrar">Cerrar Sesión</a></li>
		                <%
		                    }
		                    %>
		      		    <%
		      		    	if(sesionOK.getAttribute("perfil")==null){
		      		    %>
		                <li><a href="login.jsp">Iniciar Sesion</a></li>
		                <% } %>
		                
		                
				</ul>
			</div>
		
			<img src="imagenes/compraok.jpg"/>
		
		</div>
		
	<!-- Pie de pagina -->
   	<%@include file="/WEB-INF/include/footer.jsp" %>
	
	</body>
	
</html>
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
		<title>TIENDA ONLINE - FUNKOS</title>
		
		<link rel="stylesheet" href="estilos/bootstrap.min.css">
		<link rel="stylesheet" href="estilos/nuevosEstilos.css">
		<link rel="stylesheet" href="estilos/owl.carousel.css">
		
		<link rel="stylesheet" type="text/css" href="estilos/estilos.css"/>

		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" 
				rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">			
	
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" 
				integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
		
	</head>
	
	<body>
	
		<div align="center">
		
		<!--Cabecera-->
		<%@include file="/WEB-INF/include/header.jsp" %>
		
		<table border="0" width="800" height="50px" align="center" style="margin-bottom:60px">
			<tr bgcolor="skyblue">
				<th><a href="index.jsp">Catalogo</a></th>
				<th><a href="consultarVentas.jsp">Consultar Ventas</a>
               <%if(sesionOK.getAttribute("perfil")!=null){
	                    %>
	                
	                <th><a href="LoginServlet?accion=cerrar">Cerrar Sesión</a></th>
	                <%
	                    }
	                    %>
	      		    <%
	      		    	if(sesionOK.getAttribute("perfil")==null){
	      		    %>
	                <th><a href="login.jsp">Iniciar Sesion</a></th>
	                <% } %>
			</tr>
		</table>
		
		<h2 align="center">LOGIN USUARIOS</h2>
		
		<table border="0" width="300" align="center" class="compraFunko">
			<form action="LoginServlet" method="POST">
				
				<input type="hidden" name="accion" value="login"/>
				
				<tr>
	               <td>Usuario:</td>
	               <td><input type="text" placeholder="Usuario" name="txtUsu"></td>
           		</tr>
            	<tr>
	               <td>Password:</td>
	               <td> <input type="password" placeholder="Password" name="txtPas"></td>
	           	</tr>                  
	           	<tr>
	               <th colspan="2">
	               		<input type="submit" name="btn" value="Iniciar Sesion" class="btn btn-outline-primary"> 
	               </th>
           		</tr> 
			</form>
		</table>
		
		<h4 align="center">
			<%
			if(request.getAttribute("msg") != null)
				out.println(request.getAttribute("msg"));
			%>
		</h4>
		
		</div>
	
	</body>
	
</html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.*" %>
<%@page import="java.util.*" %>

<%@page session="true"%>
	
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML>

	<% 
		Producto producto = ProductoBD.obtenerProducto(Integer.parseInt(request.getParameter("id")));
	%>
	
<%
    String nombreUsuario="";
    HttpSession sesionOK=request.getSession();
    
	if(sesionOK.getAttribute("perfil")!=null) {
		nombreUsuario=(String)sesionOK.getAttribute("nombreUsuario");
	}
%>

<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>TIENDA ONLINE - FUNKOS</title>
		
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
		
		<h1>ÚLTIMAS NOVEDADES EN MUÑECOS POP Y OTROS PRODUCTOS FUNKO</h1>
		
		<table border="0" width="800" height="50px" align="center" style="margin-bottom:60px">
			<tr bgcolor="skyblue">
				<th><a href="index.jsp">Catalogo</a></th>
				<th><a href="consultarVentas.jsp">Consultar Ventas</a></th>

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
		
		<h2>AÑADIR PRODUCTO AL CARRITO</h2>
		
		<table border="0" width="500" height="50px" align="center">
			
			<form method="POST" action="ControladorServlet">
			
				<tr>
					<th rowspan="5"><img  style="margin-right: 20px;" class="compraFunko imagen" src="<%=producto.getImagen()%>"/></th>
					
					<th>Codigo Producto: </th>
					<th><input type="text" name="txtCodigo" value="<%=producto.getCodigoProducto()%>" readonly/></th>
				</tr>
				<tr>
					<th>Nombre: </th>
					<th><input type="text" name="txtNombre" value="<%=producto.getNombreFunko()%>" readonly/></th>
				</tr>
				<tr>
					<th>Seccion: </th>
					<th><input type="text" name="txtSeccion" value="<%=producto.getSeccion()%>" readonly/></th>					
				</tr>
				<tr>
					<th>Precio: </th>
					<th><input type="text" name="txtPrecio" value="<%=producto.getPrecio()%>" readonly/></th>
				</tr>
				<tr>
					<th>Cantidad: </th>
					<th><input type="number" name="txtCantidad" min="1" max="5" value="1"/></th>
				</tr>
				<tr>
					<th colspan="3" align="center">
						<button class="btn btn-outline-primary" style="margin-top: 50px;"
							type="submit" name="btAdd">Añadir</button>
					</th>
				</tr>
					<input type="hidden" name="accion" value="AddCarrito"/>

			</form>
			
		</table>
		
		</div>
		
		<%@include file="/WEB-INF/include/footer.jsp" %>
	
	</body>
	
</html>
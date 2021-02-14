<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.*" %>
<%@page import="java.util.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML>

<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>MASTER JAVA</title>
		
		<link rel="stylesheet" type="text/css" href="estilos/estilos.css"/>
		
	</head>
	
	<body>
	
		<div align="center">
		
		<!--Cabecera-->
		<%@include file="/WEB-INF/include/header.jsp" %>
		
		<h1>ÚLTIMAS NOVEDADES EN MUÑECOS POP Y OTROS PRODUCTOS FUNKO</h1>
		
		<nav style="margin-left: 900px;">
			<jsp:include page="cabecera/carro.jsp"/>
			&nbsp;&nbsp;&nbsp;
			<jsp:include page="cabecera/login.jsp"/>
		</nav>
		
		<table border="0" width="800" height="50px" align="center" style="margin-bottom:100px">
			<tr bgcolor="skyblue">
				<th><a href="consultarVentas.jsp">Consultar Ventas</a>
				<th><a href="LoginServlet?accion=cerrar">Cerrar Sesion</a>
				<th width="200">Iniciar Sesion</th>
			</tr>
		</table>
		
		<h2>AÑADIR PRODUCTO AL CARRITO</h2>
		
		<%
		Producto producto = ProductoBD.obtenerProducto(Integer.parseInt(request.getParameter("id")));
		%>
		
		
		<table border="0" width="500" height="50px" align="center">
			<form method="POST" action="ControladorServlet">
				<tr>
					<th rowspan="5"><img class="compraFunko imagen" src="<%=producto.getImagen()%>"/></th>
					
					<th>Codigo Producto: </th>
					<th><input type="text" name="txtCodigo" value="<%producto.getCodigoProducto();%>" readonly/></th>
				</tr>
				<tr>
					<th>Nombre: </th>
					<th><input type="text" name="txtNombre" value="<%producto.getNombreFunko();%>" readonly/></th>
				</tr>
				<tr>
					<th>Seccion: </th>
					<th><input type="text" name="txtSeccion" value="<%producto.getSeccion();%>" readonly/></th>					
				</tr>
				<tr>
					<th>Precio: </th>
					<th><input type="text" name="txtPrecio" value="<%producto.getPrecio();%>" readonly/></th>
				</tr>
				<tr>
					<th>Cantidad: </th>
					<th><input type="number" name="txtCantidad" value="0"/></th>
				</tr>
				<tr>
					<th colspan="3"><input type="button" value="Añadir" name="btAdd"/></th>
				</tr>
				<input type="hidden" name="accion" value="AddCarrito"/>
			</form>
		</table>
		
		</div>
	
	</body>
	
</html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.*" %>
<%@page import="java.util.*" %>
<%@page session="true" %>


<!DOCTYPE HTML>

<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>TIENDA ONLINE - FUNKOS</title>
	</head>
	
	<body>
	
		<div align="center">
		
		<!--Cabecera-->
		<%@include file="/WEB-INF/include/header.jsp" %>
		
		<table border="0" width="800" height="50px" align="center" style="margin-bottom:100px">
			<tr bgcolor="skyblue">
				<th><a href="index.jsp">Catalogo</a></th>
				<th><a href="consultarVentas.jsp">Consultar Ventas</a>
				<th><a href="LoginServlet?accion=cerrar">Cerrar Sesion</a>
				<th width="200">Iniciar Sesion</th>
			</tr>
		</table>
		
		<h2 align="center">CARRITO DE LA COMPRA</h2>
		
		<form method="POST" action="ControladorServlet">
		
			<input type="hidden" name="accion" value="RegistrarVenta"/>
			
			<table border="1" align="center" width="500">
				<tr>
					<th>Cliente</th>
					<th colspan="4"><input type="text" name="txtCliente" value="Nombre"/></th>
				</tr>
				<tr style="background-color: skyblue; color: black; font-weight: bold;">
					<td width="180">Nombre</td>
					<td>Precio</td>
					<td>Cantidad</td>
					<td>Descuento</td>
					<td>Sub. Total</td>
				</tr>
				
				<%
					double total = 0;
						ArrayList<DetalleVenta> lista = (ArrayList<DetalleVenta>)session.getAttribute("carrito");
						
						if(lista != null){
							for(DetalleVenta detalle : lista){
							%>	
								<tr>
									<td><%= detalle.getProducto().getNombreFunko() %></td>
									<td><%= detalle.getProducto().getPrecio() %></td>
									<td><%= detalle.getCantidad() %></td>
									<td><%= String.format("%.2f", detalle.getDescuento()) %></td>
									<td><%= String.format("%.2f", (detalle.getProducto().getPrecio() * detalle.getCantidad()) - detalle.getDescuento()) %></td>
								</tr>
							<% 
							
							total = total + (detalle.getProducto().getPrecio() * detalle.getCantidad()) - detalle.getDescuento();
							}
						}
				%>	
					<tr>
						<th colspan="4" align="right">Total</th>
						<th><%= String.format("%.2f", total) %></th>
					</tr>
					<tr>
						<th colspan="5">
							<input type="submit" value="Registrar Venta" name="btVenta"/>
						</th>
					</tr>
				
			</table>
		
		</form>
		
		<h3 align="center"><a href="index.jsp">Seguir Comprando</a></h3>
		
		</div>
	
	</body>
	
</html>
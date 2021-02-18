<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.*" %>
<%@page import="java.util.*" %>

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
		
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" 
				rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
		
		<link rel="stylesheet" href="estilos/bootstrap.min.css">
		<link rel="stylesheet" href="estilos/nuevosEstilos.css">
		<link rel="stylesheet" href="estilos/owl.carousel.css">
		
		<link rel="stylesheet" type="text/css" href="estilos/estilos.css"/>
		
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
		
		<h2 align="center">CARRITO DE LA COMPRA</h2>
		
		<form method="POST" action="ControladorServlet">
		
			<input type="hidden" name="accion" value="RegistrarVenta"/>
			
			<table border="1" class="table table-striped compraFunko">
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
			
				<input type="hidden" name="total" value="<%=total%>"/>
		
		</form>
		
		<h3 align="center"><a href="index.jsp">Seguir Comprando</a></h3>
		
		</div>
	
	</body>
	
</html>
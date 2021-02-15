<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
		
		<table border="0" width="800" height="50px" align="center" style="margin-bottom:60px">
			<tr bgcolor="skyblue">
				<th><a href="index.jsp">Catalogo</a></th>
				<th><a href="consultarVentas.jsp">Consultar Ventas</a>
				<th><a href="LoginServlet?accion=cerrar">Cerrar Sesion</a>
				<th width="200">Iniciar Sesion</th>
			</tr>
		</table>
		
		<h1>
		
			<%
				double total = Double.parseDouble(request.getParameter("total"));
				out.println("Total a pagar = " + total + "<p>");
			%>
			
			<form action="https://www.paypal.com/cgi-bin/webscr" method="post">

				<input type="hidden" name="cmd" value="_ext-enter" />
				<input type="hidden" name="redirect_cmd" value="_xclick" />
				<input type="hidden" name="business" value="alicia.morillo87@gmail.com" />
				<input type="hidden" name="item_name" value="Productos varios" />
				<input type="hidden" name="quantity" value="1" />
				<input type="hidden" name="amount" value="<%=total%>" />
				<input type="hidden" name="currency_code" value="EUR" />
				<input type="hidden" name="return" value="http://localhost:7080/TIENDA_WEB_FUNKOS/index.jsp" />
				<input type="hidden" name="bn" value="PP-BuyNowBF:btn_buynowCC_LG.gif:NonHostedGuest" />
				<input type="image" src="http://www.paypal.com/es_XC/i/btn/x-click-but01.gif" border="0" name="submit" alt="Pagar para completar la compra." />
				
			</form>
		
		</h1>
		
		</div>
	
	</body>
	
</html>
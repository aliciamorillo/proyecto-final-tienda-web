<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>


<!DOCTYPE HTML>

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
		
		<link rel="stylesheet" href="estilos/bootstrap.min.css">
		<link rel="stylesheet" href="estilos/nuevosEstilos.css">
		<link rel="stylesheet" href="estilos/owl.carousel.css">
		
		<script type="text/javascript">
		
		function pulsarBoton(){
			
			var efectivo = document.getElementById("efectivo");
			var tarjeta = document.getElementById("tarjeta");
				
			efectivo.style.display = "block";
			tarjeta.style.display = "block";
				
			return true;
		}
		
		</script>
		
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
		
		<h1>
		
			<%
				double total = Double.parseDouble(request.getParameter("total"));
				out.println("Total a pagar = " + String.format("%.2f", total) + " € <p>");
			%>
			
			<h4>PAGO CON PAYPAL: </h4>
			
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
			
			<br/>
			
			<h4>OTRAS FORMAS DE PAGO: </h4>
			
			<button type="button" class="estiloBoton"
                           onclick="pulsarBoton()">PAGO EN EFECTIVO: </button>
            
            <div id="efectivo" style="display:none;">
            	- Selecciona una fecha de entrega: <input type="date" value="" name="efectivoFecha"/>
            	<br/>
            	<button type="button" id="btComprar">Comprar</button>
            </div>
                   				
            <br/><br/>
                   					
            <br/><br/>
            
            <button type="button" class="estiloBoton" value=""
                   				onclick="pulsarBoton();">PAGO CON TARJETA: </button>
                   				
            <div id="tarjeta" style="display:none;">
            	aslñjdfñalsjfñlasjkd
            </div>
            
            </div>
		
		</h1>
		
		</div>
	
	</body>
	
</html>
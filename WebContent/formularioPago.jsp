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
		
		<link rel="stylesheet" type="text/css" href="estilos/estilos.css"/>
		
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" 
				rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">			
	
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" 
				integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="css/flaticon.css"> 
		
		<script type="text/javascript">
		
		function pagoEfectivo(){
			var efectivo = document.getElementById("efectivo");
			efectivo.style.display = (efectivo.style.display == "none") ? "block" : "none";

			return true;
		}
		
		function pagoTarjeta(){
			var tarjeta = document.getElementById("tarjeta");
			tarjeta.style.display = (tarjeta.style.display == "none") ? "block" : "none";
			return true;
		}
		
		</script>
		
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
		
		<h1>
		
			<%
				double total = Double.parseDouble(request.getParameter("total"));
				out.println("Total a pagar = " + String.format("%.2f", total) + " € <p>");
			%></h1>
			
			<br/>
			
			<h2 class="font-weight-bold text-success">PAGO CON PAYPAL: </h2>
			
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
			
			<br/><br/>
			
			<h2 class="font-weight-bold text-success">OTRAS FORMAS DE PAGO: </h2>
			
			<br/><br/>
			
			<button type="button" class="btn btn-outline-primary"
                           onclick="pagoEfectivo()">PAGO EN EFECTIVO: </button>
            
            <div id="efectivo" style="display:none;">
            	<label>- Selecciona una fecha de entrega:   </label>
            		<input type="date" value="" name="efectivoFecha"/>
            	<br/><br/>
            	<button type="button" id="btComprar" onclick="window.location.href='confirmacionCompra.jsp'">Confirmar Compra</button>
            </div>
                   				
            <br/><br/>

            <button type="button" class="btn btn-outline-primary" value=""
                   				onclick="pagoTarjeta();">PAGO CON TARJETA: </button>
                   				
            <div id="tarjeta" style="display:none;">
            	
            	<div class="payment">
		        <form action="" method="POST">
		            <div class="form-group owner">
		                <label for="owner">Owner</label>
		                <input type="text" class="form-control" id="owner">
		            </div>
		            <div class="form-group CVV">
		                <label for="cvv">CVV</label>
		                <input type="text" class="form-control" id="cvv">
		            </div>
		            <div class="form-group" id="card-number-field">
		                <label for="cardNumber">Card Number</label>
		                <input type="text" class="form-control" id="cardNumber">
		            </div>
		            <div class="form-group" id="expiration-date">
		                <label>Expiration Date</label>
		                <select>
		                    <option value="01">January</option>
		                    <option value="02">February </option>
		                    <option value="03">March</option>
		                    <option value="04">April</option>
		                    <option value="05">May</option>
		                    <option value="06">June</option>
		                    <option value="07">July</option>
		                    <option value="08">August</option>
		                    <option value="09">September</option>
		                    <option value="10">October</option>
		                    <option value="11">November</option>
		                    <option value="12">December</option>
		                </select>
		                <select>
		                    <option value="16"> 2021</option>
		                    <option value="17"> 2022</option>
		                    <option value="18"> 2023</option>
		                    <option value="19"> 2024</option>
		                    <option value="20"> 2025</option>
		                    <option value="21"> 2026</option>
		                </select>
		            </div>
		            <div class="form-group" id="pay-now">
		                <button type="submit"id="confirm-purchase" onclick="window.location.href='confirmacionCompra.jsp'" style="margin-top:10px">Confirmar Compra</button>
		            </div>
		        </form>
		    </div>
            	
            </div>
            
            </div>
		
		</h1>
		
		</div>
		
	<!-- Pie de pagina -->
   	<%@include file="/WEB-INF/include/footer.jsp" %>
	
	</body>
	
</html>
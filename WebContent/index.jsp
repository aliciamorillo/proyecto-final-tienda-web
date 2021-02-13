<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,modelo.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
	
		<script type="text/javascript" src="js/javascript.js"></script>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		
		<script>
			//invocamos al objeto (window) y a su método (scroll), solo se ejecutara si el usuario hace scroll en la página
			$(window).scroll(function(){
			  if($(this).scrollTop() > 300){
			    $("#js_up").slideDown(300);
			  }else{ // si no
			    $("#js_up").slideUp(300);
			  }
			});
			
			//creamos una función accediendo a la etiqueta i en su evento click
			$("#js_up i").on('click', function (e) { 
			  e.preventDefault();
			  $("body,html").animate({
			    scrollTop: 0
			  },700);
			  return false;
			});
		</script>
		
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
		
		<br/><br/>
		
				<div id="navegador">
			<ul>
				<li><a href="#Animacion">Animacion</a></li>
				<li><a href="#Anime">Anime</a></li>
				<li><a href="#Cine">Cine</a></li>
				<li><a href="#Comic">Comic</a></li>
				<li><a href="#Disney">Disney</a></li>
				<li><a href="#Musica">Musica</a></li>
			</ul>
		</div>
		
		<a name="#Animacion"></a>
		
		<div id="animacion" class="grid-container">
		
		<a href="#" id="js_up" class="boton-subir">
		  <i class="fas fa-arrow-circle-up"></i>
		</a>
			
			<div class="grid-item">
			
			<table border="0" width="700px" align="center">
				<%
				ArrayList<Producto> lista = ProductoBD.obtenerProducto();
				int salto = 0;
				
				for(int i=0;i<lista.size();i++){
					Producto producto = lista.get(i);
				
				%>
				<tr>
					<td>
						<img class="compraFunko imagen" src="<%=producto.getImagen()%>"/>
					</td>
			
					<td><%=producto.getNombreFunko()%></td>
						
					<td><%=producto.getPrecio()%> €</td>
						
					<td><button class="btn btn-outline-primary" data-toggle="tooltip" title="AÑADIR AL CARRITO" 
								onclick="">COMPRAR</button></td>
				</tr>
				<%	
					salto++;
				
					if(salto==3){
						%>
						<tr>
						<%
						salto = 0;
					}
				}
				 %>
			
			</table>
		
			</div>
		
	<!-- Pie de pagina -->
   	<%@include file="/WEB-INF/include/footer.jsp" %>
        
	</div>
	
	</body>
	
</html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>MASTER JAVA</title>
	</head>
	
	<body>

		<img src="imagenes/cesta.jpg" width="75" title="FINALIZAR COMPRA"
                onclick="window.location.href='registrarVenta.jsp';"/>

		<span style="color:blueviolet; font-size:25px; font-weight:bold">
		    ${sessionScope.carro.cuantosArticulos()} 
		</span>
		
	</body>
	
</html>
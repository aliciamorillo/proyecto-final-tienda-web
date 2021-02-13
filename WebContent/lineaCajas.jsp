<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML>

<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>MASTER JAVA</title>		
	</head>
	
	<body>
	
		<div align="center">
		
		<!--Cabecera-->
		<%@include file="/WEB-INF/include/header.jsp" %>
	
			<h1>                 
            	LINEA DE CAJAS
           		<jsp:include page="cabecera/carro.jsp"/>
            </h1>   
		
			<table border="1" width="70%">

            	<c:forEach var="articulo" items="${requestScope.listadoArticulos}">

                	<tr>                        
                    	<td style="margin:30px;">${articulo.nombre}</td>
                        <td style="margin:30px;">${articulo.precio}</td>
                        <td style="margin:30px;">${articulo.seccion}</td>
                        <td style="margin:30px;">
                        	<img src="${articulo.imagen}" width="95" style="margin-left:25px;"/>
                        </td>
                        
                        <td><a href="CompraServlet?operacion=eliminarArticulo&nombre=${articulo.nombre}"> Eliminar </a></td>
                        
                    </tr>
                        
                </c:forEach>

            </table>
		
		</div>
	
	</body>
	
</html>
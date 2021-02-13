package controlador;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import otros.ICestaCompra;


@WebServlet("/CompraServelt")
public class ControladorServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        procesarPeticion(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        procesarPeticion(request, response);
    }
    
    //------

	private void procesarPeticion(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		HttpSession tuSesion = request.getSession();
        
        ICestaCompra carro = (ICestaCompra) tuSesion.getAttribute("carro");
        
        String operacion = request.getParameter("operacion");
        
        switch(operacion) {
        
        	case "agregarArticulo":
        		String articuloAgregar = request.getParameter("nombre");
                System.out.println("ARTICULO A INTRODUCIR EN EL CARRO: " + articuloAgregar);
                String seccionOrigen = request.getParameter("seccion");
                System.out.println("SECCION DESDE LA QUE SE SOLICITO AGREGAR: " + seccionOrigen);                
                carro.agregar(articuloAgregar);  
                response.sendRedirect(seccionOrigen.toLowerCase() + ".jsp?mensaje=" + 
                                        "SE HA AGREGADO EL ARTICULO ... " + articuloAgregar + " AL CARRO.");
        	return;
        	
        
        }
		
	}

}

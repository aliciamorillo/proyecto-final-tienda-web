package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.*;
import modelo.DetalleVenta;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;



@WebServlet(name = "/ControladorServlet", urlPatterns = {"/ControladorServlet"})
public class ControladorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	processRequest(request, response);
    }
    
    //------

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		    	
		String accion = request.getParameter("accion");
		
		if (accion.equals("AddCarrito")) {
			this.addCarrito(request,response);
		}
		
	}

	private void addCarrito(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
				
		HttpSession sesion = request.getSession();
		ArrayList<DetalleVenta> carrito;
		
		if (sesion.getAttribute("carrito") == null) {
			carrito = new ArrayList<DetalleVenta>();
		
		} else {
			carrito = (ArrayList<DetalleVenta>) sesion.getAttribute("carrito");
		}
		
		Producto producto = ProductoBD.obtenerProducto(Integer.parseInt(request.getParameter("txtCodigo")));
		
		DetalleVenta detalleVenta = new DetalleVenta();
		
		detalleVenta.setCodigoProducto(Integer.parseInt(request.getParameter("txtCodigo")));
		detalleVenta.setProducto(producto);
		detalleVenta.setCantidad(Double.parseDouble(request.getParameter("txtCantidad")));
		
		double subTotal = producto.getPrecio() * detalleVenta.getCantidad();
	
		if (subTotal > 50) {
			detalleVenta.setDescuento(subTotal * 0.05);
		} else {
			detalleVenta.setDescuento(0);
		}
		
		int indice = -1;
		for (int i = 0; i < carrito.size(); i++) {
			DetalleVenta detalle = carrito.get(i);
			if (detalle.getCodigoProducto() == producto.getCodigoProducto()) {
				indice = i;
				break;
			}
		}
		
		if (indice == -1) {
			carrito.add(detalleVenta);
		}
		
		sesion.setAttribute("carrito", carrito);
		response.sendRedirect("registrarVenta.jsp");		
	}

}

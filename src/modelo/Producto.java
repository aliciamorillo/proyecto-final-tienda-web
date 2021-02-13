package modelo;

public class Producto {
	
	private int codigoProducto;
	private String nombreFunko;
	private String seccion;
	private double precio;
	private String imagen;
	
	
	//CONSTRUCTOR:
	public Producto(int codigoProducto, String nombre, String seccion,
			double precio, String imagen) {
		super();
		this.codigoProducto = codigoProducto;
		this.nombreFunko = nombre;
		this.seccion = seccion;
		this.precio = precio;
		this.imagen = imagen;
	}
	
	public Producto(){}
	
	
	//GETTERS & SETTERS:
	public int getCodigoProducto() {
		return codigoProducto;
	}
	
	public void setCodigoProducto(int codigoProducto) {
		this.codigoProducto = codigoProducto;
	}
	
	public String getNombreFunko() {
		return nombreFunko;
	}
	
	public void setNombreFunko(String nombreFunko) {
		this.nombreFunko = nombreFunko;
	}
	
	public String getSeccion() {
		return seccion;
	}
	
	public void setSeccion(String seccion) {
		this.seccion = seccion;
	}
	
	public double getPrecio() {
		return precio;
	}
	
	public void setPrecio(double precio) {
		this.precio = precio;
	}
	
	public String getImagen() {
		return imagen;
	}
	
	public void setImagen(String imagen) {
		this.imagen = imagen;
	}
	
}

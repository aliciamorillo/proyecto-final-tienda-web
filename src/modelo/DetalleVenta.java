package modelo;

public class DetalleVenta {
	
	private int codigoVenta;
	private int codigoProducto;
	private double precio;
	private double descuento;
	private Producto producto;
	private Venta venta;
	
	
	public DetalleVenta(int codigoVenta, int codigoProducto, double precio,
			double descuento, Producto producto, Venta venta) {
		super();
		this.codigoVenta = codigoVenta;
		this.codigoProducto = codigoProducto;
		this.precio = precio;
		this.descuento = descuento;
		this.producto = producto;
		this.venta = venta;
	}


	public int getCodigoVenta() {
		return codigoVenta;
	}


	public void setCodigoVenta(int codigoVenta) {
		this.codigoVenta = codigoVenta;
	}


	public int getCodigoProducto() {
		return codigoProducto;
	}


	public void setCodigoProducto(int codigoProducto) {
		this.codigoProducto = codigoProducto;
	}


	public double getPrecio() {
		return precio;
	}


	public void setPrecio(double precio) {
		this.precio = precio;
	}


	public double getDescuento() {
		return descuento;
	}


	public void setDescuento(double descuento) {
		this.descuento = descuento;
	}


	public Producto getProducto() {
		return producto;
	}


	public void setProducto(Producto producto) {
		this.producto = producto;
	}


	public Venta getVenta() {
		return venta;
	}


	public void setVenta(Venta venta) {
		this.venta = venta;
	}
	
	
	

}

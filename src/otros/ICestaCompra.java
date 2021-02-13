package otros;

import java.io.Serializable;
import java.util.List;

public interface ICestaCompra extends Serializable {
	
	public boolean agregar(String articulo);
	public boolean eliminar(String articulo);
	
	public void vaciar();
	
	public String[] obtenerArrayArticulos();
	
	public List<String> obtenerListadoArticulos();
	
	public int cuantosArticulos();

}

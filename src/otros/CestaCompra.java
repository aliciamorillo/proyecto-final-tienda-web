package otros;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;


public class CestaCompra implements ICestaCompra {
	
	List<String> articulos;	
	
	public CestaCompra(){
		articulos = new ArrayList<String>();
	}

	@Override
	public String[] obtenerArrayArticulos() {                            
        
        String[] arrayArticulos = new String[articulos.size()];
        
        int indice = 0;
        
        Iterator<String> it = articulos.iterator();
        
        while(it.hasNext()) {
            arrayArticulos[indice++] = it.next();
        }

        return arrayArticulos;
        
    }
	
	@Override
	public int cuantosArticulos() {
        return articulos.size();
    }


	@Override
	public boolean agregar(String articulo) {
		articulos.add(articulo);
		return false;
	}


	@Override
	public boolean eliminar(String articulo) {
		articulos.remove(articulo);
		return false;
	}


	@Override
	public void vaciar() {
		articulos.clear();
	}


	@Override
	public List<String> obtenerListadoArticulos() {
		return articulos;
	}
	
}

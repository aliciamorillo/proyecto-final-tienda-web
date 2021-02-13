package modelo;

import java.sql.*;
import java.util.*;

import utilidades.ConexionBD;

public class ProductoBD {
	
	public static ArrayList<Producto> obtenerProducto(){
		ArrayList<Producto> lista = new ArrayList<Producto>();
		
		Connection conexion = ConexionBD.getConexion();
		CallableStatement callablestatement = null;
		ResultSet resultset = null;
		
		try {
			callablestatement = conexion.prepareCall("{CALL listarProducto()}");
			resultset = callablestatement.executeQuery();
			
			while(resultset.next()){
				Producto producto = new Producto(resultset.getInt(1), resultset.getString(2), resultset.getString(3), resultset.getDouble(4), resultset.getString(5));
				lista.add(producto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return lista;
	}

}

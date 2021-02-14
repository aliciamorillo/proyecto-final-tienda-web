package modelo;

import java.sql.*;
import java.util.*;

import utilidades.ConexionBD;

public class ProductoBD {
	
	
	public static ArrayList<Producto> obtenerProducto(){
		ArrayList<Producto> lista = new ArrayList<Producto>();
		

		try {
			CallableStatement callablestatement = ConexionBD.getConexion().prepareCall("{CALL listarProducto()}");
			ResultSet resultset = callablestatement.executeQuery();
			
			while(resultset.next()){
				Producto producto = new Producto(resultset.getInt(1), resultset.getString(2), resultset.getString(3), resultset.getDouble(4), resultset.getString(5));
				lista.add(producto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return lista;
	}
	
	
	public static Producto obtenerProducto(int codigo){
		Producto producto = null;
		
		try {
			CallableStatement callablestatement = ConexionBD.getConexion().prepareCall("{CALL sp_ProductoCod(?)}");
			callablestatement.setInt(1, codigo);
			ResultSet resultset = callablestatement.executeQuery();
			
			while(resultset.next()){
				producto = new Producto(resultset.getInt(1), resultset.getString(2), resultset.getString(3), resultset.getDouble(4), resultset.getString(5));
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return producto;
		
	}

}

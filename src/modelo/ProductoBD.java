package modelo;

import java.sql.*;
import java.util.*;

import utilidades.ConexionBD;

public class ProductoBD {
	
	static Connection conexion = ConexionBD.getConexion();
	static CallableStatement callablestatement = null;
	static ResultSet resultset = null;
	
	public static ArrayList<Producto> obtenerProducto(){
		ArrayList<Producto> lista = new ArrayList<Producto>();
		

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
	
	
	public static Producto obtenerProducto(int codigo){
		Producto producto = null;
		
		try {
			callablestatement = conexion.prepareCall("{CALL sp_ProductoCod(?)}");
			callablestatement.setInt(1, codigo);
			resultset = callablestatement.executeQuery();
			
			while(resultset.next()){
				producto = new Producto(resultset.getInt(1), resultset.getString(2), resultset.getString(3), resultset.getDouble(4), resultset.getString(5));
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return producto;
		
	}

}

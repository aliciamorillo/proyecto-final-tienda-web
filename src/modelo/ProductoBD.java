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

	
	public static boolean actualizarProducto(Producto varproducto) {
        boolean respuesta = false;
        
        try {
            Connection conexion = ConexionBD.getConexion();
            
            CallableStatement callablestatement = conexion.prepareCall( "{call sp_actualizarPro(?,?,?)}");
            callablestatement.setInt(1, varproducto.getCodigoProducto());
            callablestatement.setString(2, varproducto.getNombreFunko());
            callablestatement.setDouble(3, varproducto.getPrecio());
            
            int i=callablestatement.executeUpdate();
            
            if(i==1){
            	respuesta = true;
            }else{
            	respuesta = false;
            }
            
        } catch (Exception e) {
        	e.printStackTrace();
        }
        
        return respuesta;
    }
	
	
    public static boolean insertarProducto(Producto p) {
        boolean respuesta = false;
        
        try {
            Connection conexion = ConexionBD.getConexion();
            PreparedStatement callablestatement = conexion.prepareStatement("INSERT INTO productos (nombre,precio,imagen) VALUES (?,?,?); ");
            
            callablestatement.setString(1, p.getNombreFunko());
            callablestatement.setDouble(2, p.getPrecio());
            callablestatement.setString(3, p.getImagen());
            
            int i=callablestatement.executeUpdate();
            
            if(i==1){
            	respuesta=true;
            }else{
            	respuesta=false;
            }
            
        } catch (Exception e) {
        	e.printStackTrace();
        }
        
        return respuesta;
    } 
}

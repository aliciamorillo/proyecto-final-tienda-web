package modelo;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import utilidades.ConexionBD;

public class DetalleVentaBD {
	
    public static ArrayList<DetalleVenta> obtenerDetalleVenta(int num) {
        
    	ArrayList<DetalleVenta> lista = new ArrayList<DetalleVenta>();
	    
    	//Query: call sp_detalleVenta(?)
    	
    	try {
	        CallableStatement cl = ConexionBD.getConexion().prepareCall("{}");
	        cl.setInt(1, num);
	        ResultSet rs = cl.executeQuery();
	        
	        while (rs.next()) {
	            DetalleVenta v = new DetalleVenta(rs.getInt(1),
	                    rs.getInt(2),rs.getInt(3),rs.getDouble(4));
	            lista.add(v);
	        }
	    }catch (Exception e) {System.out.println(e);}
	    return lista;
	    
    }
    
}



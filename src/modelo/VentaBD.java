package modelo;

import java.sql.*;
import java.util.ArrayList;
import utilidades.ConexionBD;

////---

public class VentaBD {

	public static boolean insertarVenta(Venta venta, ArrayList<DetalleVenta>detalleVenta){
		
		boolean respuesta = false;
		
		try {
			Connection conexion = ConexionBD.getConexion();
			CallableStatement callablestatement = conexion.prepareCall("{call sp_RegistrarVenta(?,?)}");
			
			callablestatement.registerOutParameter(1, Types.INTEGER);
			callablestatement.setString(2, venta.getCliente());
			
			int i = callablestatement.executeUpdate();
			
			int i2 = 0;
			venta.setCodigoVenta(callablestatement.getInt(1));
			
			CallableStatement callablestatement2 = conexion.prepareCall("{call sp_RegistrarVenta(?,?,?,?)}");
			
			for(DetalleVenta aux : detalleVenta){
				callablestatement2.setInt(1, venta.getCodigoVenta());
				callablestatement2.setInt(2, aux.getCodigoProducto());
				callablestatement2.setDouble(3, aux.getCantidad());
				callablestatement2.setDouble(4, aux.getDescuento());
				
				i2 = callablestatement2.executeUpdate();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return respuesta;
	}
}

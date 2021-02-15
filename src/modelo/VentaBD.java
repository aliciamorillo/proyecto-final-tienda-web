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
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return respuesta;
	}
}

package utilidades;

import java.sql.*;

public class ConexionBD {
	
	static String DRIVER = "com.mysql.jdbc.Driver";
	static String jdbcURL = "jdbc:mysql://localhost:3306/tiendafunkos";
	static String USER = "root";
	static String PASS = "";
	
	public static Connection getConexion(){
		
		Connection conexion = null;
		
		try {
			Class.forName(DRIVER);
			conexion = DriverManager.getConnection(jdbcURL, USER, PASS);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return conexion;
	}

	public static void main(String[] args) {
		getConexion();
	}

}

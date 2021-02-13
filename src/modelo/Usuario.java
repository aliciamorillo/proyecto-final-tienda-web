package modelo;

public class Usuario {
	
	private int idUsuario;
	private String nombreUsuario;
	private String passUsuario;

	
	public Usuario(int idUsuario, String nombreUsuario, String passUsuario) {
		super();
		this.idUsuario = idUsuario;
		this.nombreUsuario = nombreUsuario;
		this.passUsuario = passUsuario;
	}


	public int getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}

	public String getNombreUsuario() {
		return nombreUsuario;
	}

	public void setNombreUsuario(String nombreUsuario) {
		this.nombreUsuario = nombreUsuario;
	}

	public String getPassUsuario() {
		return passUsuario;
	}

	public void setPassUsuario(String passUsuario) {
		this.passUsuario = passUsuario;
	}
	
	
	

}

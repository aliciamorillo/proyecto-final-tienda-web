package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
import utilidades.ConexionBD;


@WebServlet(name= "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	
	
	private void processRequest(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String accion=request.getParameter("accion");
        
		if(accion.equals("login")){
        String usu = request.getParameter("txtUsu");
        String pass = request.getParameter("txtPas");
		
        try{
            CallableStatement callableStatement = ConexionBD.getConexion().prepareCall("{call sp_Login(?,?)}");
            callableStatement.setString(1, usu);
            callableStatement.setString(2, pass);
            ResultSet resultSet = callableStatement.executeQuery();

            if(resultSet.next()){
                HttpSession sesionOK = request.getSession();
                
                sesionOK.setAttribute("perfil", (String)resultSet.getString(4));
                sesionOK.setAttribute("nombreUsuario", (String)resultSet.getString(2));
                sesionOK.setAttribute("pass", (String)resultSet.getString(3));
                
                request.getRequestDispatcher("index.jsp").forward(request, response);
            
            }else{
                request.setAttribute("msg", "Error de Usuario o Password");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            
            
            }
        }catch(Exception e){System.out.print(e);}
        
		}

	}




}

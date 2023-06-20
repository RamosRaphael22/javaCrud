package br.com.raphael3.projetoRafa3;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args ) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException
    {
    	Connection conn = criarConexao();
    	consulta(conn);
    }
    
    public static Connection criarConexao()
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {

		Connection connection = null;

		String serverName = "localhost";

		String mydatabase = "dbRaphael"; 

		String url = "jdbc:mysql://" + serverName + "/" + mydatabase;

		String username = "root"; 

		String password = "RR2210"; 
		connection = DriverManager.getConnection(url, username, password);

		Class.forName("com.mysql.jdbc.Driver").newInstance();

		if (connection != null) {
			System.out.println("STATUS: Conectado com sucesso!");
		} else {
			System.out.println("STATUS: Não foi possivel realizar conexão");
		}

		return connection;
	}
    
    public static void consulta(Connection conn) throws SQLException {
    	Statement stmt = conn.createStatement(); 
    	ResultSet resultado = stmt.executeQuery("SELECT * " + "FROM usuario " + "INNER JOIN historico ON usuario.UserID = historico.UserID;");
    	while(resultado.next()) {
    		
    		 System.out.println (resultado.getInt("UserID")); 

    		 System.out.println (resultado.getString("NomeDeUsuario"));
        	
    		 System.out.println (resultado.getInt("IDHistorico"));
        	
    		 System.out.println (resultado.getString("Operacoes"));
    	}
    	
    	resultado.close(); 
    	stmt.close(); 
    	conn.close(); 
    }
    
}

package projetoRafa4;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;

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
    	inserir(conn);

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
    }
    public static void inserir(Connection conn) throws SQLException {
    	    	
    	PreparedStatement statement1 = null;
    	PreparedStatement statement2 = null;

    	try {
    	    
    	    
    	    conn.setAutoCommit(false);
    	    
    	
    	    String sql1 = "INSERT INTO usuario (UserID, NomeDeUsuario) VALUES (?, ?)";
    	    statement1 = conn.prepareStatement(sql1);
    	    statement1.setInt(1, 4);
    	    statement1.setString(2, "valor2");
    	    statement1.executeUpdate();
    	        	  
    	    String sql2 = "INSERT INTO historico (UserID, IDHistorico, Operacoes) VALUES (?, ?, ?)";
    	    statement2 = conn.prepareStatement(sql2);
    	    statement2.setInt(1, 4);
    	    statement2.setInt(2, 4);
    	    statement2.setString(3, "valor4");
    	    statement2.executeUpdate();
    	    
    	    conn.commit();
    	    
    	    System.out.println("Dados inseridos nas duas tabelas com sucesso!");
    	} catch (SQLException e) {
    	
    	    if (conn != null) {
    	        try {
    	            conn.rollback();
    	        } catch (SQLException ex) {
    	            ex.printStackTrace();
    	        }
    	    }
    	    
    	    e.printStackTrace();
    	} finally {
    	   
    	    if (statement1 != null) {
    	        statement1.close();
    	    }
    	    if (statement2 != null) {
    	        statement2.close();
    	    }
    	    if (conn != null) {
    	        conn.close();
    	    }
    	}


    }    
}

package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionBD {

    private Connection con;
    private final String driver = "com.mysql.cj.jdbc.Driver";
    private final String user   = "root";
    private final String pass   = "yourpass";
    private final String bd     = "yourBDname";
    private final String port = "yourPort";
    private final String url    = "jdbc:mysql://localhost:"+port+"/"+bd;

    public Connection getConnection() {
        
        try {
            Class.forName(driver);
            con = DriverManager.getConnection(url, user, pass);
            System.out.println("La conexión a la base de datos "+bd+" ha sido un exito.");
            
        } catch (ClassNotFoundException | SQLException e) {
            
            System.out.println("Error en la conexión " + e);
            
        }
        
        return con;
        
    }

}

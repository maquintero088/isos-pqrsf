package ISOSPQRSFDB;
import GestionUsuarios.usuario_bd;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
public class ISOSPQRSFDB {
    Connection DB;
    private String username = "root";
    private String password = "";
    private String database = "isospqrsfdb";
    private String hostname = "localhost";

    public Connection DB() {
        try{
            Class.forName("com.mysql.jdbc.Driver");
            DB=DriverManager.getConnection("jdbc:mysql://" + hostname + "/" + database, username, password);
        }catch(ClassNotFoundException ex){
            Logger.getLogger(usuario_bd.class.getName()).log(Level.SEVERE,null, ex);           
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }
     return DB;
    }
    public ResultSet Resultado(String query) {        
        Statement st;
        ResultSet rs=null;     
        try {  
            st= DB.createStatement();
            rs= st.executeQuery(query); 
            System.out.println(query);
        }catch(SQLException e){
            e.printStackTrace();
        }       
        return rs;
    }   
    public void Ejecutar(String query) {
        Statement st;                 
        try {  
            st= DB.createStatement();
            st.executeUpdate(query);             
            System.out.println(query);
        }catch(SQLException e){            
            e.printStackTrace();
        }
        
    }    
    public boolean Cerrar() { 
        boolean ok =true;       
        try {  
           DB.close();           
        }catch(SQLException e){
            ok = false;
            e.printStackTrace();
        }
        return ok;
    }
}
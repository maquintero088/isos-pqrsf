package Sesion;
import ISOSPQRSFDB.ISOSPQRSFDB;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
public class logindb {
    private int validacion; 
    private String nombre;
    int datos(String id, String password) {
        ISOSPQRSFDB datos=new ISOSPQRSFDB();
        Connection nuevaconeccion = datos.DB();
        String sql = "SELECT usu_Id,cast(aes_decrypt(usu_Contrasena,1234) as char) FROM usuario WHERE usu_Id = "+id+";";        
        try {
            ResultSet rs = datos.Resultado(sql);
            while (rs.next()){
                if(
                        rs.getString("usu_Id").equals(id)&&
                        rs.getString("cast(aes_decrypt(usu_Contrasena,1234) as char)").equals(password)
                        ){
                    validacion=1;                   
                }else{  
                    validacion=2;      
                }         
            }
        } catch (SQLException ex) {
            Logger.getLogger(logindb.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            datos.Cerrar();
        }
        return validacion;
    }      
}
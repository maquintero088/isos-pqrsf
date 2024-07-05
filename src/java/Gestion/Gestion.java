package Gestion;
import ISOSPQRSFDB.ISOSPQRSFDB;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
public class Gestion {
    private  String usuario,sql,ins,fecha,reg,id;
    public static String pass;
    public static int[] alertas=new int[4];
    private  ResultSet rs;    
    private int i,validacion, rol,proceso;
    public String usuario(String id){
        ISOSPQRSFDB db=new ISOSPQRSFDB ();
        Connection c=db.DB();          
        sql = "SELECT usu_Primernombre,usu_Segundonombre,usu_Primerapellido,usu_Segundoapellido "
                + "FROM usuario "
                + "WHERE usu_Id = "+id+" ;";        
        try {            
            rs = db.Resultado(sql);   
              while(rs.next()){     
                   usuario=rs.getString("usu_Primernombre");
                   usuario=usuario+" "+rs.getString("usu_Segundonombre");
                   usuario=usuario+" "+rs.getString("usu_Primerapellido");
                   usuario=usuario+" "+rs.getString("usu_Segundoapellido");
              }                 
        } catch (SQLException ex) {
            Logger.getLogger(Gestion.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            db.Cerrar();
        }
        return usuario;        
    }
    public String seguimiento(String Usuario,int Modulo,String Formulario,String Registro){
        ISOSPQRSFDB db=new ISOSPQRSFDB ();
        Connection c=db.DB(); 
        ins="INSERT INTO gestion (fk_usu_Id,fk_mod_Codigo,formulario,formulario_id) VALUES ("+Usuario+","+Modulo+",'"+Formulario+"',"+Registro+");";        
        db.Ejecutar(ins);
        fecha=this.fecha(Usuario);
        return fecha;        
    }
    public String registro(){
        ISOSPQRSFDB db=new ISOSPQRSFDB ();
        Connection c=db.DB(); 
        sql="SELECT max(ges_Codigo) FROM gestion WHERE formulario = 'Acceder';";
        rs = db.Resultado(sql);
        try { 
            while(rs.next()){  
                reg=rs.getString("max(ges_Codigo)");
            }            
        } catch (SQLException ex) {
            Logger.getLogger(Gestion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return reg;    
    }
    public String seguimiento(){
        ISOSPQRSFDB db=new ISOSPQRSFDB ();
        Connection c=db.DB(); 
        sql="SELECT fk_usu_Id FROM gestion WHERE ges_Codigo = "+registro()+";";
        rs = db.Resultado(sql);
        try { 
            while(rs.next()){  
                id=rs.getString("fk_usu_Id");
            }            
        } catch (SQLException ex) {
            Logger.getLogger(Gestion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;    
    }
    public String fecha(String Usuario){
        ISOSPQRSFDB db=new ISOSPQRSFDB ();
        Connection c=db.DB(); 
        sql="SELECT fecha FROM gestion WHERE fk_usu_Id = "+Usuario+";";
        rs = db.Resultado(sql);
        try { 
            while(rs.next()){  
                fecha=rs.getString("fecha");
            }            
        } catch (SQLException ex) {
            Logger.getLogger(Gestion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return fecha;        
    }
    public int modulo (String id,int modulo){
        ISOSPQRSFDB db=new ISOSPQRSFDB ();
        Connection c=db.DB(); 
        sql="SELECT fk_mod_Codigo FROM privilegios WHERE fk_mod_Codigo = "+modulo+" and fk_rol_Codigo = "+this.rol(id)+";";
        rs = db.Resultado(sql);
        try { 
            while(rs.next()){  
                if(rs.getInt("fk_mod_Codigo")==modulo){
                    validacion=1;
                }else{
                    validacion=2;
                }
            }            
        } catch (SQLException ex) {
            Logger.getLogger(Gestion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return validacion;        
    }
    public int rol (String id){
        ISOSPQRSFDB db=new ISOSPQRSFDB ();
        Connection c=db.DB(); 
        sql="SELECT fk_rol_Codigo FROM usuario WHERE usu_Id = "+id+";";
        rs = db.Resultado(sql);
        try { 
            while(rs.next()){  
                rol=rs.getInt("fk_rol_Codigo");
            }            
        } catch (SQLException ex) {
            Logger.getLogger(Gestion.class.getName()).log(Level.SEVERE, null, ex);
        } 
        return rol;        
    }
    public int proceso(String password){
         ISOSPQRSFDB db=new ISOSPQRSFDB ();
        Connection c=db.DB(); 
        sql="SELECT fk_pro_Codigo FROM usuario WHERE cast(AES_DECRYPT(usu_Contrasena,1234)as char) = "+password+";";
        rs = db.Resultado(sql);
        try { 
            while(rs.next()){  
                proceso=rs.getInt("fk_pro_Codigo");
            }            
        } catch (SQLException ex) {
            Logger.getLogger(Gestion.class.getName()).log(Level.SEVERE, null, ex);
        } 
        return proceso;        
    }
    public int estado(String id,int modulo){
        ISOSPQRSFDB db=new ISOSPQRSFDB ();
        Connection c=db.DB(); 
        sql="SELECT Estado FROM privilegios WHERE fk_mod_Codigo = "+modulo+" and fk_rol_Codigo = "+this.rol(id)+";";
        rs = db.Resultado(sql);
        try { 
            while(rs.next()){  
                if(rs.getInt("Estado")==1){
                    validacion=1;
                }else{
                    validacion=2;
                }
            }            
        } catch (SQLException ex) {
            Logger.getLogger(Gestion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return validacion;        
    }
    public int privilegio (int modulo,String id, String privilegio){
        ISOSPQRSFDB db=new ISOSPQRSFDB ();
        Connection c=db.DB(); 
        sql="SELECT "+privilegio+" FROM privilegios WHERE fk_mod_Codigo = "+modulo+" and fk_rol_Codigo = "+this.rol(id)+";";
        rs = db.Resultado(sql);
        try { 
            while(rs.next()){  
                if(rs.getInt(privilegio)==1){
                    validacion=1;
                }else{
                    validacion=2;
                }
            }            
        } catch (SQLException ex) {
            Logger.getLogger(Gestion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return validacion; 
    }
}
    
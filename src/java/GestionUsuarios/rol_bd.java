package GestionUsuarios;
import ISOSPQRSFDB.ISOSPQRSFDB;
import java.sql.Connection;
public class rol_bd {
    String sql;  
    public void Rol_bd (
            String Nombre
    ){       
        sql="INSERT INTO rol (rol_Nombre) VALUES ('"+Nombre+"');";        
        System.out.println(sql);
        ISOSPQRSFDB db=new ISOSPQRSFDB ();
        Connection c=db.DB();       
        db.Ejecutar(sql);
    }
    public void privilegios(int Modulo, int Rol, String privilegio, int valor) {
       sql="UPDATE privilegios SET "+privilegio+" = "+valor+" WHERE fk_mod_Codigo = "+Modulo+" AND fk_rol_Codigo = "+Rol+";";
        System.out.println(sql);
        ISOSPQRSFDB db=new ISOSPQRSFDB ();
        Connection c=db.DB();       
        db.Ejecutar(sql);
    } 
    public void update (int Codigo, String Nombre){       
        sql="UPDATE rol SET rol_Nombre = '"+Nombre+"' WHERE rol_Codigo = "+Codigo+";";        
        System.out.println(sql);
        ISOSPQRSFDB db=new ISOSPQRSFDB ();
        Connection c=db.DB();       
        db.Ejecutar(sql);
    }
    public void Privilegios(int Modulo, int Rol, String[] privilegios) {
       sql="INSERT INTO privilegios VALUES ("+Rol+","+Modulo+","+privilegios[0]+","+privilegios[1]+","+privilegios[2]+","+privilegios[3]+");"; 
        System.out.println(sql);
        ISOSPQRSFDB db=new ISOSPQRSFDB ();
        Connection c=db.DB();       
        db.Ejecutar(sql);
    }
}

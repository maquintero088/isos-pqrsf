package GestionUsuarios;
import ISOSPQRSFDB.ISOSPQRSFDB;
import java.sql.Connection;
public class usuario_bd {
    String sql;  
    public void USUARIO ( 
            String id,
            int documento,
            String password,
            String nombre1,
            String nombre2,
            String apellido1,
            String apellido2,            
            String celular,
            String correo,            
            int genero,
            int municipio,
            int proceso,
            int rol
    ){       
        sql="INSERT INTO usuario ("
                + "usu_Id,fk_doc_Codigo,usu_Contrasena,usu_Primernombre,usu_Segundonombre,"
                + "usu_Primerapellido,usu_Segundoapellido,fk_gen_Codigo,usu_Celular,usu_Correo,fk_mun_Codigo,fk_pro_Codigo,fk_rol_Codigo"
                + ") VALUES ("+id+","+documento+",AES_ENCRYPT('"+password+"','1234'),'"+nombre1+"','"+nombre2
                + "','"+apellido1+"','"+apellido2+"',"+genero+","+ celular+",'"+correo+"',"+municipio+","+proceso+","+rol+");";        
        System.out.println(sql);
        ISOSPQRSFDB db=new ISOSPQRSFDB ();
        Connection c=db.DB();       
        db.Ejecutar(sql);
    }   
    
    public void update ( 
            String update,
            int documento,
            String id,
            String nombre1,
            String nombre2,
            String apellido1,
            String apellido2,            
            String celular,
            String correo,
            int genero,
            int municipio,  
            int proceso
    ){       
        sql="UPDATE usuario SET "
                + "usu_Id = "+id+",fk_doc_Codigo = "+documento+",usu_Primernombre = '"+nombre1+"', usu_Segundonombre = '"+nombre2+"',"
                + "usu_Primerapellido = '"+apellido1+"',usu_Segundoapellido = '"+apellido2+"',fk_gen_Codigo = "+genero+","
                + "usu_Celular = "+ celular+",usu_Correo = '"+correo+"',fk_mun_Codigo = "+municipio+",fk_pro_Codigo = "+proceso+" WHERE usu_Id = "+update+";";        
        System.out.println(sql);
        ISOSPQRSFDB db=new ISOSPQRSFDB ();
        Connection c=db.DB();       
        db.Ejecutar(sql);
    }

    public void contraseña(String id, String password) {
       sql="UPDATE usuario SET usu_Contrasena = AES_ENCRYPT('"+password+"','1234') WHERE usu_Id = "+id+";";
        System.out.println(sql);
        ISOSPQRSFDB db=new ISOSPQRSFDB ();
        Connection c=db.DB();       
        db.Ejecutar(sql);
    }
}

package Informes;
import ISOSPQRSFDB.ISOSPQRSFDB;
import java.sql.Connection;
public class encuesta_bd {
   String sql;
    public void ENCUESTA (){          
            sql="INSERT INTO encuesta (enc_Fecha) "
                    + "VALUES ();";
                
        System.out.println(sql);
        ISOSPQRSFDB db=new ISOSPQRSFDB ();
        Connection c=db.DB();       
        db.Ejecutar(sql);
    }    

    public void update(String enc_Id, String column, String valor) {
        sql="UPDATE encuesta_pregunta set "+column+" = "+valor+" WHERE fk_enc_Id = "+enc_Id+";";                
        System.out.println(sql);
        ISOSPQRSFDB db=new ISOSPQRSFDB ();
        Connection c=db.DB();       
        db.Ejecutar(sql);
    }
}

package com.qcmarcel.IsosPQRSF.GestionRespuestas;
import com.qcmarcel.IsosPQRSF.ISOSPQRSFDB.ISOSPQRSFDB;
import java.sql.Connection;
public class respuesta_bd {
   String sql;
    public void RESPUESTA (
             int Radicado,
            String Asunto,
            String Contenido
    ){          
            sql="INSERT INTO respuesta (fk_sol_Radicado,res_Asunto,res_Contenido,fk_est_Codigo) "
                    + "VALUES ("+Radicado+",'"+Asunto+"','"+Contenido+"',1);";
                
        System.out.println(sql);
        ISOSPQRSFDB db=new ISOSPQRSFDB ();
        Connection c=db.DB();       
        db.Ejecutar(sql);
    }    

    public void update(String res_Id, String Asunto, String Contenido) {
        sql="UPDATE respuesta set res_Asunto = "+Asunto+" and res_Contenido = "+Contenido+" WHERE res_Id = "+res_Id+";";                
        System.out.println(sql);
        ISOSPQRSFDB db=new ISOSPQRSFDB ();
        Connection c=db.DB();       
        db.Ejecutar(sql);
    }
}

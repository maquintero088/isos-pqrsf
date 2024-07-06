package com.qcmarcel.IsosPQRSF.Revisiones;
import com.qcmarcel.IsosPQRSF.ISOSPQRSFDB.ISOSPQRSFDB;
import java.sql.Connection;
public class revision_bd {
    public revision_bd(String form,String clave,String estado,String Observaciones){
        String sql="UPDATE "+form+" SET fk_est_Codigo = "+estado+",Observaciones = '"+Observaciones+"' WHERE "+clave+";";
        ISOSPQRSFDB db=new ISOSPQRSFDB ();
        Connection c=db.DB();       
        db.Ejecutar(sql);
    }
}

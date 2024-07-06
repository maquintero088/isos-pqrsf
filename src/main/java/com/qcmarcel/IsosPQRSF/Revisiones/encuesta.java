package com.qcmarcel.IsosPQRSF.Revisiones;
import com.qcmarcel.IsosPQRSF.ISOSPQRSFDB.ISOSPQRSFDB;
import java.sql.Connection;
import java.sql.SQLException;
public class encuesta {
    public static String [] encuesta;
    public static int pregunta=0,var=0;
    public void Encuesta(){
        
    }
    public void Pregunta(){
        
    }
    public void Opcion(){
        
    }
    public void Satisfaccion(String encuesta,String pregunta,String opc,String Respuesta) throws SQLException{
        ISOSPQRSFDB db=new ISOSPQRSFDB ();
        Connection c=db.DB();       
        db.Ejecutar(
                "INSERT INTO satisfaccion VALUES ("+encuesta+","+pregunta+","+opc+"); ");
        if(db.Resultado("SELECT fk_res_Id FROM satisfaccion_respuesta WHERE fk_enc_Id = "+encuesta+";").getString("fk_res_Id")==null){
           db.Ejecutar(
                "INSERT INTO satisfaccion_respuesta VALUES ("+encuesta+","+Respuesta+"); ");         
        }        
    }
}

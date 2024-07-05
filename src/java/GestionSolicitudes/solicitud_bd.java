package GestionSolicitudes;
import ISOSPQRSFDB.ISOSPQRSFDB;
import java.sql.Connection;
public class solicitud_bd {
   String sql;
    public void SOLICITUD (
             int tipo,
            int ciudadano,
            int documento,
            int municipio,
            int genero,
            String id,
            String Primernombre,
            String Segundonombre,
            String Primerapellido, 
            String Segundoapellido,
            String direccion,
            String celular,
            String correo,
            int cuenta,
            int proceso,
            int medio,
            String asunto,
            String contenido
            
    ){   
       
            sql="INSERT INTO solicitud (fk_mun_Codigo,fk_tip_Codigo,fk_ciu_Codigo,fk_doc_Codigo"
            + ",sol_Numero,sol_Primernombre,sol_Segundonombre,sol_Primerapellido,sol_Segundoapellido"
            + ",sol_Celular,sol_Direccion,sol_Correo,fk_cue_Codigo,fk_gen_Codigo,fk_pro_Codigo,fk_med_Codigo"
            + ",sol_Asunto,sol_Contenido,fk_est_Codigo) "
            + " VALUES ("+municipio+","+tipo+","+ciudadano+","+documento
            + ","+id+",'"+Primernombre+"','"+Segundonombre+"','"+Primerapellido+"','"+Segundoapellido+"',"+celular+",'"+direccion
            + "','"+correo+"',"+cuenta+","+genero+","+proceso+","+medio
            + ",'"+asunto+"','"+contenido+"',1);";
                
        ISOSPQRSFDB db=new ISOSPQRSFDB ();
        Connection c=db.DB();       
        db.Ejecutar(sql);
    }    

    public void update(String Radicado, String column, String valor) {
        sql="UPDATE solicitud set "+column+" = "+valor+" WHERE sol_Radicado = "+Radicado+";";                
        System.out.println(sql);
        ISOSPQRSFDB db=new ISOSPQRSFDB ();
        Connection c=db.DB();       
        db.Ejecutar(sql);
    }
}

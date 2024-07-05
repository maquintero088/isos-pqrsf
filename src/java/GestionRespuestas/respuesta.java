package GestionRespuestas;
public class respuesta {
    public static int var;
    public static String res_Id[];
    public void respuesta (
            int Radicado,
            String Asunto,
            String Contenido   
    ){ 
       respuesta_bd Respuesta_bd=new respuesta_bd(); 
       Respuesta_bd.RESPUESTA(Radicado, Asunto, Contenido);
    }    
    public void update (String res_Id,String Asunto,String Contenido){
         respuesta_bd Respuesta_bd=new respuesta_bd(); 
         Respuesta_bd.update(res_Id,Asunto,Contenido);
    }
}

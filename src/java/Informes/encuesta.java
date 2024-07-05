package Informes;
public class encuesta {
    public static String Fecha;
    public void encuesta(){
        encuesta_bd encuesta_bd = new encuesta_bd(); 
        encuesta_bd.ENCUESTA();  
    }
    public void pregunta(String pregunta){
        
    }
    public void valor(String valor){
        
    }
    public void update(String enc_Id, String column, String valor){
        encuesta_bd encuesta_bd = new encuesta_bd();
        encuesta_bd.update(enc_Id, column, valor); 
    }
}

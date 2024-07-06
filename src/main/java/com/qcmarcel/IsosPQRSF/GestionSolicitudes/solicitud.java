package com.qcmarcel.IsosPQRSF.GestionSolicitudes;
public class solicitud {
    public static int var;
    public static String radicado[];
    public void Solicitud (
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
       solicitud_bd Solicitud_bd=new solicitud_bd(); 
       Solicitud_bd.SOLICITUD(tipo, ciudadano, documento, municipio, genero, id, Primernombre, Segundonombre, Primerapellido, Segundoapellido, direccion, celular, correo, cuenta, proceso, medio, asunto, contenido);
    }    
    public void update (String Radicado,String column,String valor){
         solicitud_bd Solicitud_bd=new solicitud_bd(); 
         Solicitud_bd.update(Radicado,column,valor);
    }
}

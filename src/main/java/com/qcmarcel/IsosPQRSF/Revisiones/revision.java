package com.qcmarcel.IsosPQRSF.Revisiones;
public class revision {
    public static int var=0;
    public revision(String form,String clave,String estado,String Observaciones){
        revision_bd revision_bd = new revision_bd(form,clave,estado,Observaciones); 
    }    
}

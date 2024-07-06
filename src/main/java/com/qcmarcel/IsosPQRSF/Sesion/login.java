package com.qcmarcel.IsosPQRSF.Sesion;
public final class login {   
    public int negocio(String id,String password) {
        logindb negociodatos= new logindb();
        return negociodatos.datos(id,password);          
    }  
}
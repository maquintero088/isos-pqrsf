package GestionUsuarios;
public class rol {
    public static String[] 
            Rol,
            USUARIOS = new String[4],
            SOLICITUDES = new String[4],
            RESPUESTAS = new String[4],
            INFORMES = new String[4];
    public static int estado;
    
    public void Rol(
            String Nombre)
    { 
        rol_bd rol_bd=new rol_bd();
        rol_bd.Rol_bd(Nombre);
    }  
    public void privilegios (int Modulo, int Rol, String privilegio, String valor) {
        rol_bd rol_bd=new rol_bd();
        if(!"checked".equals(valor)){
            rol_bd.privilegios(Modulo, Rol, privilegio, 1);
        }else{
            rol_bd.privilegios(Modulo, Rol, privilegio, 0);
        }         
    }
    public void update(int Codigo,
            String Nombre)
    { 
        rol_bd rol_bd=new rol_bd();
        rol_bd.update(Codigo,Nombre);
    }  
    public void Privilegios (int Modulo, int Rol, String[] privilegios) {
        rol_bd rol_bd=new rol_bd(); 
            rol_bd.Privilegios(Modulo, Rol, privilegios);
            rol_bd.Privilegios(Modulo, Rol, privilegios);
    }
}
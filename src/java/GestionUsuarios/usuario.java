package GestionUsuarios;
public class usuario {
    String[] Lista;    
    public static int estado;
    public void Usuario(
            int documento,
            String id,
            String password,
            String nombre1,
            String nombre2,
            String apellido1,
            String apellido2,            
            String celular,
            String correo,
            int genero,
            int municipio,  
            int proceso,
            int rol){ 
        usuario_bd Usuario_bd=new usuario_bd();
        Usuario_bd.USUARIO(id, documento, password, nombre1, nombre2, apellido1, apellido2, celular, correo, genero, municipio, proceso, rol);           
    }  
    public void update(
            String update,
            int documento,
            String id,
            String nombre1,
            String nombre2,
            String apellido1,
            String apellido2,            
            String celular,
            String correo,
            int genero,
            int municipio,  
            int proceso){ 
        usuario_bd Usuario_bd=new usuario_bd();
        Usuario_bd.update(update, documento, id, nombre1, nombre2, apellido1, apellido2, celular, correo, genero, municipio, proceso);
    } 
    public void contraseña (String id,String password){
        usuario_bd Usuario_bd=new usuario_bd();
        Usuario_bd.contraseña(id,password); 
    }
}
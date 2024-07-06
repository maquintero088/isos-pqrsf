package com.qcmarcel.IsosPQRSF.Gestion;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
public final class SMTP {
    public int direccion(String cuenta){
            if (
                    !"misena.edu.co".equals(cuenta)|| 
                    !"gmail.com".equals(cuenta)||
                    !"gmail.es".equals(cuenta)
                    ){
                i=0;
            } else if(!"sena.edu.co".equals(cuenta)||
                    !"live.com".equals(cuenta)||
                    !"hotmail.com".equals(cuenta)||
                    !"hotmail.es".equals(cuenta)||
                    !"outlook.com".equals(cuenta)||
                    !"outlook.es".equals(cuenta)){ 
                i=2;                
            } else if(!"yahoo.com".equals(cuenta)){
                 i=3;
            }
        return i;            
    }    
    public SMTP(String Correo,String Asunto,String Contenido,String cuenta,String file){
        if(!Correo.equalsIgnoreCase("") && !Correo.equalsIgnoreCase(" ")){
            Properties props = new Properties(); 
            String[][] valores = new String [2][2];
            if(!cuenta.equalsIgnoreCase("") && !cuenta.equalsIgnoreCase(" ")){
                valores[0][0]=Usuario[direccion(cuenta)];
                valores[0][1]=clave[direccion(cuenta)];
                valores[1][0]=servidorSMTP[direccion(cuenta)];
                valores[1][1]=puertoEnvio[direccion(cuenta)];
                System.out.println(Correo+","+Asunto+","+Contenido);                             
                props.put("mail.smtp.user", valores[0][0]);
                props.put("mail.smtp.host", valores[1][0]);
                props.put("mail.smtp.port", valores[1][1]);
                props.put("mail.smtp.starttls.enable", "true");
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.socketFactory.port", valores[1][1]);
                props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory"); 
                props.put("mail.smtp.socketFactory.fallback", "false");try {
                Authenticator auth = new autenticar(valores[0][0],valores[0][1]);
                Session session = Session.getInstance(props, auth);
                MimeMessage msg = new MimeMessage(session);
                msg.setText(Contenido);
                msg.setSubject(Asunto);
                msg.setFileName(file);
                msg.setFrom(new InternetAddress(valores[0][0]));
                msg.addRecipient(Message.RecipientType.TO, new InternetAddress(Correo));
                Transport.send(msg);
            } catch (Exception ex) {
                ex.printStackTrace();
            }finally{
                mensaje("Envio exitoso");
            }
            }else{
                props.put("mail.smtp.user", Usuario[0]);
                props.put("mail.smtp.host", servidorSMTP[0]);
                props.put("mail.smtp.port", puertoEnvio[0]);
                props.put("mail.smtp.starttls.enable", "true");
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.socketFactory.port", puertoEnvio[0]);
                props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
                props.put("mail.smtp.socketFactory.fallback", "false");
                try {
                Authenticator auth = new autenticar(Usuario[0],clave[0]);
                Session session = Session.getInstance(props, auth);
                MimeMessage msg = new MimeMessage(session);
                msg.setText(Contenido);
                msg.setSubject(Asunto);
                msg.setFileName(file);
                msg.setFrom(new InternetAddress(Usuario[0]));
                msg.addRecipient(Message.RecipientType.TO, new InternetAddress(Correo));
                Transport.send(msg);
            } catch (Exception ex) {
                ex.printStackTrace();
            }finally{
                mensaje("Envio exitoso");
            }
            }
        }else{
            mensaje("especifique los campos");
        }
    }
    private String mensaje(String mensaje) {
     return mensaje;        
    }
    int i;
     String []
         Usuario={"maquintero088@misena.edu.co","marcel_q@outlook.com","mariocasas64@yahoo.com"},
         clave={"snqhthttwqewjxoh","83nd170j3h0v4"},
         servidorSMTP = {"smtp.gmail.com","smtp.live.com",""},
         puertoEnvio = {"465","587"};  
}
	

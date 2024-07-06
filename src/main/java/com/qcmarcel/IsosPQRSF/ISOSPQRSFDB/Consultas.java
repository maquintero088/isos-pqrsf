package com.qcmarcel.IsosPQRSF.ISOSPQRSFDB;
import com.qcmarcel.IsosPQRSF.Sesion.logindb;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
public class Consultas {    
    String[] Lista;
    int i,row=0,validacion;
    private ResultSet rs,rs2,rs3;
    public String[][] Lista2;    
    private String valor,sql3,privilegio;
    private static String where;
    public int rows(String table,String filtro){
        ISOSPQRSFDB db=new ISOSPQRSFDB ();
        Connection c = db.DB();  
        sql3 = "SELECT "+filtro+" FROM "+table+";"; 
        rs2 = db.Resultado(sql3);
        try {
            if (rs2 != null)
            while(rs2.next()){
                row++;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Consultas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return row;        
    }
    public String valores(String table,String column,String columnid, String id){
        ISOSPQRSFDB db=new ISOSPQRSFDB ();
        Connection c=db.DB();  
        sql3="SELECT "+column+" FROM "+table+" WHERE "+columnid+" = "+id+";"; 
        rs3 = db.Resultado(sql3);
        try {
            if (rs3 != null)
            while(rs3.next()){
            valor=rs3.getString(column);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Consultas.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            db.Cerrar();
        }
        return valor;    
    }
    public String[] valores(String table,String column,String filtro){
        ISOSPQRSFDB db=new ISOSPQRSFDB ();
        Connection c=db.DB();          
        sql3 = "SELECT "+column+" FROM "+table+";";        
        try {            
            rs = db.Resultado(sql3);            
            Lista = new String[this.rows(table,filtro)]; 
            if (Lista.length > 0)
              while(rs.next()){     
                   Lista[i]=rs.getString(column);
                   i++;
            }                 
        } catch (SQLException ex) {
            Logger.getLogger(logindb.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            db.Cerrar();
        }
        return Lista;     
    }
    public int id(String id) {
        ISOSPQRSFDB db=new ISOSPQRSFDB ();
        Connection c=db.DB();          
        sql3 = "SELECT usu_Id FROM usuario WHERE usu_Id = "+id+";";        
        try {            
            rs = db.Resultado(sql3);
              while(rs.next()){     
                  if (rs.getString("usu_Id") == null){
                      validacion=2;
                  }else{
                      validacion=1;
                  }
            }                 
        } catch (SQLException ex) {
            Logger.getLogger(logindb.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            db.Cerrar();
        }
        return validacion;      
    }
   
    public String[][] solicitud(String filtro,int Proceso,int estado) {
        ISOSPQRSFDB db=new ISOSPQRSFDB ();
        Connection c=db.DB();
        if(Proceso==0){
            sql3="SELECT sol_Radicado,sol_Fecha,fk_mun_Codigo,fk_tip_Codigo,fk_ciu_Codigo,fk_pro_Codigo,sol_Asunto "
                    + "FROM solicitud "
                    + "WHERE  fk_est_Codigo = "+estado;
        }else{
        if(filtro!=null){
            sql3="SELECT sol_Radicado,sol_Fecha,fk_mun_Codigo,fk_tip_Codigo,fk_ciu_Codigo,fk_pro_Codigo,sol_Asunto "
                    + "FROM solicitud "
                    + "WHERE fk_pro_Codigo = "+Proceso+" AND fk_est_Codigo = "+estado
                    + " order by "+filtro+";";
        }else{
            sql3="SELECT sol_Radicado,sol_Fecha,fk_mun_Codigo,fk_tip_Codigo,fk_ciu_Codigo,fk_pro_Codigo,sol_Asunto FROM solicitud"
                    + " WHERE fk_pro_Codigo = "+Proceso+" AND fk_est_Codigo = "+estado+";";
        } 
        }try {            
            rs = db.Resultado(sql3);
            Lista2 = new String[this.rows("solicitud","*")][7];    
              while(rs.next()){     
                   Lista2[i][0]=rs.getString("sol_Fecha");
                   Lista2[i][1]=this.valores("municipio", "mun_Nombre", "mun_Codigo", rs.getString("fk_mun_Codigo"));
                   Lista2[i][2]=this.valores("tipo", "tip_Nombre","tip_Codigo", rs.getString("fk_tip_Codigo"));
                   Lista2[i][3]=this.valores("ciudadano","ciu_Nombre","ciu_Codigo", rs.getString("fk_ciu_Codigo"));
                   Lista2[i][4]=this.valores("proceso", "pro_Nombre", "pro_Codigo", rs.getString("fk_pro_Codigo"));
                   Lista2[i][5]=rs.getString("sol_Asunto");
                   Lista2[i][6]=rs.getString("sol_Radicado");
                   i++;
            }                 
        } catch (SQLException ex) {
            Logger.getLogger(logindb.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            db.Cerrar();    
        }     
        return Lista2;
    }
     public String[][] respuesta(String filtro,int estado) {
        ISOSPQRSFDB db=new ISOSPQRSFDB ();
        Connection c=db.DB();
        if(null!=filtro){
            sql3="SELECT res_Id,res_Fecha,fk_sol_Radicado,res_Asunto FROM respuesta "
                    + "WHERE fk_est_Codigo = "+estado
                    + " order by "+filtro+";";
        }else{ 
            sql3="SELECT res_Id,res_Fecha,fk_sol_Radicado,res_Asunto FROM respuesta"
                    + " WHERE fk_est_Codigo ="+estado+";";
        } try {            
            rs = db.Resultado(sql3);
            Lista2 = new String[this.rows("respuesta","*")][6];    
              while(rs.next()){     
                   Lista2[i][0]=rs.getString("res_Fecha");
                   Lista2[i][1]=rs.getString("fk_sol_Radicado");
                   Lista2[i][2]=this.valores("tipo", "tip_Nombre","tip_Codigo", 
                           this.valores("solicitud", "fk_tip_Codigo", "sol_Radicado", rs.getString("fk_sol_Radicado")));
                   Lista2[i][3]=this.valores("solicitud","sol_Fecha","sol_Radicado", rs.getString("fk_sol_Radicado"));
                   Lista2[i][4]=rs.getString("res_Asunto");
                   Lista2[i][5]=rs.getString("res_Id");
                   i++;
            }                 
        } catch (SQLException ex) {
            Logger.getLogger(logindb.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            db.Cerrar();    
        }     
        return Lista2;
    }
     public String privilegios(int modulo,String rol, String Privilegio) {
        ISOSPQRSFDB db=new ISOSPQRSFDB ();
        Connection c=db.DB(); 
        sql3="SELECT "+Privilegio+" FROM privilegios WHERE fk_mod_Codigo = "+modulo+" and fk_rol_Codigo = "+rol+";";
        rs = db.Resultado(sql3);
        try { 
            while(rs.next()){  
                if(rs.getInt(Privilegio)==1){
                    privilegio="Si";
                }else{
                    privilegio="No";
                }
            }            
        } catch (SQLException ex) {
            Logger.getLogger(logindb.class.getName()).log(Level.SEVERE, null, ex);
        }
        return privilegio;     
    }
     
}
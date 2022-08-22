////Steven modifico este mensjade de texto
package Conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class CL_Conexion {
    Connection conn= null;
   
    
    public CL_Conexion(){
    abrirConexion();
}

    private void abrirConexion() {
        try{
            Class.forName("oracle.jdbc.OracleDriver");
            conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","HR","HR01");
             
            if(conn!=null){
                System.out.println("Conexion exitosa");
                
                
            }
           
        }catch(SQLException | ClassNotFoundException ex){
            System.out.print("Conexion fallida");
        }
    }
    public Connection obtenerConexion(){
        return conn;
    }
    public void cerrarConexion(){
        
        try {
             conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(CL_Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
       
        
  
}
}


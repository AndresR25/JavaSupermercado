
package test;

import java.beans.Statement;
import java.lang.reflect.InvocationTargetException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;


public class OracleConexion {
    
     private final String DRIVER = "oracle.jdbc.driver.OracleDriver";
     private final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
    private final String  USER = "HR";
     private final String PASSWORD = "hr01";
    
    public Connection cadena;
    
    public OracleConexion() {
    this.cadena =  null; 
    }
    
    public Connection conectar(){
    
         try{
         
         Class.forName(DRIVER);
         this.cadena = DriverManager.getConnection(URL, USER, PASSWORD);
         }catch(ClassNotFoundException | SQLException e){
             JOptionPane.showMessageDialog(null, e.getMessage());
              System.exit(0);
         
         }
          return this.cadena;
    
    }
    public void Desconectar(){
      
        try{
            this.cadena.close();
        }catch(SQLException e){
        JOptionPane.showMessageDialog(null, e.getMessage());
        }
    
    }
    
 }
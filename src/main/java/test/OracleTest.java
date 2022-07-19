
package test;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;


public class OracleTest {
    
    public static void main(String[] args) {
        
        String SQL = "";
        OracleConexion conexion = new OracleConexion();
        
        try{
            SQL = "SELECT * FROM EMPLOYEES";
            Connection con = conexion.conectar();
            java.sql.Statement cn = con.createStatement();
            ResultSet res = cn.executeQuery(SQL);
            
            while (res.next()){
             
                System.out.println("---------------------------");
                 System.out.println(res.getInt("EMPLOYEE_ID"));
                  System.out.println(res.getInt("FIRST_NAME"));
                   System.out.println(res.getInt("LAST_NAME"));
                    System.out.println(res.getInt("EMAIL"));
                     System.out.println(res.getString("PHONE_NUMBER"));
            
            }
            
        }catch(SQLException e){
        System.out.println(e);}
    }
}

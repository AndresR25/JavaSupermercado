/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package Main;

import Conexion.CL_Conexion;
import Vista.Menu;
import java.sql.Connection;
public class Test {

    public static Connection conexion =null;
    
    public static void main(String[] args) {
        try {
             CL_Conexion conn = new CL_Conexion();
             conexion=conn.obtenerConexion();
             Menu m=new Menu();
             m.setVisible(true);
                     
             
             
        }catch(Exception e){
            System.out.print("Error en la conexion");
            
        }
    }
    
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import Conexion.CL_Conexion;
import java.sql.Connection;
import javax.swing.table.DefaultTableModel;
import java.sql.CallableStatement;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import oracle.jdbc.OracleCallableStatement;

import oracle.jdbc.OracleTypes;


public class CL_DAOEmpleado {

   public static Connection conexion = null;
   
   
    public CL_DAOEmpleado() {
        if(conexion==null){
            conexion=new CL_Conexion().obtenerConexion();
        }
    }
    
    public DefaultTableModel listarEmpleados(){
        try{
            DefaultTableModel tabla=new DefaultTableModel();
            tabla.addColumn("CodigoEmpleado");
            tabla.addColumn("Nombre");
            tabla.addColumn("Apellido");
            tabla.addColumn("Salario");
            
            
            CallableStatement cstmt=conexion.prepareCall("{ ? = call LISTAREMPLEADOS}");//Llamada a la funcion me devuelve cursor
            
            cstmt.registerOutParameter(1, OracleTypes.CURSOR);//Esto es un cursor
            
            cstmt.execute();//Ejecutelo
            
            ResultSet rs = ((OracleCallableStatement)cstmt).getCursor(1);
            
            String datos[] = new String[4];
            
            while(rs.next()){
                datos[0]=String.valueOf(rs.getInt("codempleado"));
                datos[1]=rs.getString("nombreemp");
                datos[2]=rs.getString("apellido1E");
                datos[3]=String.valueOf(rs.getInt("salario"));
               
                
                tabla.addRow(datos);
            }
            return tabla;
          
        }catch(Exception ex){
            return null;
        }
    }
    
   
    
}

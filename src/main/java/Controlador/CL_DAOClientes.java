/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import Conexion.CL_Conexion;
import static Controlador.CL_DAOEmpleado.conexion;
import java.sql.Connection;
import javax.swing.table.DefaultTableModel;
import java.sql.CallableStatement;

import java.sql.*;
import oracle.jdbc.OracleCallableStatement;

import oracle.jdbc.OracleTypes;
public class CL_DAOClientes {
     public static Connection conexion = null;

    public CL_DAOClientes() {
        if(conexion==null){
            conexion=new CL_Conexion().obtenerConexion();
        }
    }
    
    public DefaultTableModel listarClientes(){
        try{
            DefaultTableModel tabla=new DefaultTableModel();
            tabla.addColumn("CodigoCliente");
            tabla.addColumn("Nombre");
            tabla.addColumn("Apellido");
            tabla.addColumn("Telefono");
            
            
            CallableStatement cstmt=conexion.prepareCall("{ ? = call LISTARCLIENTES}");//Llamada a la funcion me devuelve cursor
            
            cstmt.registerOutParameter(1, OracleTypes.CURSOR);//Esto es un cursor
            
            cstmt.execute();//Ejecutelo
            
            ResultSet rs = ((OracleCallableStatement)cstmt).getCursor(1);
            
            String datos[] = new String[4];
            
            while(rs.next()){
                datos[0]=String.valueOf(rs.getInt("codcliente"));
                datos[1]=rs.getString("nombre");
                datos[2]=rs.getString("apellido1");
                datos[3]=String.valueOf(rs.getInt("telefono1"));
               
                
                tabla.addRow(datos);
            }
            return tabla;
          
        }catch(Exception ex){
            return null;
        }
    }
    
    
     
    
}

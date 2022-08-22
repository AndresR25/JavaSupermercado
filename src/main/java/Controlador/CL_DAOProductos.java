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
import oracle.jdbc.OracleCallableStatement;

import oracle.jdbc.OracleTypes;
public class CL_DAOProductos {
    public static Connection conexion = null;
   
   
    public CL_DAOProductos() {
        if(conexion==null){
            conexion=new CL_Conexion().obtenerConexion();
        }
    }
    
    public DefaultTableModel listarProductos(){
        try{
            DefaultTableModel tabla=new DefaultTableModel();
            tabla.addColumn("CodigoProducto");
            tabla.addColumn("Nombre");
            tabla.addColumn("Descripcion");
            
            
            CallableStatement cstmt=conexion.prepareCall("{ ? = call LISTARPRODUCTOS}");//Llamada a la funcion me devuelve cursor
            
            cstmt.registerOutParameter(1, OracleTypes.CURSOR);//Esto es un cursor
            
            cstmt.execute();//Ejecutelo
            
            ResultSet rs = ((OracleCallableStatement)cstmt).getCursor(1);
            
            String datos[] = new String[3];
            
            while(rs.next()){
                datos[0]=String.valueOf(rs.getInt("codproducto"));
                datos[1]=rs.getString("nombreproducto");
                datos[2]=rs.getString("descripcion");
               
               
                
                tabla.addRow(datos);
            }
            return tabla;
          
        }catch(Exception ex){
            return null;
        }
    }
    
}

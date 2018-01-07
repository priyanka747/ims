/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database_connection;

import java.sql.*;

/**
 *
 * @author HP
 */
public class data_conn {
    Connection conn;
    public data_conn()
    {
        
    }
   public Connection conn_data()
   {
       try
       {
        Class.forName("com.mysql.jdbc.Driver");
        conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory?zeroDateTimeBehavior=convertToNull","root","");
        
       }
       catch(Exception e)
       {
           
       }
       return conn;
   }
}

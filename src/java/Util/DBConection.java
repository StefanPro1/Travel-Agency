/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Administrator
 */
public class DBConection {
    static DBConection instance = null;
    static java.sql.Connection conn =null;
    private String putanja
            = "jdbc:mysql://localhost:3306/agencija";
    private String user = "root";
    private String password = "";

    
    private DBConection() {

        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
         Logger.getLogger(DBConection.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            conn = DriverManager.getConnection(putanja, user, password);
        } catch (SQLException ex) {
         Logger.getLogger(DBConection.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public static Connection getConn() {
        if (instance == null) {
            instance = new DBConection();
        }
        return conn;
    }

}


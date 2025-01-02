package com.Db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
    private static Connection conn;

    public static Connection getConn() {
        try {
            if (conn == null) {
                // Load the MySQL JDBC Driver
                Class.forName("com.mysql.cj.jdbc.Driver"); // Use the updated driver class name

                // Establish the connection
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3305/enotes", "root", "hARINI@2304");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}

package com.db;

import java.sql.Connection;
import java.sql.DriverManager;


public class DBConnect {
    private static Connection connection;
    public static Connection getConnection() {
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://mysql-ikirtesh.a.aivencloud.com:19724/ebook?user=avnadmin&password=AVNS_1xamcjeo-3Zqhm8XWXL");
            return connection;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }
}
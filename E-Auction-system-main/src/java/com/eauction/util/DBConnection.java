package com.eauction.util;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBConnection {

    private static String url = "jdbc:oracle:thin:@//localhost:1521/XE";
    private static String user = "AUCTION_APP";
    private static String password = "auction123";

    static {
        loadConfig();
    }

    private static void loadConfig() {
        try (InputStream is = DBConnection.class.getClassLoader().getResourceAsStream("config/db.properties")) {
            if (is != null) {
                Properties props = new Properties();
                props.load(is);
                String u = props.getProperty("db.url");
                String us = props.getProperty("db.username");
                String pw = props.getProperty("db.password");
                if (u != null && !u.trim().isEmpty()) {
                    url = u.trim();
                }
                if (us != null && !us.trim().isEmpty()) {
                    user = us.trim();
                }
                if (pw != null && !pw.trim().isEmpty()) {
                    password = pw.trim();
                }
            }
        } catch (Exception e) {
            // Keep default values if file is absent
        }
    }

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("oracle.jdbc.OracleDriver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("Oracle JDBC Driver not found", e);
        }

        return DriverManager.getConnection(url, user, password);
    }
}

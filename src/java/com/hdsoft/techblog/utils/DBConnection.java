
package com.hdsoft.techblog.utils;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;


public class DBConnection {

    private static String driverClassName;
    private static String url;
    private static String username;
    private static String password;

    private static Connection con = null;

    private static void load() throws IOException, SQLException, ClassNotFoundException {
        Properties prop = new Properties();
        prop.load(DBConnection.class.getResourceAsStream("/com/hdsoft/techblog/resources/config.properties"));

        driverClassName = prop.getProperty("jdbc.db.class.name");
        url = prop.getProperty("jdbc.db.url");
        username = prop.getProperty("jdbc.db.username");
        password = prop.getProperty("jdbc.db.password");

        initConnection();
    }

    private static void initConnection() throws SQLException, ClassNotFoundException {
        Class.forName(driverClassName);
        if (con == null) {
            con = DriverManager.getConnection(url, username, password);
        }
    }

    public static Connection getConnection() {
        try {
            load();
        } catch (IOException | SQLException | ClassNotFoundException ex) {
            con=null;
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }

        return con;
    }
}

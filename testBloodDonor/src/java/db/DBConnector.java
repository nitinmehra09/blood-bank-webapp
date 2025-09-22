//package db;
//
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.SQLException;
//
//public class DBConnector {
//
//    private static Connection con = null;
//
//    public static Connection getConnection() {
//        if (con != null) return con;
//
//        try {
//            Class.forName("com.mysql.cj.jdbc.Driver");
//
//            String url = "jdbc:mysql://localhost:3306/blood_donation";
//            String user = "root";
//            String password = "1909";
//
//            con = DriverManager.getConnection(url, user, password);
//            System.out.println("Database connected successfully");
//
//        } catch (ClassNotFoundException e) {
//            System.out.println("MySQL Driver not found");
//        } catch (SQLException e) {
//            System.out.println("Failed to connect to database");
//        }
//
//        return con;
//    }
//}
package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnector {

    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            String url = "jdbc:mysql://localhost:3306/blood_donation";
            String user = "root";
            String password = "1909";

            con = DriverManager.getConnection(url, user, password);
            System.out.println("Database connected successfully");

        } catch (ClassNotFoundException e) {
            System.out.println("MySQL Driver not found");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Failed to connect to database");
        }

        return con;
    }
}

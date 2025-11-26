package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
private static final String jdbcURL = "jdbc:mysql://localhost:3306/myDB_TransportSys";
private static final String jdbcUsername = "root";
private static final String jdbcPassword = ""; // Change if root password is set

static {
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        System.out.println("✅ MySQL JDBC Driver loaded.");
    } catch (ClassNotFoundException e) {
        System.err.println("❌ MySQL JDBC Driver not found.");
        e.printStackTrace();
    }
}

public static Connection getConnection() throws SQLException {
    return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
}
}
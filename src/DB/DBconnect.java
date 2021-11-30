package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DBconnect {
    private Connection conn = null;
    private static DBconnect instance = new DBconnect();

    public DBconnect() {
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            System.out.println("Success drive load");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try {
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bakery_shop",
                    "root", "gks253");
            System.out.println("Success DB connection");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static DBconnect getInstance() {
        return instance;
    }

    public Connection getConn() {
        return conn;
    }

}

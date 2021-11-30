package dao;

import DB.DBconnect;
import dto.User;
import java.sql.*;

public class UserDao {
    private DBconnect db;
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public UserDao() {
        db = db.getInstance();
        conn = db.getConn();
    }

    public int isExisted (String id) {
        int result = 0;
        String query = "SELECT COUNT(*) FROM user WHERE id = ?";
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                result = rs.getInt(1);
            }
            pstmt.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return result;
    }

    public int insertUser(String id, String password) {
        int result = 0;
        String query = "INSERT INTO user VALUES(?, ?)";
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, id);
            pstmt.setString(2, password);
            result = pstmt.executeUpdate();
            pstmt.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return result;
    }

    public String getPassword (String id) {
        String result = null;
        String query = "SELECT password FROM user WHERE id = ?";
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                result = rs.getString(1);
            }
            pstmt.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return result;
    }
}

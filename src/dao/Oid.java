package dao;

import DB.DBconnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Oid {
    private DBconnect db;
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public Oid() {
        db = db.getInstance();
        conn = db.getConn();
    }

    public int getNextOid () {
        int result = 0;
        String query = "SELECT * FROM oid";
        try {
            pstmt = conn.prepareStatement(query);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                result = rs.getInt(1);
            }
            result += 1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        query = "UPDATE oid SET oid = ?";
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, result);
            pstmt.executeUpdate();
            pstmt.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return result;
    }
}

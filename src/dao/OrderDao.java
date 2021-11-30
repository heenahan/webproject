package dao;

import DB.DBconnect;
import dto.Order;

import java.sql.*;
import java.util.ArrayList;
import java.util.Vector;

public class OrderDao {
    private DBconnect db;
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public OrderDao() {
        db = DBconnect.getInstance();
        conn = db.getConn();
    }

    public int insertOrder(String id, Date order_date, Time order_time, Date pickup_date, Time pickup_time) {
        int result = 0;
        String query = "INSERT INTO orders VALUES(?, ?, ?, ?, ?)";
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, id);
            pstmt.setDate(2, order_date);
            pstmt.setTime(3, order_time);
            pstmt.setDate(4, pickup_date);
            pstmt.setTime(5, pickup_time);
            result = pstmt.executeUpdate();
            pstmt.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return result;
    }

    public ArrayList<Order> getAllorder() {
        ArrayList<Order> result = new ArrayList<>();
        String query = "SELECT * FROM orders ORDER BY pickup_date ASC, pickup_time ASC";
        try {
            pstmt = conn.prepareStatement(query);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Order order = new Order(rs.getString(1), rs.getDate(2), rs.getTime(3),
                        rs.getDate(4), rs.getTime(5));
                result.add(order);
            }
            pstmt.close();
        } catch(SQLException throwables){
            throwables.printStackTrace();
        }
        return result;
    }

    public Vector getPickup(String user, Date orderDate, Time orderTime) {
        Vector vec = new Vector();
        String query = "SELECT pickup_date, pickup_time FROM orders WHERE id = ? and order_date = ? and order_time = ?";
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, user);
            pstmt.setDate(2, orderDate);
            pstmt.setTime(3, orderTime);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                vec.add(rs.getDate(1));
                vec.add(rs.getTime(2));
            }
            pstmt.close();
        } catch(SQLException throwables){
            throwables.printStackTrace();
        }
        return vec;
    }
}

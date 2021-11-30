package dao;

import DB.DBconnect;
import dto.Cart;
import dto.Item;

import java.sql.*;
import java.util.ArrayList;

public class CartDao {
    private DBconnect db;
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
    private ItemDao itemDao;

    public CartDao() {
        db = db.getInstance();
        conn = db.getConn();
        itemDao = new ItemDao();
    }

    public int insertCart(String id, int item) {
        int result = 0;
        String query = "INSERT INTO cart VALUES (?, ?, null, null)";
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, id);
            pstmt.setInt(2, item);
            result = pstmt.executeUpdate();
            pstmt.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return result;
    }

    public int deleteCart(String id, int item) {
        int result = 0;
        String query = "DELETE FROM cart WHERE id = ? and item = ?";
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, id);
            pstmt.setInt(2, item);
            result = pstmt.executeUpdate();
            pstmt.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return result;
    }

    public int updateCart(String id, Date date, Time time) {
        int result = 0;
        String query = "UPDATE cart SET date = ?, time = ? WHERE id = ? and date is null and time is null";
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setDate(1, date);
            pstmt.setTime(2, time);
            pstmt.setString(3, id);
            result = pstmt.executeUpdate();
            pstmt.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return result;
    }

    public int numberOfcart(String id) {
        int result = 0;
        String query = "SELECT COUNT(*) FROM cart WHERE id = ? and date is null and time is null";
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
    //해당 아이디의 현재 카트에 담긴 아이템 목록 가져옴
    public ArrayList<Item> getCartList(String id) {
        ArrayList<Item> result = new ArrayList<>();
        String query = "SELECT * FROM cart WHERE id = ? and date is null and time is null";
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Item item = itemDao.getItem(rs.getInt(2));
                result.add(item);
            }
            pstmt.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return result;
    }
    //해당 아이디가 특정 날짜에 주문한 아이템 리스트 불러옴
    public ArrayList<Item> getCartAllList(String id, Date date, Time time) {
        ArrayList<Item> result = new ArrayList<>();
        String query = "SELECT item FROM cart WHERE id = ? and date = ? and time = ?";
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, id);
            pstmt.setDate(2, date);
            pstmt.setTime(3, time);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Item item = itemDao.getItem(rs.getInt(1));
                result.add(item);
            }
            pstmt.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return result;
    }
}

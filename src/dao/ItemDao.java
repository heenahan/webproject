package dao;

import dto.Item;
import DB.DBconnect;
import java.sql.*;
import java.util.ArrayList;

public class ItemDao {
    private DBconnect db;
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public ItemDao() {
        db = DBconnect.getInstance();
        conn = db.getConn();
    }

    public int insertItem(Integer oid, String name, String image, Integer originalPrice, Integer eventPrice,
                          String description, String category, String eventTag) {
        int result = 0;
        String query = "INSERT INTO item VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, oid);
            pstmt.setString(2, name);
            pstmt.setString(3, image);
            pstmt.setInt(4, originalPrice);
            if (eventPrice == null) {
                pstmt.setNull(5, Types.INTEGER);
            } else {
                pstmt.setInt(5, eventPrice);
            }
            pstmt.setString(6, description);
            pstmt.setString(7, category);
            if (eventTag.isEmpty()) {
                pstmt.setNull(8, Types.VARCHAR);
            } else {
                pstmt.setString(8, eventTag);
            }

            result = pstmt.executeUpdate();
            pstmt.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return result;
    }

    public ArrayList<Item> getEventItem() {
        ArrayList<Item> result = new ArrayList<>();
        String query = "SELECT * FROM item WHERE event_tag = 'christmas'";
        try {
            pstmt = conn.prepareStatement(query);
            System.out.println(pstmt);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Item item = new Item(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getInt(4), rs.getInt(5), rs.getString(6), rs.getString(7),
                        rs.getString(8));
                result.add(item);
            }
            pstmt.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return result;
    }

    public ArrayList<Item> getCategoryItem(String category) {
        ArrayList<Item> result = new ArrayList<>();
        String query = "SELECT * FROM item WHERE category = ? and event_tag = 'christmas'";
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, category);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Item item = new Item(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getInt(4), rs.getInt(5), rs.getString(6), rs.getString(7),
                        rs.getString(8));
                result.add(item);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        query = "SELECT * FROM item WHERE category = ? and event_tag is null";
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, category);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Item item = new Item(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getInt(4), rs.getInt(5), rs.getString(6), rs.getString(7),
                        rs.getString(8));
                result.add(item);
            }
            pstmt.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return result;
    }

    public Item getItem(int oid) {
        Item result = null;
        String query = "SELECT * FROM item WHERE oid = ?";
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, oid);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                result = new Item(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getInt(4), rs.getInt(5), rs.getString(6), rs.getString(7),
                        rs.getString(8));
            }
            pstmt.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return result;
    }

}

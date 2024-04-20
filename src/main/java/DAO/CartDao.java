package DAO;

import com.db.DBConnect;
import entity.Cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartDao {
    private Connection connection;

    public CartDao() {
    }

    public CartDao(Connection connection) {
        this.connection = DBConnect.getConnection();
    }

    public boolean addCart(Cart cart) {
        boolean status = false;

        try {
            String query = "INSERT INTO cart (bookId, userId, bookName, bookAuthor, quantity, bookPrice, totalAmount, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            connection = DBConnect.getConnection();

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, cart.getBookId());
            ps.setInt(2, cart.getUserId());
            ps.setString(3, cart.getBookName());
            ps.setString(4, cart.getBookAuthor());
            ps.setInt(5, cart.getQuantity());
            ps.setDouble(6, cart.getBookPrice());
            ps.setDouble(7, cart.getTotalAmount());
            ps.setString(8, cart.getStatus());


            int i = ps.executeUpdate();

            if (i == 1) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }


    public int countCart(int userId) {
        int count = 0;
        ResultSet rs = null;
        PreparedStatement ps = null;
        try {
            String query = "SELECT COUNT(*) AS orderCount FROM cart WHERE userId = ?";
            connection = DBConnect.getConnection();

            ps = connection.prepareStatement(query);
            ps.setInt(1, userId);
            rs = ps.executeQuery();

            if (rs.next()) {
                count = rs.getInt("orderCount");
            }

            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // close resources (connection, statement, etc.) in the 'finally' block
            // to ensure they are closed even if an exception is thrown
            closeResources(rs, ps, connection);
        }

        return count;
    }

    private void closeResources(ResultSet rs, PreparedStatement ps, Connection connection) {
        try {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public boolean deleteCart(int cartId) {
        boolean f = false;
        
        try{
            String query = "DELETE FROM cart WHERE cartId = ?";
            PreparedStatement ps = this.connection.prepareStatement(query);
            ps.setInt(1, cartId);
            int i = ps.executeUpdate();
            if(i == 1){
                f = true;
            }
        } catch (Exception e){
            e.printStackTrace();
        }

        return f;
    }

    public List<Cart> getAllCart(int userId) {
        List<Cart> cartList = new ArrayList<>();
        String query = "SELECT * FROM cart WHERE userId = ? AND status = 'In Cart'";

        try {
             PreparedStatement ps = this.connection.prepareStatement(query);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int cartId = rs.getInt("cartId");
                int bookId = rs.getInt("bookId");
                String bookName = rs.getString("bookName");
                String bookAuthor = rs.getString("bookAuthor");
                int quantity = rs.getInt("quantity");
                double bookPrice = rs.getDouble("bookPrice");
                double totalAmount = rs.getDouble("totalAmount");
                String status = rs.getString("status");

                Cart cart = new Cart(cartId, userId, bookId, bookName, bookAuthor, quantity, bookPrice, totalAmount, status);
                cartList.add(cart);
            }


            
        } catch (Exception e) {
            e.printStackTrace();
        }

        return cartList;
    }

    // total price of cart items
    public double cartTotalPrice(int userId){
        double totalPrice = 0.0;
        String query = "SELECT SUM(totalAmount) AS totalPrice FROM cart WHERE userId = ? AND status = 'In Cart'";

        try {
            PreparedStatement ps = this.connection.prepareStatement(query);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                totalPrice = rs.getDouble("totalPrice");
            }
            
        } catch (Exception e){
            e.printStackTrace();
        }
        return totalPrice;
    }
    
    // total number of cart items
    public int totalCart(int userId){
        int totalItems = 0;
        String query = "SELECT count(*) AS totalItems FROM cart WHERE userId = ? AND status = 'In Cart'";

        try {
            PreparedStatement ps = this.connection.prepareStatement(query);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                totalItems = rs.getInt("totalItems");
            }
            
        } catch (Exception e){
            e.printStackTrace();
        }
        
        return totalItems;
    }


    // update cart quantity
    public List<Cart> getBuyNowItems(int userId) {
        List<Cart> cartList = new ArrayList<>();
        String query = "SELECT * FROM cart WHERE userId = ? AND status = 'Buy Now'";

        try {
            PreparedStatement ps = this.connection.prepareStatement(query);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int cartId = rs.getInt("cartId");
                int bookId = rs.getInt("bookId");
                String bookName = rs.getString("bookName");
                String bookAuthor = rs.getString("bookAuthor");
                int quantity = rs.getInt("quantity");
                double bookPrice = rs.getDouble("bookPrice");
                double totalAmount = rs.getDouble("totalAmount");
                String status = rs.getString("status");

                Cart cart = new Cart(cartId, userId, bookId, bookName, bookAuthor, quantity, bookPrice, totalAmount, status);
                cartList.add(cart);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        return cartList;
    }

    // total price of buy now items
    public double buyNowTotalPrice(int userId) {
        double totalPrice = 0.0;

        String query = "SELECT SUM(totalAmount) AS totalPrice FROM cart WHERE userId = ? AND status = 'Buy Now'";

        try {
            PreparedStatement ps = this.connection.prepareStatement(query);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            if(rs.next()){
                totalPrice = rs.getDouble("totalPrice");
            }

        } catch (Exception e){
            e.printStackTrace();
        }

        return totalPrice;
    }


    // total number of buy now items
    public Object totalBuy(int userId) {
        int totalItems = 0;
        String query = "SELECT count(*) AS totalItems FROM cart WHERE userId = ? AND status = 'Buy Now'";

        try {
            PreparedStatement ps = this.connection.prepareStatement(query);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            if(rs.next()){
                totalItems = rs.getInt("totalItems");
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return totalItems;
    }
}

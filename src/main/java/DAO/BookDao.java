

package DAO;

import com.db.DBConnect;
import entity.Book;
import entity.Cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookDao {
    private Connection connection;

    public BookDao() {
    }

    public BookDao(Connection connection) {
        this.connection = DBConnect.getConnection();
    }

    public boolean addBook(Book book) {
        boolean f = false;

        try {
            String query = "insert into books (title, author, description, category, bookStatus, price, bookImage) values (?,?,?,?,?,?,?)";
            PreparedStatement ps = this.connection.prepareStatement(query);
            ps.setString(1, book.getTitle());
            ps.setString(2, book.getAuthor());
            ps.setString(3, book.getDescription());
            ps.setString(4, book.getCategory());
            ps.setString(5, book.getBookStatus());
            ps.setDouble(6, book.getPrice());
            ps.setString(7, book.getBookImage());


            ps.executeUpdate();

            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }


    public List<Book> getAllBooks() {
        List<Book> bookList = new ArrayList<>();

        try (PreparedStatement preparedStatement = connection.prepareStatement("select * from books");
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                Book book = new Book();
                book.setBookId(resultSet.getInt("bookId"));
                book.setTitle(resultSet.getString("title"));
                book.setAuthor(resultSet.getString("author"));
                book.setDescription(resultSet.getString("description"));
                book.setCategory(resultSet.getString("category"));
                book.setBookStatus(resultSet.getString("bookStatus"));
                book.setPrice(resultSet.getInt("price"));
                book.setBookImage(resultSet.getString("bookImage"));
                bookList.add(book);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return bookList;
    }


    // Delete Book
    public boolean deleteBook(int bookId) {
        boolean f = false;
        try {
            String query = "delete from books where bookId=?";
            PreparedStatement ps = this.connection.prepareStatement(query);
            ps.setInt(1, bookId);
            ps.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    // Update Book
    public boolean updateBook(Book book) {
        boolean f = false;
        try {
            String query = "update books set title=?, author=?, description=?, category=?, bookStatus=?, price=?, bookImage=? where bookId=?";
            PreparedStatement ps = this.connection.prepareStatement(query);
            ps.setString(1, book.getTitle());
            ps.setString(2, book.getAuthor());
            ps.setString(3, book.getDescription());
            ps.setString(4, book.getCategory());
            ps.setString(5, book.getBookStatus());
            ps.setDouble(6, book.getPrice());
            ps.setString(7, book.getBookImage());
            ps.setInt(8, book.getBookId());
            ps.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public Book getBookById(int bookId) {
        Book book = null;
        try {
            String query = "select * from books where bookId=?";
            PreparedStatement ps = this.connection.prepareStatement(query);
            ps.setInt(1, bookId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                book = new Book();
                book.setBookId(rs.getInt("bookId"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setDescription(rs.getString("description"));
                book.setCategory(rs.getString("category"));
                book.setBookStatus(rs.getString("bookStatus"));
                book.setPrice(rs.getInt("price"));
                book.setBookImage(rs.getString("bookImage"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return book;
    }


    // Count Books
    public int countBooks() {
        int count = 0;
        try {
            String query = "select count(*) from books";
            PreparedStatement ps = this.connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }


    public Book getBookByTitle(String bookTitle) {
        Book book = null;
        try {
            String query = "select * from books where title=?";
            PreparedStatement ps = this.connection.prepareStatement(query);
            ps.setString(1, bookTitle);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                book = new Book();
                book.setBookId(rs.getInt("bookId"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setDescription(rs.getString("description"));
                book.setCategory(rs.getString("category"));
                book.setBookStatus(rs.getString("bookStatus"));
                book.setPrice(rs.getInt("price"));
                book.setBookImage(rs.getString("bookImage"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return book;
    }

    public List<Book> getOldBooks() {
        List<Book> bookList = new ArrayList<>();

        try {
            // Pick up Old books from the database with category 'Old'
            String query = "SELECT * FROM books WHERE category = 'Old'";
            PreparedStatement ps = this.connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Book book = new Book();
                book.setBookId(rs.getInt("bookId"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setDescription(rs.getString("description"));
                book.setCategory(rs.getString("category"));
                book.setBookStatus(rs.getString("bookStatus"));
                book.setPrice(rs.getInt("price"));
                book.setBookImage(rs.getString("bookImage"));
                bookList.add(book);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return bookList;
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

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return status;
    }

}
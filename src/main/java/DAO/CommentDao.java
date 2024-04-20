package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.Comment;

public class CommentDao {
    private Connection connection;

    public CommentDao(Connection connection) {
        this.connection = connection;
    }

    // Method to get comments for a specific book
    public List<Comment> getCommentsByBookId(int bookId) {
        List<Comment> comments = new ArrayList<>();
        String sql = "SELECT * FROM comments WHERE bookId = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, bookId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Comment comment = new Comment();
                comment.setCommentId(resultSet.getInt("commentId"));
                comment.setUserId(resultSet.getInt("userId"));
                comment.setBookId(resultSet.getInt("bookId"));
                comment.setCommentText(resultSet.getString("commentText"));
                comment.setRating(resultSet.getInt("rating"));
                comment.setTimestamp(resultSet.getTimestamp("timestamp"));

                comments.add(comment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return comments;
    }


    // add comment

    public boolean addComment(int userId, int bookId, Comment comment) {
        String sql = "INSERT INTO comments (userId, bookId, commentText, rating, timestamp) VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, userId);
            preparedStatement.setInt(2, bookId);
            preparedStatement.setString(3, comment.getCommentText());
            preparedStatement.setInt(4, comment.getRating());
            preparedStatement.setTimestamp(5, comment.getTimestamp());

            int rows = preparedStatement.executeUpdate();

            if (rows > 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception properly in a real application
        }

        return false;
    }


    // delete comment

    public boolean deleteComment(int commentId) {
        String sql = "DELETE FROM comments WHERE commentId = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, commentId);

            int rows = preparedStatement.executeUpdate();

            if (rows > 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception properly in a real application
        }

        return false;
    }

    // update comment

    public boolean updateComment(int commentId, int bookId, Comment comment) {
        String sql = "UPDATE comments SET commentText = ?, rating = ? WHERE commentId = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, comment.getCommentText());
            preparedStatement.setInt(2, comment.getRating());
            preparedStatement.setInt(3, commentId);

            int rows = preparedStatement.executeUpdate();

            if (rows > 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception properly in a real application
        }

        return false;
    }
}

package entity;

import java.sql.Timestamp;
import java.util.Date;

public class Comment {
    private int commentId;
    private int userId;
    private int bookId;
    private String commentText;
    private int rating;
    private Timestamp timestamp;

    private User user;


    public Comment() {

    }

    public Comment(int commentId, int userId, int bookId, String commentText, int rating, Timestamp timestamp) {
        this.commentId = commentId;
        this.userId = userId;
        this.bookId = bookId;
        this.commentText = commentText;
        this.rating = rating;
        this.timestamp = timestamp;
    }

public Comment(int userId, int bookId, String commentText, int rating, Timestamp timestamp) {
        this.userId = userId;
        this.bookId = bookId;
        this.commentText = commentText;
        this.rating = rating;
        this.timestamp = timestamp;
    }

    public Comment(int userId, int bookId, String commentText, int rating) {
        this.userId = userId;
        this.bookId = bookId;
        this.commentText = commentText;
        this.rating = rating;
        this.timestamp = new Timestamp(new Date().getTime());
    }

    public Comment(int commentId, int userId, int bookId, String commentText, int rating) {
        this.commentId = commentId;
        this.userId = userId;
        this.bookId = bookId;
        this.commentText = commentText;
        this.rating = rating;
        this.timestamp = new Timestamp(new Date().getTime());
    }


    public Comment(int commentId, int userId, int bookId, String commentText) {
        this.commentId = commentId;
        this.userId = userId;
        this.bookId = bookId;
        this.commentText = commentText;
        this.timestamp = new Timestamp(new Date().getTime());
    }


    public Comment(int userId, int bookId, String commentText) {
        this.userId = userId;
        this.bookId = bookId;
        this.commentText = commentText;
        this.timestamp = new Timestamp(new Date().getTime());
    }



    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public String getCommentText() {
        return commentText;
    }

    public void setCommentText(String commentText) {
        this.commentText = commentText;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
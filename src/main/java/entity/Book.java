package entity;

public class Book {

    private int bookId;
    private String title;
    private String author;
    private String description;
    private String category;
    private String bookStatus;
    private int price;
    private String bookImage;

    public Book() {
    }

    public Book(int bookId, String title, String author, String description, String category, String bookStatus, int price, String bookImage) {
        this.bookId = bookId;
        this.title = title;
        this.author = author;
        this.description = description;
        this.category = category;
        this.bookStatus = bookStatus;
        this.price = price;
        this.bookImage = bookImage;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getBookStatus() {
        return bookStatus;
    }

    public void setBookStatus(String bookStatus) {
        this.bookStatus = bookStatus;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getBookImage() {
        return bookImage;
    }

    public void setBookImage(String bookImage) {
        this.bookImage = bookImage;
    }
}

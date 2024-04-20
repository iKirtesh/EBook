package entity;

public class Cart {

    private int cartId;
    private int userId;
    private int bookId;
    private String bookName;
    private String bookAuthor;
    private int quantity;
    private double totalAmount;
    private String status;
    private double bookPrice;

    public Cart() {
    }

    public Cart(int cartId, int userId, int bookId, String bookName, String bookAuthor, int quantity, double totalAmount, String status, double bookPrice) {
        this.cartId = cartId;
        this.userId = userId;
        this.bookId = bookId;
        this.bookName = bookName;
        this.bookAuthor = bookAuthor;
        this.quantity = quantity;
        this.totalAmount = totalAmount;
        this.status = status;
        this.bookPrice = bookPrice;
    }

    public Cart(int cartId, int userId, int bookId, String bookName, String bookAuthor, int quantity, double bookPrice, double totalAmount, String status) {
        this.cartId = cartId;
        this.userId = userId;
        this.bookId = bookId;
        this.bookName = bookName;
        this.bookAuthor = bookAuthor;
        this.quantity = quantity;
        this.totalAmount = totalAmount;
        this.status = status;
        this.bookPrice = bookPrice;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
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

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getBookAuthor() {
        return bookAuthor;
    }

    public void setBookAuthor(String bookAuthor) {
        this.bookAuthor = bookAuthor;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public double getBookPrice() {
        return bookPrice;
    }

    public void setBookPrice(double bookPrice) {
        this.bookPrice = bookPrice;
    }
}

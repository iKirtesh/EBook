package entity;

import jakarta.servlet.http.HttpServlet;

public class User extends HttpServlet {
    private int id;
    private String firstname;
    private String lastname;
    private String email;
    private String password;
    private String status;



    public User(String status) {
        this.status = status;
    }

    public User(int id, String firstname, String lastname, String email, String password) {
        this.id = id;
        this.firstname = firstname;
        this.lastname = lastname;
        this.email = email;
        this.password = password;
    }

    public User(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public User() {
        
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isDisabled() {
        return "disabled".equals(status); // Assuming 'status' is a String field
    }



    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }


    public void setDisabled(boolean disabled) {
    }

    public String getFullName() {
        // full name
        return firstname + " " + lastname;
    }


    public Object getName() {
        // full name
        return firstname + " " + lastname;
    }

    public void setName(String name) {
    }
}

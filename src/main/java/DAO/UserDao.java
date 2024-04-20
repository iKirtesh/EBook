package DAO;

import com.db.DBConnect;
import entity.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDao {
    private Connection connection;

    // Constructor using DBConnect.getConnection()
    public UserDao(Connection connection) {
        // Initialize the connection here
        this.connection = DBConnect.getConnection();
    }

    // Constructor with explicit Connection parameter
//    public UserDao(Connection connection) {
//        UserDao.connection = connection;
//    }



    public boolean addUser(User user) {
        boolean f = false;
        try {
            String query = "insert into users(firstname,lastname,email,password,status) values(?,?,?,?, 'active')";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, user.getFirstname());
            preparedStatement.setString(2, user.getLastname());
            preparedStatement.setString(3, user.getEmail());
            preparedStatement.setString(4, user.getPassword());

            preparedStatement.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    //...

    public User login(String email, String password) {
        User user = null;

        try {
            String query = "SELECT * FROM users WHERE email=? AND password=?";
            try (PreparedStatement preparedStatement = this.connection.prepareStatement(query)) {
                preparedStatement.setString(1, email);
                preparedStatement.setString(2, password);

                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    if (resultSet.next()) {
                        user = new User();
                        user.setId(resultSet.getInt("id"));
                        user.setFirstname(resultSet.getString("firstname"));
                        user.setLastname(resultSet.getString("lastname"));
                        user.setEmail(resultSet.getString("email"));
                        user.setPassword(resultSet.getString("password"));
                        user.setStatus(resultSet.getString("status"));  // Assuming "status" is the column name for user status

                    } else {
                        logNoUserFound(email, password);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public List<User> getAllUsers() {
        List<User> userList = new ArrayList<>();


        try (PreparedStatement preparedStatement = connection.prepareStatement("select * from users");
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                User user = new User();

                    user.setId(resultSet.getInt("id"));
                    user.setFirstname(resultSet.getString("firstname"));
                    user.setLastname(resultSet.getString("lastname"));
                    user.setEmail(resultSet.getString("email"));
                    user.setPassword(resultSet.getString("password"));
                    user.setStatus(resultSet.getString("status"));  // Assuming "status" is the column name for user status
                    userList.add(user);
                }
            } catch (SQLException e) {
            e.printStackTrace();
        }

        return userList;
    }


    public static List<User> getActiveUsers() {
        List<User> activeUsers = new ArrayList<>();

        try (Connection connection = DBConnect.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM users WHERE status = 'active'");
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                User user = new User();
                user.setId(resultSet.getInt("id"));
                user.setFirstname(resultSet.getString("firstname"));
                user.setLastname(resultSet.getString("lastname"));
                user.setEmail(resultSet.getString("email"));
                user.setStatus(resultSet.getString("status"));

                activeUsers.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Consider logging the exception
        }

        return activeUsers;
    }

    public static List<User> getDisableUsers() {
        List<User> activeUsers = new ArrayList<>();

        try (Connection connection = DBConnect.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM users WHERE status = 'disabled'");
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                User user = new User();
                user.setId(resultSet.getInt("id"));
                user.setFirstname(resultSet.getString("firstname"));
                user.setLastname(resultSet.getString("lastname"));
                user.setEmail(resultSet.getString("email"));
                user.setStatus(resultSet.getString("status"));

                activeUsers.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Consider logging the exception
        }

        return activeUsers;
    }


//...


    private void logUserDetails(User user) {
        // Use a logging framework instead of System.out.println
        // Example with SLF4J: logger.info("User found: {}", user);
        System.out.println("User found in the database:");
        System.out.println("ID: " + user.getId());
        System.out.println("Firstname: " + user.getFirstname());
        System.out.println("Lastname: " + user.getLastname());
        System.out.println("Email: " + user.getEmail());
        System.out.println("Password: " + user.getPassword());
    }

    private void logNoUserFound(String email, String password) {
        // Use a logging framework instead of System.out.println
        // Example with SLF4J: logger.info("No user found for email: {} and password: {}", email, password);
//        System.out.println("No user found for email: " + email + " and password: " + password);
    }




    public User getUserById(int id) {
        User user = null;

        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from users where id=?");
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                user = new User();
                user.setId(resultSet.getInt("id"));
                user.setFirstname(resultSet.getString("firstname"));
                user.setLastname(resultSet.getString("lastname"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;

    }

    public List<User> searchUsers(String keyword) {
        List<User> userList = new ArrayList<>();

        String qurey = "select * from users where firstname like '%" + keyword + "%' or lastname like '%" + keyword + "%' or email like '%" + keyword + "%'";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(qurey);
            ResultSet resultSet = preparedStatement.executeQuery();



            try (
                    preparedStatement;
                    resultSet
            ) {
                while (resultSet.next()) {
                    User user = new User();
                    user.setId(resultSet.getInt("id"));
                    user.setFirstname(resultSet.getString("firstname"));
                    user.setLastname(resultSet.getString("lastname"));
                    user.setEmail(resultSet.getString("email"));
                    user.setPassword(resultSet.getString("password"));

                    userList.add(user);
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return userList;
    }

    public boolean updateUser(User user) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE users SET firstname=?, lastname=?, email=?, status=?, password=? WHERE id=?");
            preparedStatement.setString(1, user.getFirstname());
            preparedStatement.setString(2, user.getLastname());
            preparedStatement.setString(3, user.getEmail());
            preparedStatement.setString(4, user.getStatus());
            preparedStatement.setString(5, user.getPassword());
            preparedStatement.setInt(6, user.getId());

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    // Disable a user by setting their status to "disabled"
    public boolean disableUser(int userId) {
        boolean success = false;
        String query = "UPDATE users SET status = 'disabled' WHERE id = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, userId);
            int rowsAffected = preparedStatement.executeUpdate();
            success = rowsAffected > 0;
        }
     catch (SQLException e) {
            e.printStackTrace();
        }

        return success;
    }

    public boolean activateUser(int userId) {
        boolean success = false;

            String query = "UPDATE users SET status = 'active' WHERE id = ?";

            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setInt(1, userId);
                int rowsAffected = preparedStatement.executeUpdate();
                success = rowsAffected > 0;
            }
            catch (SQLException e) {
            e.printStackTrace();
        }

        return success;

    }

    public int countUsers() {
        int count = 0;
        try {
            String query = "select count(*) from users";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query);
                 ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    count = resultSet.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }




    public boolean deleteUser(int id) {

        boolean success = false;
        try {
            String query = "delete from users where id=?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();


            success = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return success;

    }

    public void close() {
        try {
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    public boolean isEmailTaken(String email, int id) {
        boolean emailTaken = false;

        try {
            String query = "SELECT * FROM users WHERE email=? AND id!=?";
            try (PreparedStatement preparedStatement = this.connection.prepareStatement(query)) {
                preparedStatement.setString(1, email);
                preparedStatement.setInt(2, id);

                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    emailTaken = resultSet.next();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return emailTaken;
    }
}
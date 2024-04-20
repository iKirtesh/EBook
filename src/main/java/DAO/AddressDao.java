package DAO;

import entity.Address;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class AddressDao {

    private Connection connection;

    public AddressDao() {
    }

    public AddressDao(Connection connection) {
        this.connection = connection;
    }

    public boolean addAddress(Address address, int userId) {
        boolean status = false;

        try {
            String query = "INSERT INTO address (userId, address, city, state, country, zipCode, saveInfo) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, userId);
            ps.setString(2, address.getAddress());
            ps.setString(3, address.getCity());
            ps.setString(4, address.getState());
            ps.setString(5, address.getCountry());
            ps.setString(6, address.getZipCode());
            ps.setBoolean(7, address.isSaveInfo());

            int i = ps.executeUpdate();
            if (i == 1) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // delete address


}

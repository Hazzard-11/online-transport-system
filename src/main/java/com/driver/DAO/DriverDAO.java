package com.driver.DAO;

import com.driver.Model.Driver;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DriverDAO {

    private static final String INSERT_DRIVER_SQL =
        "INSERT INTO drivers (name, gender, dob, phone, address, email, vehicle_model, reg_number, vin, years_experience, vehicle_type, medical, accidents) " +
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    private static final String SELECT_DRIVER_BY_ID = 
        "SELECT * FROM drivers WHERE id = ?";
        
    private static final String SELECT_ALL_DRIVERS = 
        "SELECT * FROM drivers";

    private static final String UPDATE_DRIVER_SQL =
        "UPDATE drivers SET name = ?, gender = ?, dob = ?, phone = ?, address = ?, email = ?, vehicle_model = ?, reg_number = ?, vin = ?, years_experience = ?, vehicle_type = ?, medical = ?, accidents = ? WHERE id = ?";

    private static final String DELETE_DRIVER_SQL = 
        "DELETE FROM drivers WHERE id = ?";

    // CREATE
    public boolean saveDriver(Driver driver) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(INSERT_DRIVER_SQL)) {

            ps.setString(1, driver.getName());
            ps.setString(2, driver.getGender());
            ps.setString(3, driver.getDateOfBirth());
            ps.setString(4, driver.getPhone());
            ps.setString(5, driver.getAddress());
            ps.setString(6, driver.getEmail());
            ps.setString(7, driver.getVehicleModel());
            ps.setString(8, driver.getRegNumber());
            ps.setString(9, driver.getVin());
            ps.setInt(10, driver.getYears());
            ps.setString(11, driver.getVehicleType());
            ps.setString(12, driver.getMedical());
            ps.setString(13, driver.getAccidents());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // READ by ID
    public Driver getDriverById(int id) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_DRIVER_BY_ID)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return mapResultSetToDriver(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // READ all
    public List<Driver> getAllDrivers() {
        List<Driver> drivers = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_ALL_DRIVERS);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                drivers.add(mapResultSetToDriver(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return drivers;
    }

    // UPDATE
    public boolean updateDriver(int id, Driver driver) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(UPDATE_DRIVER_SQL)) {

            ps.setString(1, driver.getName());
            ps.setString(2, driver.getGender());
            ps.setString(3, driver.getDateOfBirth());
            ps.setString(4, driver.getPhone());
            ps.setString(5, driver.getAddress());
            ps.setString(6, driver.getEmail());
            ps.setString(7, driver.getVehicleModel());
            ps.setString(8, driver.getRegNumber());
            ps.setString(9, driver.getVin());
            ps.setInt(10, driver.getYears());
            ps.setString(11, driver.getVehicleType());
            ps.setString(12, driver.getMedical());
            ps.setString(13, driver.getAccidents());
            ps.setInt(14, id);

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // DELETE
    public boolean deleteDriver(int id) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(DELETE_DRIVER_SQL)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // Utility method to map ResultSet to Driver object
    private Driver mapResultSetToDriver(ResultSet rs) throws SQLException {
        Driver driver = new Driver();
        driver.setId(rs.getInt("id"));
        driver.setName(rs.getString("name"));
        driver.setGender(rs.getString("gender"));
        driver.setDateOfBirth(rs.getString("dob"));
        driver.setPhone(rs.getString("phone"));
        driver.setAddress(rs.getString("address"));
        driver.setEmail(rs.getString("email"));
        driver.setVehicleModel(rs.getString("vehicle_model"));
        driver.setRegNumber(rs.getString("reg_number"));
        driver.setVin(rs.getString("vin"));
        driver.setYears(rs.getInt("years_experience"));
        driver.setVehicleType(rs.getString("vehicle_type"));
        driver.setMedical(rs.getString("medical"));
        driver.setAccidents(rs.getString("accidents"));
        return driver;
    }
}

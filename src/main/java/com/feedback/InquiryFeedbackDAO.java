package com.feedback;

import java.sql.*;
import java.util.*;

public class InquiryFeedbackDAO {
    private final String jdbcURL = "jdbc:mysql://localhost:3306/myDB_TransportSys";
    private final String jdbcUsername = "root";
    private final String jdbcPassword = "";
    
    // Static block to load MySQL driver
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.err.println("MySQL JDBC Driver not found.");
            e.printStackTrace();
        }
    }

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public void insertInquiry(InquiryFeedback feedback) throws SQLException {
        String sql = "INSERT INTO inquiry_feedback (sender_name, sender_email, sender_role, message) VALUES (?, ?, ?, ?)";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, feedback.getSenderName());
            stmt.setString(2, feedback.getSenderEmail());
            stmt.setString(3, feedback.getSenderRole());
            stmt.setString(4, feedback.getMessage());
            stmt.executeUpdate();
        }
    }

    public List<InquiryFeedback> getAllFeedback() throws SQLException {
        List<InquiryFeedback> list = new ArrayList<>();
        String sql = "SELECT * FROM inquiry_feedback ORDER BY date_submitted DESC";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                InquiryFeedback fb = new InquiryFeedback(
                    rs.getInt("id"),
                    rs.getString("sender_name"),
                    rs.getString("sender_email"),
                    rs.getString("sender_role"),
                    rs.getString("message"),
                    rs.getTimestamp("date_submitted"),
                    rs.getString("status"),
                    rs.getString("remark"),
                    rs.getTimestamp("remark_date")
                );
                list.add(fb);
            }
        }
        return list;
    }

    public InquiryFeedback getById(int id) throws SQLException {
        String sql = "SELECT * FROM inquiry_feedback WHERE id=?";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new InquiryFeedback(
                        rs.getInt("id"),
                        rs.getString("sender_name"),
                        rs.getString("sender_email"),
                        rs.getString("sender_role"),
                        rs.getString("message"),
                        rs.getTimestamp("date_submitted"),
                        rs.getString("status"),
                        rs.getString("remark"),
                        rs.getTimestamp("remark_date")
                    );
                }
            }
        }
        return null;
    }

    public boolean updateRemark(int id, String remark) throws SQLException {
        String sql = "UPDATE inquiry_feedback SET remark=?, remark_date=NOW(), status='Resolved' WHERE id=?";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, remark);
            stmt.setInt(2, id);
            return stmt.executeUpdate() > 0;
        }
    }

    public boolean deleteEntry(int id) throws SQLException {
        String sql = "DELETE FROM inquiry_feedback WHERE id=?";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        }
    }
}

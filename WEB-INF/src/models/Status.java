package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.TreeSet;

import com.sun.source.tree.Tree;

import utils.DBConnect;

public class Status {
    private Integer statusId;
    private String status;

    // ########################################## Constructor
    // #########################################################

    public Status(Integer statusId) {
        this.statusId = statusId;
    }

    public Status(String status) {
        this.status = status;
    }

    public Status(Integer statusId, String status) {
        this.statusId = statusId;
        this.status = status;
    }

    public Status() {

    }

    // ########################################## Methods#########################################################

    public TreeSet collectAllStatus() {
        TreeSet<Status> status = new TreeSet<>();
        try (Connection con = DBConnect.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM status");
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                status.add(new Status(rs.getInt("status_id"), rs.getString("status")));
            }
        } catch (SQLException e) {
            System.err.println("SQLException in collectAllStatus: " + e.getMessage());
            e.printStackTrace();
        }
        System.out.println("################### Status loaded: " + status.size() + " ###########################");
        return status;
    }

    @Override
    public String toString() {
        return "Status [statusId=" + statusId + ", status=" + status + "]";
    }

    public Integer getStatusId() {
        return statusId;
    }

    public void setStatusId(Integer statusId) {
        this.statusId = statusId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}

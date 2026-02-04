
package models;

import java.util.TreeSet;
import utils.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Qualification implements Comparable<Qualification> {
    private Integer qualificationId;
    private String name;

    public Qualification() {
    }

    public Qualification(String name) {
        this.name = name;
    }

    public Qualification(Integer qualificationId, String name) {
        this.qualificationId = qualificationId;
        this.name = name;
    }

    public TreeSet<Qualification> collectAllQualifications() {
        TreeSet<Qualification> qualifications = new TreeSet<>();
        try (Connection con = DBConnect.getConnection();
                PreparedStatement ps = con
                        .prepareStatement("SELECT qualification_id, qualification AS name FROM qualifications");
                ResultSet rs = ps.executeQuery())

        {
            while (rs.next()) {
                qualifications.add(new Qualification(rs.getInt("qualification_id"), rs.getString("name")));
            }
        } catch (SQLException e) {
            System.out.println("SQLException in collectAllQualifications: " + e.getMessage());
            e.printStackTrace();
        }
        System.out.println(
                "################### Qualifications loaded: " + qualifications.size() + " ###########################");
        return qualifications;
    }

    @Override
    public int compareTo(Qualification other) {
        return this.name != null && other.name != null ? this.name.compareTo(other.name) : 0;
    }

    @Override
    public String toString() {
        return "Qualification[qualificationId=" + qualificationId + ", name=" + name + "]";
    }

    // Getters and Setters
    public Integer getQualificationId() {
        return qualificationId;
    }

    public void setQualificationId(Integer qualificationId) {
        this.qualificationId = qualificationId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
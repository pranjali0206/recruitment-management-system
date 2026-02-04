package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.TreeSet;
import utils.DBConnect;

public class Skill implements Comparable<Skill> {
    private Integer skillId;
    private String name;

    public Skill() {
    }

    public Skill(String name) {
        this.name = name;
    }

    public Skill(Integer skillId, String name) {
        this.skillId = skillId;
        this.name = name;
    }

    public TreeSet<Skill> collectAllSkills() {
        TreeSet<Skill> skills = new TreeSet<>();
        try (Connection con = DBConnect.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT skill_id, skill AS name FROM skills");
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                skills.add(new Skill(rs.getInt("skill_id"), rs.getString("name")));
            }
        } catch (SQLException e) {
            System.err.println("SQLException in collectAllSkills: " + e.getMessage());
            e.printStackTrace();
        }
        System.out.println("################### Skills loaded: " + skills.size() + " ###########################");
        return skills;
    }

    @Override
    public int compareTo(Skill other) {
        return this.name != null && other.name != null ? this.name.compareTo(other.name) : 0;
    }

    @Override
    public String toString() {
        return "Skill[skillId=" + skillId + ", name=" + name + "]";
    }

    // Getters and Setters
    public Integer getSkillId() {
        return skillId;
    }

    public void setSkillId(Integer skillId) {
        this.skillId = skillId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
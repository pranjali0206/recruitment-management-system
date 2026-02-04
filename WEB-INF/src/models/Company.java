package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

import org.jasypt.util.password.StrongPasswordEncryptor;

import utils.DBConnect;

public class Company {

    private Integer companyId;
    private String name;
    private String email;
    private String password;
    private String contact;
    private String website;
    private String address;
    private String profilePic;
    private String banner;
    private Integer establishedOn;
    private String description;
    private String mission;
    private String vision;

    // ########################################## Constructor #########################################################
    public Company() {
    }

    public Company(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public Company(Integer companyId) {
        this.companyId = companyId;
    }

    public Company(String name, String email, String password, String contact, String address) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.contact = contact;
        this.address = address;
    }

    StrongPasswordEncryptor spe = new StrongPasswordEncryptor();

    // ########################################## Methods #########################################################


    // ############################ CompanyNameByID#####################################

    public String getCompanyNameById(Integer companyId) {
        String companyName = null;
        try (Connection con = DBConnect.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT name FROM companies WHERE company_id = ?")) {
            ps.setInt(1, companyId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    companyName = rs.getString("name");
                    System.out.println("Fetched company name: " + companyName + " for companyId: " + companyId);
                } else {
                    System.out.println("No company found for companyId: " + companyId);
                }
            }
        } catch (SQLException e) {
            System.err.println("SQLException in getCompanyNameById for companyId " + companyId + ": " + e.getMessage());
            e.printStackTrace();
        }
        return companyName;
    }
        
    

    // ########################################## Login Methods #########################################################
    public boolean login() {
        boolean flag = false;
        try (Connection con = DBConnect.getConnection();
             PreparedStatement ps = con.prepareStatement("select * from companies where email=?")) {
            System.out.println("################### Login query selected ###########################");
            System.out.println("################### Email being queried: " + email + " ###########################");

            ps.setString(1, email.trim());
            try (ResultSet rs = ps.executeQuery()) {
                System.out.println("################### Login query executed ###########################");

                if (rs.next()) {
                    System.out.println("################### Record found for email: " + email + " ###########################");

                    if (spe.checkPassword(password, rs.getString("password"))) {
                        // Populate the Company object with data from the database
                        this.companyId = rs.getInt("company_id");
                        this.name = rs.getString("name");
                        this.email = rs.getString("email");
                        this.contact = rs.getString("contact");
                        this.address = rs.getString("address");
                        this.website = rs.getString("website");
                        this.profilePic = rs.getString("profile_pic");
                        this.banner = rs.getString("banner");
                        this.establishedOn = rs.getInt("established_on");
                        this.description = rs.getString("description");
                        this.mission = rs.getString("mission");
                        this.vision = rs.getString("vision");

                        flag = true;
                    } else {
                        System.out.println("################### Password mismatch ###########################");
                    }
                } else {
                    System.out.println("################### No record found for email: " + email + " ###########################");
                }
            }
        } catch (SQLException e) {
            System.err.println("SQLException occurred: " + e.getMessage());
            e.printStackTrace();
        }
        return flag;
    }

    // ########################################## SignupUser Methods #########################################################
    public boolean signupUser() {
        boolean flag = false;
        try (Connection con = DBConnect.getConnection();
             PreparedStatement ps = con.prepareStatement(
                     "insert into companies (name, email, password, contact, address) values (?, ?, ?, ?, ?)",
                     PreparedStatement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, spe.encryptPassword(password));
            ps.setString(4, contact);
            ps.setString(5, address);

            int result = ps.executeUpdate();
            if (result == 1) {
                flag = true;
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) {
                        this.companyId = rs.getInt(1);
                        System.out.println("################### Company ID generated: " + companyId + " ###########################");
                    }
                }
            }
        } catch (SQLException e) {
            System.err.println("SQLException in signupUser: " + e.getMessage());
            e.printStackTrace();
        }
        return flag;
    }
    // ########################################## Methods Closed #########################################################

    // ########################################## Getter Setters #########################################################
    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Integer companyId) {
        this.companyId = companyId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getProfilePic() {
        return profilePic;
    }

    public void setProfilePic(String profilePic) {
        this.profilePic = profilePic;
    }

    public String getBanner() {
        return banner;
    }

    public void setBanner(String banner) {
        this.banner = banner;
    }

    public Integer getEstablishedOn() {
        return establishedOn;
    }

    public void setEstablishedOn(Integer establishedOn) {
        this.establishedOn = establishedOn;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getMission() {
        return mission;
    }

    public void setMission(String mission) {
        this.mission = mission;
    }

    public String getVision() {
        return vision;
    }

    public void setVision(String vision) {
        this.vision = vision;
    }
}
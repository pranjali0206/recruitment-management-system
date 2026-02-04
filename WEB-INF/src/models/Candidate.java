package models;

import java.sql.Date;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import utils.DBConnect;
import org.jasypt.util.password.StrongPasswordEncryptor;
import java.sql.ResultSet;

public class Candidate {

    public Integer candidateId;
    public String name;

    public String email;
    public String password;
    public String address;
    public String contact;
    public String profilePic;
    public Status statusId;
    public String activationCode;
    public String whatsapp;
    public String gender;
    public String linkdin;
    // ######################################### methods
    // #############################

    public Candidate(String name, String email, String password, String contact, String address) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.contact = contact;
        this.address = address;
    }

    public Candidate(String email, String password) {
        this.email = email;
        this.password = password;
    }

    StrongPasswordEncryptor spe = new StrongPasswordEncryptor();
    // ######################################### Login method
    // #############################

    public boolean login() {
        boolean flag = false;
        try {
            Connection con = DBConnect.getConnection();
            String query = "select * from candidates where email = ?;";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            System.out.println("queery fired");

            if (rs.next()) {

                System.out.println("checkin rs");
                if (spe.checkPassword(password, rs.getString("password"))) {
                    candidateId = rs.getInt("candidate_id");
                    name = rs.getString("name");
                    email = rs.getString("email");
                    contact = rs.getString("contact");
                    address = rs.getString("address");
                
                    profilePic = rs.getString("profile_pic");
                    statusId = new Status(rs.getInt("status_id"));
                    activationCode = rs.getString("activation_code");
                    whatsapp = rs.getString("whatsapp");
                    gender = rs.getString("gender");
                    linkdin = rs.getString("linked_in");
                    github = rs.getString("github");
                    dob = rs.getDate("dob");

                    flag = true;
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;

    }

    // ######################################### Signup method #############################

    public boolean signupUser() {
        boolean flag = false;

        try{
            Connection con = DBConnect.getConnection();
            String query = "insert into candidates (name,email,password,contact,address) values(?,?,?,?,?);";
            PreparedStatement ps = con.prepareStatement(query,PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setString(1,this.name);
            ps.setString(2,this.email);
            ps.setString(3, spe.encryptPassword(password));
            ps.setString(4,this.contact);
            ps.setString(5, this.address);

            int result = ps.executeUpdate();
            if(result==1){
                flag=true;
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) {
                        this.candidateId = rs.getInt(1);
                        System.out.println("################### Candidate ID generated: " + candidateId + " ###########################");
                    }
                }

            }
        }catch(SQLException e){
            e.printStackTrace();
            System.err.println("###################  SQLException occured in signup");
        }

            return flag;
        }
            


    // #####################################Getter Setters
    // ##########################

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getCandidateId() {
        return candidateId;
    }

    public void setCandidateId(Integer candidateId) {
        this.candidateId = candidateId;
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getLogo() {
        return profilePic;
    }

    public void setLogo(String profilePic) {
        this.profilePic = profilePic;
    }

    public Status getStatusId() {
        return statusId;
    }

    public void setStatusId(Status statusId) {
        this.statusId = statusId;
    }

    public String getActivationCode() {
        return activationCode;
    }

    public void setActivationCode(String activationCode) {
        this.activationCode = activationCode;
    }

    public String getWhatsapp() {
        return whatsapp;
    }

    public void setWhatsapp(String whatsapp) {
        this.whatsapp = whatsapp;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getLinkdin() {
        return linkdin;
    }

    public void setLinkdin(String linkdin) {
        this.linkdin = linkdin;
    }

    public String getGithub() {
        return github;
    }

    public void setGithub(String github) {
        this.github = github;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String github;
    public Date dob;

}

// package models;

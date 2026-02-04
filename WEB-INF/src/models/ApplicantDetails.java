package models;

import utils.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ApplicantDetails {
    private String fullName;
    private String email;
    private String phone;
    private String highestDegree;
    private String fieldOfStudy;
    private String institution;
    private String yearOfPassing;
    private String recentJobTitle;
    private String recentCompany;
    private String workDuration;
    private String resume;
    private String coverLetter;
    private String linkedinProfile;
    private String portfolio;
    private String skills;
    private String experience;
    private String availability;
    private Integer applicantDetailId;
    private Integer jobPostId;
    private Integer candidateId;
    private String jobTitle;
    private Status statusId;

    // Constructor
    public ApplicantDetails() {
        // Initialize statusId to avoid NullPointerException
        this.statusId = new Status(1); // Assuming 1 is the ID for "Pending" status
    }

    public ApplicantDetails(String fullName, String email, String phone, String highestDegree, String fieldOfStudy,
                           String institution, String yearOfPassing, String recentJobTitle, String recentCompany,
                           String workDuration, String resume, String coverLetter, String linkedinProfile,
                           String portfolio, String skills, String experience, String availability,
                           Integer jobPostId, Integer candidateId, String jobTitle, Status statusId) {
        this.fullName = fullName;
        this.email = email;
        this.phone = phone;
        this.highestDegree = highestDegree;
        this.fieldOfStudy = fieldOfStudy;
        this.institution = institution;
        this.yearOfPassing = yearOfPassing;
        this.recentJobTitle = recentJobTitle;
        this.recentCompany = recentCompany;
        this.workDuration = workDuration;
        this.resume = resume;
        this.coverLetter = coverLetter;
        this.linkedinProfile = linkedinProfile;
        this.portfolio = portfolio;
        this.skills = skills;
        this.experience = experience;
        this.availability = availability;
        this.jobPostId = jobPostId;
        this.candidateId = candidateId;
        this.jobTitle = jobTitle;
        this.statusId = statusId != null ? statusId : new Status(1); // Default to "Pending" if null
    }

    public boolean JobApplication() {
        boolean flag = false;
        try {
            Connection con = DBConnect.getConnection();
            System.out.println("Connected to the database successfully for job application.");
            String query = "INSERT INTO applicant_details (full_name, email, phone, highest_degree, field_of_study, " +
                          "institution, year_of_passing, recent_job_title, recent_company, work_duration, resume, " +
                          "cover_letter, linkedin_profile, portfolio, skills, experience, availability, job_post_id, " +
                          "candidate_id, job_title, status_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);

            System.out.println("Preparing to execute query: " + query);
            ps.setString(1, fullName);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, highestDegree);
            ps.setString(5, fieldOfStudy);
            ps.setString(6, institution);
            ps.setString(7, yearOfPassing);
            ps.setString(8, recentJobTitle);
            ps.setString(9, recentCompany);
            ps.setString(10, workDuration);
            ps.setString(11, resume);
            ps.setString(12, coverLetter);
            ps.setString(13, linkedinProfile);
            ps.setString(14, portfolio);
            ps.setString(15, skills);
            ps.setString(16, experience);
            ps.setString(17, availability);
            ps.setInt(18, jobPostId);
            ps.setInt(19, candidateId);
            ps.setString(20, jobTitle);
            ps.setInt(21, statusId.getStatusId());

            System.out.println("Executing the prepared statement.");
            
            int result = ps.executeUpdate();
            System.out.println("Query executed, result: " + result);
            if (result == 1) {
                System.out.println("Applicant details saved successfully, retrieving generated keys.");
                
                flag = true;
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) {
                        this.applicantDetailId = rs.getInt(1);
                    }
                }
                System.out.println("Applicant details saved successfully.");
            } else {
                System.out.println("Failed to save applicant details.");
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error while saving applicant details: " + e.getMessage());
        }
        return flag;
    }

    // Getters and Setters
    public Integer getCandidateId() {
        return candidateId;
    }

    public void setCandidateId(Integer candidateId) {
        this.candidateId = candidateId;
    }

    public Integer getJobPostId() {
        return jobPostId;
    }

    public void setJobPostId(Integer jobPostId) {
        this.jobPostId = jobPostId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getHighestDegree() {
        return highestDegree;
    }

    public void setHighestDegree(String highestDegree) {
        this.highestDegree = highestDegree;
    }

    public String getFieldOfStudy() {
        return fieldOfStudy;
    }

    public void setFieldOfStudy(String fieldOfStudy) {
        this.fieldOfStudy = fieldOfStudy;
    }

    public String getInstitution() {
        return institution;
    }

    public void setInstitution(String institution) {
        this.institution = institution;
    }

    public String getYearOfPassing() {
        return yearOfPassing;
    }

    public void setYearOfPassing(String yearOfPassing) {
        this.yearOfPassing = yearOfPassing;
    }

    public String getRecentJobTitle() {
        return recentJobTitle;
    }

    public void setRecentJobTitle(String recentJobTitle) {
        this.recentJobTitle = recentJobTitle;
    }

    public String getRecentCompany() {
        return recentCompany;
    }

    public void setRecentCompany(String recentCompany) {
        this.recentCompany = recentCompany;
    }

    public String getWorkDuration() {
        return workDuration;
    }

    public void setWorkDuration(String workDuration) {
        this.workDuration = workDuration;
    }

    public String getResume() {
        return resume;
    }

    public void setResume(String resume) {
        this.resume = resume;
    }

    public String getCoverLetter() {
        return coverLetter;
    }

    public void setCoverLetter(String coverLetter) {
        this.coverLetter = coverLetter;
    }

    public String getLinkedinProfile() {
        return linkedinProfile;
    }

    public void setLinkedinProfile(String linkedinProfile) {
        this.linkedinProfile = linkedinProfile;
    }

    public String getPortfolio() {
        return portfolio;
    }

    public void setPortfolio(String portfolio) {
        this.portfolio = portfolio;
    }

    public String getSkills() {
        return skills;
    }

    public void setSkills(String skills) {
        this.skills = skills;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public String getAvailability() {
        return availability;
    }

    public void setAvailability(String availability) {
        this.availability = availability;
    }

    public Integer getApplicantDetailId() {
        return applicantDetailId;
    }

    public void setApplicantDetailId(Integer applicantDetailId) {
        this.applicantDetailId = applicantDetailId;
    }

    public String getJobTitle() {
        return jobTitle;
    }

    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }

    public Status getStatusId() {
        return statusId;
    }

    public void setStatusId(Status statusId) {
        this.statusId = statusId != null ? statusId : new Status(1);
    }
}
package models;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.TreeSet;

import utils.DBConnect;

public class JobPosts implements Comparable<JobPosts> {
    private Integer jobPostId;
    private Company company;
    private String jobTitle;
    private Date postDate;
    private Date deadline;
    private String description;
    private String qualifications;
    private String skills;
    private String jobType;
    private String jobLocation;
    private Integer salary;
    private Status status;
    private City cityId;
    private Integer minExperience;

    // Constructors
    public JobPosts() {
    }
    public JobPosts(Integer jobPostId) {
        this.jobPostId = jobPostId;
    }

    public JobPosts(Integer jobPostId, Company company, String jobTitle, Date postDate, Date deadline,
            String description, String qualifications, String skills, String jobType, String jobLocation,
            Integer salary, City cityId, Integer minExperience) {
        this.jobPostId = jobPostId;
        this.company = company;
        this.jobTitle = jobTitle;
        this.postDate = postDate;
        this.deadline = deadline;
        this.description = description;
        this.qualifications = qualifications;
        this.skills = skills;
        this.jobType = jobType;
        this.jobLocation = jobLocation;
        this.salary = salary;
        this.cityId = cityId;
        this.minExperience = minExperience;
    }

    public JobPosts(Integer jobPostId, Integer companyId, String jobTitle, Date postDate, Date deadline,
            String description, String qualifications, String skills, String jobType, String jobLocation,
            Integer salary, Integer cityId, Integer minExperience) {
        this.jobPostId = jobPostId;
        this.company = new Company(companyId); // Initialize Company
        this.jobTitle = jobTitle;
        this.postDate = postDate;
        this.deadline = deadline;
        this.description = description;
        this.qualifications = qualifications;
        this.skills = skills;
        this.jobType = jobType;
        this.jobLocation = jobLocation;
        this.salary = salary;
        this.cityId = new City(cityId);
        this.minExperience = minExperience;
    }

    // Implement Comparable for TreeSet sorting
    @Override
    public int compareTo(JobPosts other) {
        if (this.jobPostId == null || other.jobPostId == null) {
            return 0; // Handle null cases
        }
        return this.jobPostId.compareTo(other.jobPostId); // Sort by jobPostId
    }





    

    // ##################################################### Method to collect all job post#############################################################
public ArrayList<JobPosts> collectAllJobs() {
    ArrayList<JobPosts> jobPosts = new ArrayList<>();

    try (Connection con = DBConnect.getConnection();
         PreparedStatement ps = con.prepareStatement("SELECT * FROM job_posts WHERE status_id = 7"); // Active jobs only
         ResultSet rs = ps.executeQuery()) {

        while (rs.next()) {
            JobPosts jobPost = new JobPosts(
                    rs.getInt("job_post_id"),
                    rs.getInt("company_id"),
                    rs.getString("job_title"),
                    rs.getDate("post_date"),
                    rs.getDate("deadline"),
                    rs.getString("description"),
                    rs.getString("qualifications"),
                    rs.getString("skills"),
                    rs.getString("job_type"),
                    rs.getString("job_location"),
                    rs.getInt("salary"),
                    rs.getInt("city_id"),
                    rs.getInt("min_experience"));
            jobPost.setStatus(new Status(rs.getInt("status_id")));
            jobPosts.add(jobPost);
        }
    } catch (SQLException e) {
        System.err.println("SQLException in collectAllJobs: " + e.getMessage() + ", SQLState: " + e.getSQLState());
        e.printStackTrace();
    }
    System.out.println("################### Job posts collected: " + jobPosts.size() + " #########################");
    return jobPosts;
}












// Method to collect jobs for a specific company
public ArrayList<JobPosts> collectCompanyJobs(Integer companyId) {
    ArrayList<JobPosts> jobPosts = new ArrayList<>();

    try (Connection con = DBConnect.getConnection();
         PreparedStatement ps = con.prepareStatement(
                 "SELECT * FROM job_posts WHERE company_id = ? AND status_id = 7")) {
        ps.setInt(1, companyId);
        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                JobPosts jobPost = new JobPosts(
                        rs.getInt("job_post_id"),
                        rs.getInt("company_id"),
                        rs.getString("job_title"),
                        rs.getDate("post_date"),
                        rs.getDate("deadline"),
                        rs.getString("description"),
                        rs.getString("qualifications"),
                        rs.getString("skills"),
                        rs.getString("job_type"),
                        rs.getString("job_location"),
                        rs.getInt("salary"),
                        rs.getInt("city_id"),
                        rs.getInt("min_experience"));
                jobPost.setStatus(new Status(rs.getInt("status_id")));
                jobPosts.add(jobPost);
            }
        }
    } catch (SQLException e) {
        System.err.println("SQLException in collectCompanyJobs: " + e.getMessage() + ", SQLState: " + e.getSQLState());
        e.printStackTrace();
    }
    System.out.println("################### Company job posts collected: " + jobPosts.size() + " #########################");
    return jobPosts;
}



    // ##################################################### Method to add a new job post#############################################################
    public boolean addJobPost() {
        boolean flag = false;
        Status status = new Status(7); // Assuming 7 is the ID for "active" status
        try (Connection con = DBConnect.getConnection();
            PreparedStatement ps = con.prepareStatement(
                        "INSERT INTO job_posts (company_id, job_title, post_date, deadline, description, qualifications, skills, job_type, job_location, min_experience, salary, city_id,status_id) VALUES (?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)",
                        PreparedStatement.RETURN_GENERATED_KEYS);) {

            System.out.println("################### Add job post query selected ###########################");
            ps.setInt(1, company.getCompanyId());
            ps.setString(2, jobTitle);
            ps.setDate(3, postDate);
            ps.setDate(4, deadline);
            ps.setString(5, description);
            ps.setString(6, qualifications);
            ps.setString(7, skills);
            ps.setString(8, jobType);
            ps.setString(9, jobLocation);
            ps.setInt(10, minExperience);
            ps.setInt(11, salary);
            ps.setInt(12, cityId.getCityId());
            ps.setInt(13, status.getStatusId());

            int result = ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                this.jobPostId = rs.getInt(1);
                System.out.println(
                        "################### Job post ID generated: " + jobPostId + " ###########################");
            }

            if (result == 1) {
                status = new Status(7); // Assuming 1 is the ID for "active" status
                System.out.println(status.getStatusId());

                System.out.println(status.getStatusId());
                System.out.println("################### Job post added successfully ###########################");

                flag = true;
                System.out.println("################### Job post added successfully ###########################");

            } else {
                System.out.println("################### Failed to add job post ###########################");
            }
            ps.close();
            con.close();

        } catch (SQLException e) {
            System.err.println("SQLException in addJobPost: " + e.getMessage());
            e.printStackTrace();
        }
        return flag;
    }


    // ###################################################### Method to delete a job post#############################################################
   
    public boolean deleteJobPost() {
        boolean flag = false;
        try (Connection con = DBConnect.getConnection();
             PreparedStatement ps = con.prepareStatement("DELETE FROM job_posts WHERE job_post_id = ?")) {
            ps.setInt(1, jobPostId);
            int result = ps.executeUpdate();
            if (result == 1) {
                System.out.println("################### Job post deleted successfully ###########################");
                flag = true;
            } else {
                System.out.println("################### Failed to delete job post ###########################");
            }
        } catch (SQLException e) {
            System.err.println("SQLException in deleteJobPost: " + e.getMessage());
            e.printStackTrace();
        }
        return flag;
    }

    // #################################################################################################################################################

    // Getters and Setters
    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public Integer getJobPostId() {
        return jobPostId;
    }

    public void setJobPostId(Integer jobPostId) {
        this.jobPostId = jobPostId;
    }

    public String getJobTitle() {
        return jobTitle;
    }

    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }

    public Date getPostDate() {
        return postDate;
    }

    public void setPostDate(Date postDate) {
        this.postDate = postDate;
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getQualifications() {
        return qualifications;
    }

    public void setQualifications(String qualifications) {
        this.qualifications = qualifications;
    }

    public String getSkills() {
        return skills;
    }

    public void setSkills(String skills) {
        this.skills = skills;
    }

    public String getJobType() {
        return jobType;
    }

    public void setJobType(String jobType) {
        this.jobType = jobType;
    }

    public String getJobLocation() {
        return jobLocation;
    }

    public void setJobLocation(String jobLocation) {
        this.jobLocation = jobLocation;
    }

    public Integer getSalary() {
        return salary;
    }

    public void setSalary(Integer salary) {
        this.salary = salary;
    }

    public City getCityId() {
        return cityId;
    }

    public void setCityId(City cityId) {
        this.cityId = cityId;
    }

    public Integer getMinExperience() {
        return minExperience;
    }

    public void setMinExperience(Integer minExperience) {
        this.minExperience = minExperience;
    }
}
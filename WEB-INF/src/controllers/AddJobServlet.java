package controllers;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.City;
import models.Company;
import models.Status;
import models.JobPosts;
import utils.Conversion;

@WebServlet("/addjob.do")
public class AddJobServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException,ServletException {
        HttpSession session = request.getSession();
        Company company = (Company) session.getAttribute("company");


        if (company == null || company.getCompanyId() == null) {
            System.out.println("Company not found in session or company ID is null.");
            session.setAttribute("error", "Please log in to add a job post.");
            return;
        }

        String jobTitle = request.getParameter("title");
        String postDateStr = request.getParameter("postDate");
        String deadlineStr = request.getParameter("deadline");
        String description = request.getParameter("description");
        String[] qualifications = request.getParameterValues("qualifications[]");
        String[] skills = request.getParameterValues("skills[]");
        String cityIdStr = request.getParameter("cityId");
        String jobType = request.getParameter("jobType");
        String location = request.getParameter("location");
        String minExperienceStr = request.getParameter("minExperience");
        String salaryStr = request.getParameter("salary");
        

        // Validate inputs
        if (jobTitle == null || jobTitle.isEmpty() || postDateStr == null || deadlineStr == null || description == null
                || qualifications == null || skills == null || jobType == null || location == null
                || minExperienceStr == null || salaryStr == null ||  cityIdStr == null) {
            System.out.println("All fields are required.");
            session.setAttribute("error", "All fields are required.");
            return;
        }

        // Convert and validate data
        Date postDate;
        Date deadline;
        Integer minExperience;
        Integer salary;
        Integer cityId;


        try {
            postDate = Date.valueOf(postDateStr);
            deadline = Date.valueOf(deadlineStr);
            minExperience = Integer.parseInt(minExperienceStr);
            salary = Integer.parseInt(salaryStr);
            cityId = Integer.parseInt(cityIdStr);



        } catch (IllegalArgumentException e) {
            System.out.println("Invalid input format: " + e.getMessage());
            session.setAttribute("error", "Invalid input format.");
            return;
        }

        City city = new City(cityId); // Assuming City constructor sets cityId
        if (city.getCityId() == null) {
            System.out.println("Invalid city ID.");
            session.setAttribute("error", "Invalid city ID.");
            return;
        }

        Conversion conversion = new Conversion();
        String qualificationsStr = conversion.arrayToCommaSeparatedString(qualifications);
        String skillsStr = conversion.arrayToCommaSeparatedString(skills);
        // Status status = new Status(Integer.parseInt(statusId)); // Assuming Status constructor sets statusId

       

        System.out.println("Qualifications: " + qualificationsStr);
        System.out.println("Skills: " + skillsStr);
        System.out.println("City ID: " + city.getCityId());


        // Create JobPosts object
        JobPosts jobPost = new JobPosts();
        jobPost.setCompany(company);
        jobPost.setJobTitle(jobTitle);
        jobPost.setPostDate(postDate);
        jobPost.setDeadline(deadline);
        jobPost.setDescription(description);
        jobPost.setQualifications(qualificationsStr);
        jobPost.setSkills(skillsStr);
        jobPost.setJobType(jobType);
        jobPost.setJobLocation(location);
        jobPost.setMinExperience(minExperience);
        jobPost.setSalary(salary);
        jobPost.setCityId(city);

        JobPosts jobposts = new JobPosts();



        if (jobPost.addJobPost()) {
            session.setAttribute("success", jobposts);
            System.out.println("Job post added successfully.");
           
    }
    else {
        session.setAttribute("error", "Failed to add job post.");
        System.out.println("Failed to add job post.");
    }

    response.sendRedirect("company.jsp");
}}
        
    
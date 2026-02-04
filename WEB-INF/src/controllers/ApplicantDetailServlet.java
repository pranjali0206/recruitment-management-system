package controllers;

import javax.servlet.http.*;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import java.io.*;
import models.ApplicantDetails;

@WebServlet("/applicantDetail.do")
@MultipartConfig
public class ApplicantDetailServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
            
        System.out.println("##################### ApplicantDetailServlet #########################");

        try {
            System.out.println("Processing applicant details...");
            // Retrieve candidateId and jobPostId from the request
            String candidateIdStr = request.getParameter("candidateId");
            String jobPostIdStr = request.getParameter("jobPostId");
            if (candidateIdStr == null || jobPostIdStr == null) {
                throw new IllegalArgumentException("Candidate ID and Job Post ID are required.");
            }       
            Integer candidateId = Integer.parseInt(candidateIdStr);
            Integer jobPostId = Integer.parseInt(jobPostIdStr);
            System.out.println("Candidate ID: " + candidateId);
            System.out.println("Job Post ID: " + jobPostId);

       

            // Personal Information
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");

            // Qualification Information
            String[] qualificationsArray = request.getParameterValues("qualifications[]");
            String highestDegree = qualificationsArray != null ? String.join(", ", qualificationsArray) : "";
            String fieldOfStudy = request.getParameter("fieldOfStudy");
            String institution = request.getParameter("institution");
            String yearOfPassing = request.getParameter("year_of_passing");

            // Experience Information
            String recentJobTitle = request.getParameter("recentJobTitle");
            String recentCompany = request.getParameter("recentCompany");
            String workDuration = request.getParameter("workDuration");

            // Additional Details
            Part resumePart = request.getPart("resume");
            String resumeFileName = null;
            if (resumePart != null && resumePart.getSize() > 0) {
                resumeFileName = resumePart.getSubmittedFileName();
                String uploadPath = getServletContext().getRealPath("/Uploads");
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) uploadDir.mkdir();
                resumePart.write(new File(uploadPath + File.separator + resumeFileName).getAbsolutePath());
            }

            String coverLetter = request.getParameter("coverLetter");
            String linkedin = request.getParameter("linkedin");
            String portfolio = request.getParameter("portfolio");
            String[] skillsArray = request.getParameterValues("skills[]");
            String skills = skillsArray != null ? String.join(", ", skillsArray) : "";
            String experience = request.getParameter("experience");
            String availability = request.getParameter("availability");
            String jobTitle = request.getParameter("jobTitle");

            // Validation for required fields
            if (fullName == null || fullName.isEmpty() ||
                email == null || email.isEmpty() ||
                phone == null || phone.isEmpty() ||
                highestDegree.isEmpty() ||
                fieldOfStudy == null || fieldOfStudy.isEmpty() ||
                institution == null || institution.isEmpty() ||
                yearOfPassing == null || yearOfPassing.isEmpty() ||
                skills.isEmpty() ||
                experience == null || experience.isEmpty() ||
                availability == null || availability.isEmpty() ||
                resumeFileName == null) {
                throw new IllegalArgumentException("All required fields must be filled, and a resume must be uploaded.");
            }

            // Create ApplicantDetails object
            ApplicantDetails applicantDetails = new ApplicantDetails();

            System.out.println("Creating ApplicantDetails object with the provided information...");
            // Set properties
            System.out.println("Setting applicant details...");
            
            applicantDetails.setFullName(fullName);
            applicantDetails.setEmail(email);
            applicantDetails.setPhone(phone);
            applicantDetails.setHighestDegree(highestDegree);
            applicantDetails.setFieldOfStudy(fieldOfStudy);
            applicantDetails.setInstitution(institution);
            applicantDetails.setYearOfPassing(yearOfPassing);
            applicantDetails.setRecentJobTitle(recentJobTitle != null ? recentJobTitle : "");
            applicantDetails.setRecentCompany(recentCompany != null ? recentCompany : "");
            applicantDetails.setWorkDuration(workDuration != null ? workDuration : "");
            applicantDetails.setResume(resumeFileName);
            applicantDetails.setCoverLetter(coverLetter != null ? coverLetter : "");
            applicantDetails.setLinkedinProfile(linkedin != null ? linkedin : "");
            applicantDetails.setPortfolio(portfolio != null ? portfolio : "");
            applicantDetails.setSkills(skills);
            applicantDetails.setExperience(experience);
            applicantDetails.setAvailability(availability);
            applicantDetails.setCandidateId(candidateId);
            applicantDetails.setJobPostId(jobPostId);
            applicantDetails.setJobTitle(jobTitle != null ? jobTitle : "");

            // Save to database
            System.out.println("Saving applicant details to the database...");
            boolean isSaved = applicantDetails.JobApplication();
            System.out.println("JobApplication() executed: " + isSaved);
            if (isSaved) {
                request.getSession().setAttribute("success", "Application submitted successfully.");
                request.getRequestDispatcher("/success.jsp").forward(request, response);
            } else {
                throw new IllegalStateException("Failed to save applicant details to the database.");
            }
        } catch (IllegalArgumentException e) {
            System.out.println("Invalid input: " + e.getMessage());
            e.printStackTrace();
        } catch (Exception e) {
            System.out.println("Unexpected error: " + e.getMessage());
            e.printStackTrace();
            
        }
    }

}
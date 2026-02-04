package controllers;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.JobPosts;

import java.io.IOException;



@WebServlet("/deleteJob.do")

public class DeleteJobServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String jobIdStr = request.getParameter("jobId");
        if (jobIdStr == null || jobIdStr.isEmpty()) {
            System.out.println("Job ID is required.");
            request.setAttribute("error", "Job ID is required.");
            return;
        }
        int jobId;
        try {
            jobId = Integer.parseInt(jobIdStr);
        } catch (NumberFormatException e) {
            System.out.println("Invalid Job ID format.");
            request.setAttribute("error", "Invalid Job ID format.");
            return;
        }

        System.out.println("##################### DeleteJobServlet #########################");
        System.out.println("Deleting job post with ID: " + jobId);
        JobPosts jobPost = new JobPosts();
        jobPost.setJobPostId(jobId);
        // Assuming JobPosts.deleteJobPost is a method that deletes a job post by its ID
        boolean success = jobPost.deleteJobPost();
        if (success) {
            System.out.println("Job post deleted successfully.");
            request.setAttribute("message", "Job post deleted successfully.");
        } else {
            System.out.println("Failed to delete job post.");
            request.setAttribute("error", "Failed to delete job post.");
        }
        // Redirect to the company page or job list page after deletion
        if(success) {
            //reload the company.jsp page to reflect the changes
            request.getRequestDispatcher("company.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }


   
}


package controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import models.Candidate;
import models.JobPosts;

@WebServlet("/collectalljobs.do")
public class CollectAllJobsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Check for authenticated candidate in session
        HttpSession session = request.getSession();
        Candidate candidate = (Candidate) session.getAttribute("candidate");

        if (candidate == null || candidate.getCandidateId() == null) {
            System.out.println("User not in session or candidate ID missing");
            
            response.getWriter().write("{\"error\": \"User not authenticated\"}");
            return;
        }

        System.out.println("Fetching jobs for candidate ID: " + candidate.getCandidateId());

        try {
            // Fetch jobs
            JobPosts jp = new JobPosts();
            ArrayList<JobPosts> jobPosts = jp.collectAllJobs();

            String json;
            if (jobPosts == null || jobPosts.isEmpty()) {
                System.out.println("No jobs found in database");
                json = "[]";
            } else {
                System.out.println("Found " + jobPosts.size() + " jobs");
                json = new Gson().toJson(jobPosts);
               
            }

            response.getWriter().write(json);
        } catch (Exception e) {
            System.err.println("Error fetching jobs: " + e.getMessage());
            e.printStackTrace();
            
            response.getWriter().write("{\"error\": \"Failed to fetch jobs: " + e.getMessage() + "\"}");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response); // Handle POST requests the same as GET
    }
}

package controllers;

import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import java.io.IOException;
import models.JobPosts;

@WebServlet("/collectCompanyJobs.do")
public class CollectCompanyJobsServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        Integer companyId = (Integer) request.getSession().getAttribute("companyId");

        if (companyId == null) {
            System.out.println("User not in session");
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.getWriter().write("{\"error\": \"User not authenticated\"}");
            return;
        }

        JobPosts jp = new JobPosts();
        ArrayList<JobPosts> jobPosts = jp.collectCompanyJobs(companyId);
        System.out.println("#############jospost not empty");
        String json;

        if (jobPosts == null || jobPosts.isEmpty()) {
            json = "[]"; // Return an empty array instead of "empty"

        } else {
            System.out.println("#############jospost not empty");
            json = new Gson().toJson(jobPosts);
        }

        // System.out.println("Response JSON: " + json); // Log the JSON response
        response.getWriter().write(json);
    }
}
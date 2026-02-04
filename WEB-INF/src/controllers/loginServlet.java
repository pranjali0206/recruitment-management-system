package controllers;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

import models.Candidate;
import models.Company;

import javax.servlet.annotation.WebServlet;

@WebServlet("/login.do")
public class loginServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("##################### loginServlet #########################");
        String email = request.getParameter("email");
        System.out.println("Email: " + email);
        String password = request.getParameter("password");
        String user = request.getParameter("user");

        HttpSession session = request.getSession();
        String nextPage = "home.jsp";

        // Validate input
        if (email == null || email.isEmpty() || password == null || password.isEmpty()) {
            session.setAttribute("error", "All fields are required.");
            System.out.println("All fields are required.");
            response.sendRedirect(nextPage);
            return;
        }

        // Create Company object and attempt login
        Company company = new Company(email, password);
        if (user.equals("company")) {
            if (company.login()) {
                // Verify companyId is set
                if (company.getCompanyId() == null) {
                    session.setAttribute("error", "Login failed: Company ID not retrieved.");
                    System.out.println("Login failed: Company ID not retrieved.");
                } else {
                    session.setAttribute("company", company);
                    session.setAttribute("companyId",company.getCompanyId());
                    session.setAttribute("success", "Login successful.");
                    System.out.println("Login successful. Company ID: " + company.getCompanyId());
                    nextPage = "company.jsp";
                }

            }
        } else if (user.equals("candidate")) {
            Candidate candidate = new Candidate(email, password);
            System.out.println(" candidate ID = " + candidate.getCandidateId());

            if (candidate.login()) {
                if (candidate.getCandidateId() == null) {
                    session.setAttribute("error", "Login failed: Candidate ID not retrieved.");
                    System.out.println("Login failed: Candidate ID not retrieved.");
                } else {
                    session.setAttribute("candidate", candidate);
                    session.setAttribute("candidateId",candidate.getCandidateId());
                    session.setAttribute("success", "Login successful.");
                    System.out.println("Login successful. Candidate ID: " + candidate.getCandidateId());
                    nextPage = "candidate.jsp";
                }
            }
        } else {
            session.setAttribute("error", "Login failed: Invalid credentials.");
            System.out.println("Login failed: Invalid credentials.");
        }
        response.sendRedirect(nextPage);

    }
}

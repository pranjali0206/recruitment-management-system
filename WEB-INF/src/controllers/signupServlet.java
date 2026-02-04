package controllers;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Company;
import models.Candidate;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

@WebServlet("/signup.do")
public class signupServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        System.out.println("##################### signupServlet #########################");

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String contact = request.getParameter("contact");
        String address = request.getParameter("address");
        String userType = request.getParameter("user");

        Company company = new Company();
        Candidate candidate = new Candidate(name, email, password, contact, address);


        String nextpage = "home.jsp";

        if (userType != null && userType.equals("company")) {

            company.setName(name);
            company.setEmail(email);
            company.setPassword(password);
            company.setContact(contact);
            company.setAddress(address);

            boolean result = company.signupUser();
            if (result) {
                nextpage = "company.jsp";
                request.setAttribute("msg", "Company Registered Successfully");
                System.out.println("Company Registered Successfully");

            }

        } else if (userType != null && userType.equals("candidate")) {

            candidate.setName(name);
            candidate.setEmail(email);
            candidate.setPassword(password);
            candidate.setContact(contact);
            candidate.setAddress(address);

            boolean result = candidate.signupUser();
            if (result) {
                
                nextpage = "candidate.jsp";
                request.setAttribute("msg", "Candidate Registered Successfully");
                System.out.println("Candidate Registered Successfully" + candidate.getCandidateId());

            }
        } else {
            nextpage = "home.jsp";
            request.setAttribute("error", "error occured in Signup");
            System.out.println("error occured in Signup");
        }

        System.out.println("#####################");

        request.getRequestDispatcher(nextpage).forward(request, response);

        System.out.println("#####################");

    }
}
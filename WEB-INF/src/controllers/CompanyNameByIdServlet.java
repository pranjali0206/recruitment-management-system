package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Company;
import com.google.gson.Gson;

@WebServlet("/getCompanyName.do")
public class CompanyNameByIdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String companyIdStr = request.getParameter("companyId");
        Integer companyId = null;

        // Validate companyId
        try {
            if (companyIdStr == null || companyIdStr.trim().isEmpty()) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write("{\"error\": \"Company ID is missing\"}");
                return;
            }
            companyId = Integer.parseInt(companyIdStr);
        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"error\": \"Invalid Company ID format\"}");
            return;
        }

        // Fetch company name
        Company company = new Company(companyId);
        String companyName = company.getCompanyNameById(companyId);
        System.out.println("Company name for ID " + companyId + ": " + companyName);

        if (companyName == null || companyName.trim().isEmpty()) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            response.getWriter().write("{\"error\": \"Company not found\"}");
        } else {
            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().write("{\"companyName\": \"" + companyName + "\"}");
        }
    }
}
package controllers; 


import java.io.IOException;
import javax.servlet.http.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;


@WebServlet("/index.do")
public class WelcomePageServlet extends HttpServlet {
    public void doGet(HttpServletRequest request , HttpServletResponse response  )throws ServletException , IOException {
        request.getRequestDispatcher("home.jsp").forward(request,response);
    }
}
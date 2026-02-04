package controllers;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;   
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;


@WebServlet("/logout.do")
public class logoutServlet extends HttpServlet{
    public void doGet(HttpServletRequest request , HttpServletResponse response ) throws IOException, ServletException{
        System.out.println("##################### logoutServlet #########################");

        HttpSession session = request.getSession(false);

        if(session != null){
            session.invalidate();
            System.out.println("Logged Out Successfully");
        }else{
            System.out.println("No Session Found");
        }
        response.sendRedirect("home.jsp");
    }

    
}

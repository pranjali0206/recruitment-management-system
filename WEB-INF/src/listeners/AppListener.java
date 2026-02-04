package listeners;

import javax.servlet.ServletContextListener;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContext;
import javax.servlet.annotation.WebListener;
import java.util.TreeSet;
import models.Qualification;
import models.Skill;
import models.City;
import models.Status;
import models.Company;
import models.JobPosts;



@WebListener 
public class AppListener implements ServletContextListener {
    public void contextInitialized(ServletContextEvent ev) {
        ServletContext context = ev.getServletContext();

        // Database connection parameters
        String dbURL = context.getInitParameter("dbURL");
        String dbUser = context.getInitParameter("dbUser");
        String dbPassword = context.getInitParameter("dbPassword");

        System.out.println("####################################");
        System.out.println("DB URL: " + dbURL);
        System.out.println("DB User: " + dbUser);
        System.out.println("DB Password: " + (dbPassword != null ? "********" : null));
        
        
        City city = new City();
        TreeSet<City> cities = (TreeSet<City>) context.getAttribute("cities"); // Safe cast
        if (cities == null) {
            cities = city.collectAllCities();
            context.setAttribute("cities", cities);
        }

        System.out.println("################### Cities loaded: " + cities.size() + " #########################");


        // Qualifications
        Qualification qualification = new Qualification();
        TreeSet<Qualification> qualifications = qualification.collectAllQualifications();
        context.setAttribute("qualifications", qualifications);
        System.out.println("################### Qualifications loaded: " + qualifications.size() + " #########################");

        // Skills
        Skill skill = new Skill();
        TreeSet<Skill> skills = skill.collectAllSkills();
        context.setAttribute("skills", skills);
        System.out.println("################### Skills loaded: " + skills.size() + " #########################");


         //Status 
        Status st = new Status();
        TreeSet<Status>  status = st.collectAllStatus();
        context.setAttribute("jobStatus", status);
        System.out.println("################### Status loaded: " + status.size() + " #########################");
        
        //Jobs
       
        
        
    }
    



    @Override
    public void contextDestroyed(ServletContextEvent ev) {
        System.out.println("################### Application context destroyed #########################");
    }
}

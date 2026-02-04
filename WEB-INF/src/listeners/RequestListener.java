// package listeners ;

// import java.util.TreeSet;

// import javax.servlet.Servlet;
// import javax.servlet.ServletRequestListener;
// import javax.servlet.ServletRequestEvent;


// import models.JobPosts;

// public class RequestListener implements ServletRequestListener {
//     @Override
//     public void requestInitialized(ServletRequestEvent sre) {
//         System.out.println("Request initialized: " + sre.getServletRequest().getRemoteAddr());

//         JobPosts jobPosts = new JobPosts();
//         TreeSet<JobPosts> jobPostsList = jobPosts.collectAllJobPosts();
//         sre.getServletContext().setAttribute("jobPosts", jobPostsList);
//     }

//     @Override
//     public void requestDestroyed(ServletRequestEvent sre) {
//         System.out.println("Request destroyed: " + sre.getServletRequest().getRemoteAddr());
//     }

// }
package utils ;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Connection;

public class DBConnect {

    public static String dbURL;
    public static String dbUser;
    public static String dbPassword;

    static {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }

    
    
    public static Connection getConnection(){
        
       
        Connection con = null;
        try{
           con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rmsdb?user=root&password=1234");
        }catch(SQLException s){
            s.printStackTrace();
        }

        return con ;
    }
   

}
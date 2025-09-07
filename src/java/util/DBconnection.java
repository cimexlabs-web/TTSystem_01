
package util;
import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnection {
    
    private static String url="jdbc:mysql://localhost:3306/ttdb";
    private static String user="root";
    private static String password="";
    
    public static Connection createconnection()
            {
                Connection con = null;
                try{
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection(url,user,password);
                }
                catch (Exception e){
                    System.out.println(e.getMessage());
                }
                
                return con;
            }
    
}

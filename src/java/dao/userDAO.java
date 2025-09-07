
package dao;
import model.user;
import util.DBconnection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.*;

public class userDAO {
    
    public String validateuser(String user,String pws)
    {
        String q1= "SELECT * FROM admin WHERE username=? AND password=?";
        
        try{
        
            Connection con = DBconnection.createconnection();
            PreparedStatement p1=con.prepareStatement(q1);
            
            p1.setString(1, user);
            p1.setString(2, pws);
            
            ResultSet rs1= p1.executeQuery();
            rs1.next();
            return rs1.getString("type");
     
        }
        catch (Exception e)
        {
            System.out.println(e.getMessage());
            return "error";
        }
        
    }
    
}

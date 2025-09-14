/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.DBconnection;

/**
 *
 * @author Akila Perera
 */
public class mainDAO {
    
    public byte[] img(int i)
    {
        byte[] imageBytes = null;
        try {
            String q1= "SELECT * FROM images WHERE id=?";
             
            Connection con= DBconnection.createconnection();
            PreparedStatement p1=con.prepareStatement(q1);
            
            p1.setInt(1, i);
            
            
            ResultSet rs1= p1.executeQuery();
            if (rs1.next())
            {
                imageBytes = rs1.getBytes("image");
            }
            
            
            con.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(mainDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return imageBytes;
        
    }
    
    public String about(int i)
    {
        String text = null;
        try {
            String q2="SELECT * FROM images WHERE id=?";
            
            Connection con=DBconnection.createconnection();
            PreparedStatement p2= con.prepareStatement(q2);
            
            p2.setInt(1, i);
            
            ResultSet rs2= p2.executeQuery();
            
            if(rs2.next())
            {
                text= rs2.getString("description");
            }
            
            con.close();
            
            
        } catch (SQLException ex) {
            Logger.getLogger(mainDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return text;
        
        
        
    }
    
}

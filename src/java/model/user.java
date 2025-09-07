/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Akila Perera
 */
public class user {
    private String user;
    private String pws;
    
    public user (String user,String pws)
    {
        this.user=user;
        this.pws=pws;
    }
    
    public String getusername()
    {
        return user;
    }
    
    public String getpassword()
    {
        return pws;
    }
}

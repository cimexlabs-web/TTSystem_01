/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.InputStream;
import javax.servlet.http.Part;

/**
 *
 * @author Akila Perera
 */
public class aboutImg {
    
    private InputStream img;
    private String id;
    
    public aboutImg(InputStream img, String id)
    {
        this.img=img;
        this.id=id;
    }
    
    public InputStream getImg()
    {
        return img;
    }
    
    public String getId()
    {
        return id;
    }
    
}

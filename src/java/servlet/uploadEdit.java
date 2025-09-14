/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.aboutDAO;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.about;
import javax.servlet.annotation.MultipartConfig;
import model.aboutImg;
/**
 *
 * @author Akila Perera
 */
@WebServlet(name = "uploadEdit", urlPatterns = {"/uploadEdit"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,     // 1MB buffer
    maxFileSize = 50 * 1024 * 1024,      // 50MB per file
    maxRequestSize = 50 * 1024 * 1024    // 50MB total
)

public class uploadEdit extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet uploadEdit</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet uploadEdit at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    try {
        String id = request.getParameter("id");
        aboutDAO ao = new aboutDAO();

        // If id is provided → image upload
        if (id != null) {
            Part img = request.getPart("image" + id);
            if (img != null && img.getSize() > 0) {
                InputStream imgStream = img.getInputStream();
                aboutImg abI = new aboutImg(imgStream, id);

                if (ao.insertImg(abI, id)) {
                    response.sendRedirect("Edit_about.jsp");
                    return;
                }
            }
        }

        // If no id → About Us text update
        String aboutText = request.getParameter("aboutUs");
        if (aboutText != null && !aboutText.trim().isEmpty()) {
            about ab = new about(aboutText);
            if (ao.insertText(ab)) {
                response.sendRedirect("Edit_about.jsp");
                return;
            }
        }

        // If nothing matched
        response.getWriter().println("No data received!");
    } catch (Exception e) {
        response.getWriter().println("Error: " + e.getMessage());
    }
}


    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class NAdmin_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"mainCss.css\">\n");
      out.write("        <title>Admin Panel</title>\n");
      out.write("    </head>\n");
      out.write("    <body class=\"admin-body\">\n");
      out.write("        ");

            if (session == null || !"NAdmin".equals(session.getAttribute("role")))
            {
                response.sendRedirect("login.html");
                return;
            }
        
      out.write("\n");
      out.write("        \n");
      out.write("        <div class=\"admin-container\">\n");
      out.write("            <div class=\"admin-header\">\n");
      out.write("                <h1>Admin Dashboard</h1>\n");
      out.write("                <p>Welcome, ");
      out.print( session.getAttribute("username") != null ? session.getAttribute("username") : "Admin" );
      out.write("</p>\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            <div class=\"panel-button\">\n");
      out.write("                <a href=\"edit.jsp\" class=\"a-btn\">\n");
      out.write("                    <i class=\"fas fa-edit\"></i>\n");
      out.write("                    <span>Edit Web page</span>\n");
      out.write("                </a>\n");
      out.write("                <a href=\"players_info.jsp\" class=\"a-btn\">\n");
      out.write("                    <i class=\"fas fa-users\"></i>\n");
      out.write("                    <span>Players</span>\n");
      out.write("                </a>\n");
      out.write("                <a href=\"message.jsp\" class=\"a-btn\">\n");
      out.write("                    <i class=\"fas fa-envelope\"></i>\n");
      out.write("                    <span>Web messages</span>\n");
      out.write("                </a>\n");
      out.write("                <a href=\"logout.jsp\" class=\"a-btn\">\n");
      out.write("                    <i class=\"fas fa-sign-out-alt\"></i>\n");
      out.write("                    <span>Logout</span>\n");
      out.write("                </a>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}

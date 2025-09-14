package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Edit_005fabout_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<head>\n");
      out.write("<meta charset=\"UTF-8\">\n");
      out.write("<link rel=\"stylesheet\" href=\"css/edit_form_css.css\">\n");
      out.write("<title>Edit About</title>\n");
      out.write("<style>\n");
      out.write("body {\n");
      out.write("    font-family: Arial, sans-serif;\n");
      out.write("    background: #f4f4f9;\n");
      out.write("    margin: 0;\n");
      out.write("    padding: 0;\n");
      out.write("}\n");
      out.write(".edit-about {\n");
      out.write("    max-width: 700px;\n");
      out.write("    margin: 50px auto;\n");
      out.write("    background: #fff;\n");
      out.write("    padding: 20px;\n");
      out.write("    border-radius: 12px;\n");
      out.write("    box-shadow: 0 4px 12px rgba(0,0,0,0.15);\n");
      out.write("    transition: transform 0.2s;\n");
      out.write("}\n");
      out.write(".edit-about:hover { transform: translateY(-3px); }\n");
      out.write(".edit-header { text-align: center; margin-bottom: 20px; }\n");
      out.write(".image-placeholder {\n");
      out.write("    width: 200px; height: 200px;\n");
      out.write("    border: 2px dashed #aaa;\n");
      out.write("    border-radius: 10px;\n");
      out.write("    margin: 0 auto 15px auto;\n");
      out.write("    background-size: cover; background-position: center;\n");
      out.write("    display: flex; justify-content: center; align-items: center;\n");
      out.write("    color: #aaa; cursor: pointer; transition: all 0.3s;\n");
      out.write("}\n");
      out.write(".image-placeholder.dragover { border-color: #4CAF50; background-color: #f0fff0; color: #4CAF50; }\n");
      out.write("input[type=\"file\"] { display: none; }\n");
      out.write(".submit-btn { padding: 10px 20px; background: #4CAF50; color: white; border: none; border-radius: 8px; cursor: pointer; transition: 0.3s; }\n");
      out.write(".submit-btn:hover { background: #45a049; }\n");
      out.write("textarea { width: 100%; min-height: 120px; padding: 10px; font-size: 16px; border-radius: 8px; border: 1px solid #ccc; margin-bottom: 15px; }\n");
      out.write(".message { text-align: center; margin-bottom: 15px; font-weight: bold; }\n");
      out.write("</style>\n");
      out.write("</head>\n");
      out.write("<body>\n");

    if (session == null || !("SAdmin".equals(session.getAttribute("role")) || "NAdmin".equals(session.getAttribute("role")))) {
        response.sendRedirect("login.html");
        return;
    }

      out.write('\n');
      out.write('\n');

String[] photoNames = {"Logo","Cover Photo","Photo 1","Photo 2","Photo 3","Photo 4"};
for(int i=0;i<photoNames.length;i++){
    int id = i+1; // IDs 1-6
    // Optional: get current image from DB if available
    String currentImg = (String) request.getAttribute("img"+id); // store image URL/base64 in request in servlet

      out.write("\n");
      out.write("<div class=\"edit-about\">\n");
      out.write("    <div class=\"edit-header\"><h1>Change ");
      out.print( photoNames[i] );
      out.write("</h1></div>\n");
      out.write("    <form action=\"uploadEdit\" method=\"post\" enctype=\"multipart/form-data\" onsubmit=\"return confirmUpload('");
      out.print(photoNames[i]);
      out.write("')\">\n");
      out.write("        <input type=\"hidden\" name=\"id\" value=\"");
      out.print(id);
      out.write("\">\n");
      out.write("        <label for=\"imageUpload");
      out.print(i);
      out.write("\">\n");
      out.write("            <div class=\"image-placeholder\" id=\"placeholder");
      out.print(i);
      out.write("\" \n");
      out.write("                 style=\"");
      out.print( currentImg != null ? "background-image:url('"+currentImg+"'); color:transparent;" : "" );
      out.write("\">\n");
      out.write("                ");
      out.print( currentImg == null ? "Click or Drag & Drop Image Here" : "" );
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </label>\n");
      out.write("        <input type=\"file\" name=\"image");
      out.print(id);
      out.write("\" id=\"imageUpload");
      out.print(i);
      out.write("\" accept=\"image/*\" onchange=\"previewImage(event,");
      out.print(i);
      out.write(")\">\n");
      out.write("        <div class=\"message\" id=\"msg");
      out.print(i);
      out.write("\"></div>\n");
      out.write("        <div style=\"text-align:center;\"><button type=\"submit\" class=\"submit-btn\">Submit</button></div>\n");
      out.write("    </form>\n");
      out.write("</div>\n");
 } 
      out.write("\n");
      out.write("\n");
      out.write("<!-- About Us Text -->\n");
      out.write("<div class=\"edit-about\">\n");
      out.write("    <div class=\"edit-header\"><h1>Edit About Us Text</h1></div>\n");
      out.write("    <form action=\"uploadEdit\" method=\"post\" enctype=\"multipart/form-data\" onsubmit=\"return confirmUpload('About Us Text')\">\n");
      out.write("        <textarea name=\"aboutUs\" placeholder=\"Write About Us here...\">");
      out.print( request.getAttribute("aboutText") != null ? request.getAttribute("aboutText") : "" );
      out.write("</textarea>\n");
      out.write("        <div style=\"text-align:center;\"><button type=\"submit\" class=\"submit-btn\">Update Text</button></div>\n");
      out.write("    </form>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<script>\n");
      out.write("function previewImage(event, index){\n");
      out.write("    const placeholder = document.getElementById(\"placeholder\"+index);\n");
      out.write("    const file = event.target.files[0];\n");
      out.write("    if(file){\n");
      out.write("        const reader = new FileReader();\n");
      out.write("        reader.onload = e=>{\n");
      out.write("            placeholder.style.backgroundImage = \"url('\" + e.target.result + \"')\";\n");
      out.write("            placeholder.innerHTML = \"\";\n");
      out.write("            document.getElementById(\"msg\"+index).innerText = \"New image selected!\";\n");
      out.write("        }\n");
      out.write("        reader.readAsDataURL(file);\n");
      out.write("    }\n");
      out.write("}\n");
      out.write("\n");
      out.write("// Drag & Drop\n");
      out.write("const totalPlaceholders = 6;\n");
      out.write("for(let i=0;i<totalPlaceholders;i++){\n");
      out.write("    const ph = document.getElementById(\"placeholder\"+i);\n");
      out.write("    const input = document.getElementById(\"imageUpload\"+i);\n");
      out.write("    ph.addEventListener(\"dragover\", e=>{ e.preventDefault(); ph.classList.add(\"dragover\"); });\n");
      out.write("    ph.addEventListener(\"dragleave\", e=>{ e.preventDefault(); ph.classList.remove(\"dragover\"); });\n");
      out.write("    ph.addEventListener(\"drop\", e=>{\n");
      out.write("        e.preventDefault(); ph.classList.remove(\"dragover\");\n");
      out.write("        const file = e.dataTransfer.files[0];\n");
      out.write("        if(file){ input.files = e.dataTransfer.files; previewImage({target:{files:[file]}},i); }\n");
      out.write("    });\n");
      out.write("}\n");
      out.write("\n");
      out.write("// Confirm submission\n");
      out.write("function confirmUpload(name){\n");
      out.write("    return confirm(\"Are you sure you want to upload/update \" + name + \"?\");\n");
      out.write("}\n");
      out.write("</script>\n");
      out.write("</body>\n");
      out.write("</html>\n");
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

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Edit About</title>
    <link rel="stylesheet" href="css/Edit_about.css">
        
</head>
<body>
<%
    if (session == null || !("SAdmin".equals(session.getAttribute("role")) || "NAdmin".equals(session.getAttribute("role")))) {
        response.sendRedirect("login.html");
        return;
    }

    // ====== PLACEHOLDER: Fetch images from DB ======
    // Replace with your backend DB code or servlet calls
    // Example: Map<Integer,String> images = getImagesFromDB();
    Map<Integer,String> images = new HashMap<>();
    images.put(1, "fetchImageServlet?id=1"); // Logo
    images.put(2, "fetchImageServlet?id=2"); // Cover
    images.put(3, "fetchImageServlet?id=3"); // Photo 1
    images.put(4, "fetchImageServlet?id=4"); // Photo 2
    images.put(5, "fetchImageServlet?id=5"); // Photo 3
    images.put(6, "fetchImageServlet?id=6"); // Photo 4
%>

<!-- Back Button -->
<a href="javascript:history.back()" class="back-btn">← Back</a>

<!-- Logo -->
<div class="edit-about">
    <div class="edit-header"><h1>Change LOGO</h1></div>
    <div class="image-wrapper">
        <!-- DB Image -->
        <div class="db-image" style="background-image:url('<%= images.get(1) %>');"></div>
        <!-- Upload Placeholder -->
        <form action="uploadServlet" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" value="1">
            <label for="imageUpload0">
                <div class="image-placeholder" id="placeholder0">Click or Drag & Drop Image Here</div>
            </label>
            <input type="file" name="image" id="imageUpload0" accept="image/*" onchange="previewImage(event, 0)">
            <div style="text-align:center;"><button type="submit" class="submit-btn">Submit</button></div>
        </form>
    </div>
</div>

<!-- Cover Photo -->
<div class="edit-about">
    <div class="edit-header"><h1>Change Cover Photo</h1></div>
    <div class="image-wrapper">
        <div class="db-image" style="background-image:url('<%= images.get(2) %>');"></div>
        <form action="uploadServlet" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" value="2">
            <label for="imageUpload1">
                <div class="image-placeholder" id="placeholder1">Click or Drag & Drop Image Here</div>
            </label>
            <input type="file" name="image" id="imageUpload1" accept="image/*" onchange="previewImage(event, 1)">
            <div style="text-align:center;"><button type="submit" class="submit-btn">Submit</button></div>
        </form>
    </div>
</div>

<!-- About Us Text -->
<div class="edit-about">
    <div class="edit-header"><h1>Edit About Us Text</h1></div>
    <form action="updateAboutServlet" method="post">
        <textarea name="aboutUs" placeholder="Write About Us here..."><%= request.getAttribute("aboutText") != null ? request.getAttribute("aboutText") : "" %></textarea>
        <div style="text-align:center;"><button type="submit" class="submit-btn">Update Text</button></div>
    </form>
</div>

<!-- About Us Photos -->
<%
    String[] photoNames = {"Photo 1", "Photo 2", "Photo 3", "Photo 4"};
    for(int i = 0; i < photoNames.length; i++){
%>
<div class="edit-about">
    <div class="edit-header"><h1>Change About Us <%= photoNames[i] %></h1></div>
    <div class="image-wrapper">
        <div class="db-image" style="background-image:url('<%= images.get(i+3) %>');"></div>
        <form action="uploadServlet" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" value="<%= i+3 %>"> <!-- IDs 3-6 -->
            <label for="imageUpload<%=i+2%>">
                <div class="image-placeholder" id="placeholder<%=i+2%>">Click or Drag & Drop Image Here</div>
            </label>
            <input type="file" name="image" id="imageUpload<%=i+2%>" accept="image/*" onchange="previewImage(event, <%=i+2%>)">
            <div style="text-align:center;"><button type="submit" class="submit-btn">Submit</button></div>
        </form>
    </div>
</div>
<% } %>
<script src="script.js" defer</script>
</body>
</html>

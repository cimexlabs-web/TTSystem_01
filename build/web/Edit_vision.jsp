<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Edit Vision</title>
    <link rel="stylesheet" href ="css/Edit_vision.css">   
</head>
<body>
<%
    if (session == null || !("SAdmin".equals(session.getAttribute("role")) || "NAdmin".equals(session.getAttribute("role")))) {
        response.sendRedirect("login.html");
        return;
    }

    // ==== Placeholder for DB/Servlet image fetch ====
    // Example: store the vision photo URL from DB
    String visionImage = "fetchVisionImageServlet?id=1"; 
%>

<!-- Back Button -->
<a href="javascript:history.back()" class="back-btn">← Back</a>

<!-- Vision Text -->
<div class="edit-section">
    <div class="edit-header"><h1>Edit Vision Text</h1></div>
    <form action="updateVisionServlet" method="post">
        <textarea name="visionText" placeholder="Write Vision text here..."><%= request.getAttribute("visionText") != null ? request.getAttribute("visionText") : "" %></textarea>
        <div style="text-align:center;">
            <button type="submit" class="submit-btn">Update Text</button>
        </div>
    </form>
</div>

<!-- Vision Photo -->
<div class="edit-section">
    <div class="edit-header"><h1>Change Vision Photo</h1></div>
    <div class="image-wrapper">
        <!-- Existing DB Image -->
        <div class="db-image" style="background-image:url('<%= visionImage %>');"></div>

        <!-- Upload New Image -->
        <form action="uploadVisionServlet" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" value="1"> <!-- ID for Vision photo -->
            <label for="visionPhotoUpload">
                <div class="image-placeholder" id="visionPlaceholder">Click or Drag & Drop Image Here</div>
            </label>
            <input type="file" name="image" id="visionPhotoUpload" accept="image/*" onchange="previewVisionImage(event)">
            <div style="text-align:center;">
                <button type="submit" class="submit-btn">Submit</button>
            </div>
        </form>
    </div>
</div>
<script src="script.js" defer</script>

</body>
</html>

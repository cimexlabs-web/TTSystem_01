<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Edit About</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f9;
            margin: 0;
            padding: 0;
        }
        .edit-about {
            max-width: 700px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
        .edit-header {
            text-align: center;
            margin-bottom: 20px;
        }
        .image-placeholder {
            width: 200px;
            height: 200px;
            border: 2px dashed #aaa;
            border-radius: 10px;
            margin: 0 auto 15px auto;
            background-size: cover;
            background-position: center;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #aaa;
            cursor: pointer;
            transition: 0.3s;
        }
        .image-placeholder.dragover {
            border-color: #4CAF50;
            background-color: #f0fff0;
            color: #4CAF50;
        }
        input[type="file"] {
            display: none;
        }
        .submit-btn {
            padding: 10px 20px;
            background: #4CAF50;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }
        .submit-btn:hover {
            background: #45a049;
        }
        textarea {
            width: 100%;
            min-height: 120px;
            padding: 10px;
            font-size: 16px;
            border-radius: 8px;
            border: 1px solid #ccc;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
<%
    if (session == null || !("SAdmin".equals(session.getAttribute("role")) || "NAdmin".equals(session.getAttribute("role")))) {
        response.sendRedirect("login.html");
        return;
    }
%>

<!-- Logo -->
<div class="edit-about">
    <div class="edit-header"><h1>Change LOGO</h1></div>
    <form action="uploadServlet" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="1">
        <label for="imageUpload0">
            <div class="image-placeholder" id="placeholder0">Click or Drag & Drop Image Here</div>
        </label>
        <input type="file" name="image" id="imageUpload0" accept="image/*" onchange="previewImage(event, 0)">
        <div style="text-align:center;"><button type="submit" class="submit-btn">Submit</button></div>
    </form>
</div>

<!-- Cover Photo -->
<div class="edit-about">
    <div class="edit-header"><h1>Change Cover Photo</h1></div>
    <form action="uploadServlet" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="2">
        <label for="imageUpload1">
            <div class="image-placeholder" id="placeholder1">Click or Drag & Drop Image Here</div>
        </label>
        <input type="file" name="image" id="imageUpload1" accept="image/*" onchange="previewImage(event, 1)">
        <div style="text-align:center;"><button type="submit" class="submit-btn">Submit</button></div>
    </form>
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
    <form action="uploadServlet" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="<%= i+3 %>"> <!-- IDs 3-6 -->
        <label for="imageUpload<%=i+2%>">
            <div class="image-placeholder" id="placeholder<%=i+2%>">Click or Drag & Drop Image Here</div>
        </label>
        <input type="file" name="image" id="imageUpload<%=i+2%>" accept="image/*" onchange="previewImage(event, <%=i+2%>)">
        <div style="text-align:center;"><button type="submit" class="submit-btn">Submit</button></div>
    </form>
</div>
<% } %>

<script>
function previewImage(event, index){
    const placeholder = document.getElementById("placeholder"+index);
    const fileInput = document.getElementById("imageUpload"+index);
    const file = event.target.files[0];
    if(file){
        const reader = new FileReader();
        reader.onload = function(e){
            placeholder.style.backgroundImage = "url('" + e.target.result + "')";
            placeholder.innerHTML = "";
        }
        reader.readAsDataURL(file);
    }
}

// Drag & Drop for all placeholders
const totalPlaceholders = 6; // 0=logo,1=cover,2-5=about photos
for(let i=0;i<totalPlaceholders;i++){
    const placeholder = document.getElementById("placeholder"+i);
    const fileInput = document.getElementById("imageUpload"+i);
    placeholder.addEventListener("dragover", function(e){
        e.preventDefault();
        placeholder.classList.add("dragover");
    });
    placeholder.addEventListener("dragleave", function(e){
        e.preventDefault();
        placeholder.classList.remove("dragover");
    });
    placeholder.addEventListener("drop", function(e){
        e.preventDefault();
        placeholder.classList.remove("dragover");
        const file = e.dataTransfer.files[0];
        if(file){
            fileInput.files = e.dataTransfer.files;
            previewImage({target:{files:[file]}}, i);
        }
    });
}
</script>

</body>
</html>

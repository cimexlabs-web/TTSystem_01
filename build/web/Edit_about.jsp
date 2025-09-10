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
        </style>
    </head>
    <body>
        <%
            if (session == null || !("SAdmin".equals(session.getAttribute("role")) || "NAdmin".equals(session.getAttribute("role")))) {
                response.sendRedirect("login.html");
                return;
            }
        %>
    
        <div class="edit-about">
            <div class="edit-header">
                <h1>Edit About Us Section</h1>
            </div>
            
            <div class="edit-about-containt">
                <form action="uploadServlet" method="post" enctype="multipart/form-data">
                    
                    <!-- Hidden ID field -->
                    <input type="hidden" name="id" value="1">

                    <label for="imageUpload">
                        <div class="image-placeholder" id="placeholder">
                            Click or Drag & Drop Image Here
                        </div>
                    </label>
                    <input type="file" name="image" id="imageUpload" accept="image/*" onchange="previewImage(event)">
                    
                    <br>
                    <div style="text-align:center;">
                        <button type="submit" class="submit-btn">Submit</button>
                    </div>
                </form>
            </div>
        </div>
        
                <div class="edit-about">
            <div class="edit-header">
                <h1>Edit About Us Section</h1>
            </div>
            
            <div class="edit-about-containt">
                <form action="uploadServlet" method="post" enctype="multipart/form-data">
                    
                    <!-- Hidden ID field -->
                    <input type="hidden" name="id" value="1">

                    <label for="imageUpload">
                        <div class="image-placeholder" id="placeholder">
                            Click or Drag & Drop Image Here
                        </div>
                    </label>
                    <input type="file" name="image" id="imageUpload" accept="image/*" onchange="previewImage(event)">
                    
                    <br>
                    <div style="text-align:center;">
                        <button type="submit" class="submit-btn">Submit</button>
                    </div>
                </form>
            </div>
        </div>

        <script>
            const placeholder = document.getElementById("placeholder");
            const fileInput = document.getElementById("imageUpload");

            // Preview function
            function previewImage(event) {
                const file = event.target.files[0];
                if (file) {
                    const reader = new FileReader();
                    reader.onload = function(e) {
                        placeholder.style.backgroundImage = "url('" + e.target.result + "')";
                        placeholder.innerHTML = "";
                    }
                    reader.readAsDataURL(file);
                }
            }

            // Drag & Drop handlers
            placeholder.addEventListener("dragover", function(e) {
                e.preventDefault();
                placeholder.classList.add("dragover");
            });

            placeholder.addEventListener("dragleave", function(e) {
                e.preventDefault();
                placeholder.classList.remove("dragover");
            });

            placeholder.addEventListener("drop", function(e) {
                e.preventDefault();
                placeholder.classList.remove("dragover");

                const file = e.dataTransfer.files[0];
                if (file) {
                    fileInput.files = e.dataTransfer.files; // Attach dropped file to input
                    previewImage({ target: { files: [file] } });
                }
            });
        </script>
    </body>
</html>

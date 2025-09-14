

// Mobile menu toggle functionality
const menuToggle = document.getElementById('menuToggle');
const navList = document.getElementById('navList');

if (menuToggle && navList) {
    menuToggle.addEventListener('click', () => {
        navList.classList.toggle('active');
        
        // Change icon based on menu state
        const icon = menuToggle.querySelector('i');
        if (navList.classList.contains('active')) {
            icon.classList.remove('fa-bars');
            icon.classList.add('fa-times');
        } else {
            icon.classList.remove('fa-times');
            icon.classList.add('fa-bars');
        }
    });
}

// Close menu when clicking on a link
const navLinks = document.querySelectorAll('.navlist a');
navLinks.forEach(link => {
    link.addEventListener('click', () => {
        if (navList.classList.contains('active')) {
            navList.classList.remove('active');
            const icon = menuToggle.querySelector('i');
            icon.classList.remove('fa-times');
            icon.classList.add('fa-bars');
        }
    });
});

// Smooth scrolling for navigation links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const targetId = this.getAttribute('href');
        if (targetId === '#') return;
        
        const targetElement = document.querySelector(targetId);
        if (targetElement) {
            window.scrollTo({
                top: targetElement.offsetTop - 80,
                behavior: 'smooth'
            });
        }
    });
});

// Form submission handling

document.addEventListener('DOMContentLoaded', function() {
    const accordionHeaders = document.querySelectorAll('.accordion-header');
    
    accordionHeaders.forEach(header => {
        header.addEventListener('click', function() {
            this.classList.toggle('active');
            const content = this.nextElementSibling;
            
            if (content.style.maxHeight) {
                content.style.maxHeight = null;
                content.classList.remove('show');
            } else {
                content.style.maxHeight = content.scrollHeight + "px";
                content.classList.add('show');
            }
        });
    });
});
// Simple form validation
        document.getElementById('loginForm').addEventListener('submit', function(e) {
            e.preventDefault();
            
            const username = document.getElementById('username').value;
            const password = document.getElementById('password').value;
            const errorDiv = document.getElementById('loginError');
            
            // Simple validation
            if (username.trim() === '' || password.trim() === '') {
                errorDiv.textContent = 'Please fill in all fields';
                errorDiv.style.display = 'block';
                return;
            }
            
            // If validation passes, submit the form
            this.submit();
        });
        
        
      
        function previewVisionImage(event){
            const placeholder = document.getElementById("visionPlaceholder");
            const fileInput = document.getElementById("visionPhotoUpload");
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

        // Drag & Drop for Vision photo
        const visionPlaceholder = document.getElementById("visionPlaceholder");
        const visionFileInput = document.getElementById("visionPhotoUpload");

        visionPlaceholder.addEventListener("dragover", function(e){
            e.preventDefault();
            visionPlaceholder.classList.add("dragover");
        });

        visionPlaceholder.addEventListener("dragleave", function(e){
            e.preventDefault();
            visionPlaceholder.classList.remove("dragover");
        });

        visionPlaceholder.addEventListener("drop", function(e){
            e.preventDefault();
            visionPlaceholder.classList.remove("dragover");
            const file = e.dataTransfer.files[0];
            if(file){
                visionFileInput.files = e.dataTransfer.files;
                previewVisionImage({target:{files:[file]}});
            }
        });
        
        
        
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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Document</title>
  
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Animate.css -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
  <!-- Material Icons -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  
</head>

<style>

  body{
    background-color: aliceblue;
  }
  .hero-section {
            background: linear-gradient(135deg, #007bff 0%, #00d4ff 100%);
            color: white;
            padding: 100px 0;
            text-align: center;
            position: relative;
            overflow: hidden;
        }
        .hero-section::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.2) 0%, transparent 70%);
            animation: rotate 20s linear infinite;
        }
        @keyframes rotate {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
        .hero-section h1 {
            font-size: 3.5rem;
            font-weight: 700;
            margin-bottom: 20px;
        }
        .hero-section p {
            font-size: 1.5rem;
            margin-bottom: 30px;
        }
        .cta-btn {
            padding: 12px 30px;
            font-size: 1.2rem;
            border-radius: 50px;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .cta-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 4px 15px rgba(0,0,0,0.3);
        }
        .feature-card {
            background: rgb(255, 255, 255);
            border: none;
            border-radius: 15px;
            padding: 20px;
            text-align: center;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .feature-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.2);
        }
        .feature-card .material-icons {
            font-size: 48px;
            color: #007bff;
            margin-bottom: 15px;
        }
        .testimonial-section {
            background: #e9ecef;
            padding: 50px 0;
        }
        .testimonial-carousel .carousel-item {
            padding: 20px;
            text-align: center;
        }
        .testimonial-carousel img {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            margin: 0 auto 15px;
        }
        .cta-section {
            background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
            color: white;
            padding: 50px 0;
            text-align: center;
        }
        .footer {
            background: #343a40;
            color: white;
            padding: 30px 0;
        }
        .footer a {
            color: #00d4ff;
            text-decoration: none;
        }
        .footer a:hover {
            text-decoration: underline;
        }
        .social-icons a {
            font-size: 24px;
            margin: 0 10px;
            color: white;
            transition: color 0.3s;
        }
        .social-icons a:hover {
            color: #00d4ff;
        }
        /* Scroll-triggered animation */
        .animate-on-scroll {
            opacity: 0;
            transition: opacity 0.5s, transform 0.5s;
        }
        .animate-on-scroll.visible {
            opacity: 1;
            transform: translateY(0);
        }
</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<body>


   <c:import url="header.jsp"> </c:import>
   
   
    <!-- <h1>Welcome page</h1> -->
    <section class="hero-section mt-3">
      <div class="container">
          <h1 class="animate__animated animate__fadeInDown">Welcome to RMS</h1>
          <p class="animate__animated animate__fadeInUp animate__delay-1s">Streamline your recruitment process with our powerful management system.</p>
          <div class="animate__animated animate__zoomIn animate__delay-2s">
              <c:choose>
                  <c:when test="${not empty sessionScope.company}">
                      <a href="company.jsp" class="btn btn-light cta-btn"><span class="material-icons">dashboard</span> Go to Dashboard</a>
                  </c:when>
                  <c:when test="${not empty sessionScope.candidate}">
                      <a href="candidate.jsp" class="btn btn-light cta-btn"><span class="material-icons">dashboard</span> Go to Dashboard</a>
                  </c:when>
                  <c:otherwise>
                      <a href="signup.do?user=company"  data-bs-target="#signupbox" data-bs-toggle="modal" class="btn btn-light cta-btn me-2"><span class="material-icons">business</span> Sign In as Company</a>
                      <a href="signup.do?user=candidate"  data-bs-target="#signupbox" data-bs-toggle="modal" class="btn btn-outline-light cta-btn"><span class="material-icons">person</span> Sign In as Candidate</a>
                  </c:otherwise>
              </c:choose>
          </div>
      </div>
  </section>

  
    <!-- Features Section -->
    <section class="py-5">
      <div class="container mb-5">
          <h2 class="text-center mb-5 animate__animated animate__fadeIn">Why Choose RMS?</h2>
          <div class="row g-4">
              <div class="col-md-3 animate-on-scroll" style="transform: translateY(50px);">
                  <div class="feature-card">
                      <span class="material-icons">work</span>
                      <h5>Post Jobs</h5>
                      <p>Create and manage job postings effortlessly to attract top talent.</p>
                  </div>
              </div>
              <div class="col-md-3 animate-on-scroll" style="transform: translateY(50px);">
                  <div class="feature-card">
                      <span class="material-icons">people</span>
                      <h5>Manage Candidates</h5>
                      <p>Track and evaluate candidates with intuitive tools.</p>
                  </div>
              </div>
              <div class="col-md-3 animate-on-scroll" style="transform: translateY(50px);">
                  <div class="feature-card">
                      <span class="material-icons">message</span>
                      <h5>Seamless Messaging</h5>
                      <p>Communicate with candidates directly within the platform.</p>
                  </div>
              </div>
              <div class="col-md-3 animate-on-scroll" style="transform: translateY(50px);">
                  <div class="feature-card">
                      <span class="material-icons">school</span>
                      <h5>Skill Matching</h5>
                      <p>Match candidates based on skills and qualifications.</p>
                  </div>
              </div>
          </div>
      </div>
  </section>

  <!-- Testimonial Section -->
  <section class="testimonial-section">
      <div class="container">
          <h2 class="text-center mb-5 animate__animated animate__fadeIn">What Our Users Say</h2>
          <div id="testimonialCarousel" class="carousel slide" data-bs-ride="carousel">
              <div class="carousel-inner">
                  <div class="carousel-item active">
                      <!-- <img src="Static/media/user1.jpg" alt="User 1" class="rounded-circle mb-3 h-5"> -->
                      <p>"RMS has transformed our hiring process. Highly recommend!"</p>
                      <h5>Ram Kumar</h5>
                  </div>
                  <div class="carousel-item">
                      <!-- <img src="Static/media/user2.jpg" alt="User 2" class="rounded-circle mb-3 h-5"> -->
                      <p>"The best recruitment system I've ever used. Simple and effective."</p>
                      <h5>Shyam Kumar</h5>
                  </div>
                  <div class="carousel-item">
                      <!-- <img src="Static/media/user3.jpg" alt="User 3" class="rounded-circle mb-3 h-5"> -->
                      <p>"Great platform for both companies and candidates. Love it!"</p>
                      <h5>Yamraj kumar</h5>
                  </div>
          </div>
      </div>
  </section>

  <!-- CTA Section -->
  <section class="cta-section">
      <div class="container text-center">
          <h2 class="animate__animated animate__fadeIn">Ready to Transform Your Recruitment?</h2>
          <p class="animate__animated animate__fadeIn animate__delay-1s">Join thousands of companies and candidates using RMS today.</p>
          <c:choose>
              <c:when test="${not empty sessionScope.company}">
                  <a href="company.jsp" class="btn btn-light cta-btn animate__animated animate__zoomIn animate__delay-2s"><span class="material-icons">dashboard</span> Go to Dashboard</a>
              </c:when>
              <c:when test="${not empty sessionScope.candidate}">
                  <a href="candidate.jsp" class="btn btn-light cta-btn animate__animated animate__zoomIn animate__delay-2s"><span class="material-icons">dashboard</span> Go to Dashboard</a>
              </c:when>
              <c:otherwise>
                  <a href="company_signin.jsp" class="btn btn-light cta-btn animate__animated animate__zoomIn animate__delay-2s"><span class="material-icons">business</span> Get Started as Company</a>
              </c:otherwise>
          </c:choose>
      </div>
  </section>

<!-- ---footer section--- -->
<footer class="footer">
  <div class="container">
      <div class="row">
          <div class="col-md-4">
              <h5>RMS</h5>
              <p>Empowering recruitment with cutting-edge technology.</p>
          </div>
          <div class="col-md-4">
              <h5>Links</h5>
              <ul class="list-unstyled">
                  <li><a href="#">About Us</a></li>
                  <li><a href="#">Contact</a></li>
                  <li><a href="#">Terms of Service</a></li>
                  <li><a href="#">Privacy Policy</a></li>
              </ul>
          </div>
          <div class="col-md-4 text-center">
              <h5>Follow Us</h5>
              <div class="social-icons">
                  <a href="#"><i class="fab fa-facebook-f"></i></a>
                  <a href="#"><i class="fab fa-twitter"></i></a>
                  <a href="#"><i class="fab fa-linkedin-in"></i></a>
              </div>
          </div>
      </div>
      <p class="text-center mt-4">&copy; 2025 RMS. All rights reserved.</p>
  </div>
</footer>

  


</body>



<!-- ##########################################Script########################### -->



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="Static/js/design.js"></script>
<script src="Static/js/header.js"></script>


<script>
  $(document).ready(function() {
      // Animate on scroll
      function checkScroll() {
          $('.animate-on-scroll').each(function() {
              var elementTop = $(this).offset().top;
              var windowBottom = $(window).scrollTop() + $(window).height();
              if (elementTop < windowBottom - 50) {
                  $(this).addClass('visible');
              }
          });
      }
      checkScroll();
      $(window).scroll(checkScroll);
  });
</script>


<script>

  const users = new Array ("company","candidate");
  const user_card_box = document.querySelector("#user_card_box");
  const user_type = document.querySelector("#user_type");
  const uType = document.querySelector('#uType');

  const mymodel = document.getElementById("#myModal");
  const myInput = document.getElementById("#myInput") ;

  const signup_btn = document.querySelector("#signup_btn");
  const signup_form = document.querySelector("#signup_form");
  const signup_title = document.querySelector("#signup_title");




document.getElementById("signup_form").addEventListener("submit", (event) => {
  event.preventDefault(); // Prevent default form submission

  const signupForm = document.getElementById("signup_form");
  const signupTitle = document.getElementById("signup_title");
  const userTypeInput = document.getElementById("user_type");

  // Set the user type based on the signup title
  
  if (signupTitle.innerText === "Company Signup") {
    userTypeInput.value = "company";
    signupForm.action = "signup.do"; // Base URL
  } else {
    userTypeInput.value = "candidate";
    signupForm.action = "signup.do"; // Base URL
  }

  console.log("Form action:", signupForm.action);
  console.log("User type:", userTypeInput.value);

  // Submit the form
  signupForm.submit();
});


  user_card_box.addEventListener("click",(event)=>{
    event.preventDefault();

     const card = event.target.closest(".user_type")

    if(card){

      signup_title.innerText = "" .concat(card.id=='a1'?' Company ':' Candidate ') + " Signup";
      
     }
  }
  )



</script>

</html>
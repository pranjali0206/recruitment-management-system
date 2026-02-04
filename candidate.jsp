<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Candidate Dashboard</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
      rel="stylesheet"
    />
    <style>
      
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: "Poppins", sans-serif;
      }

      body {
        background: linear-gradient(135deg, #e0eafc, #cfdef3);
        min-height: 100vh;
        overflow-x: hidden;
      }

      /* Sidebar */
      .sidebar {
        position: fixed;
        top: 0;
        left: 0;
        width: 250px;
        height: 100%;
        background: linear-gradient(180deg, #007bff, #00d4ff);
        padding: 20px;
        box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s ease;
        z-index: 1000;
      }

      .sidebar.hidden {
        transform: translateX(-250px);
      }

      .sidebar .logo {
        display: flex;
        align-items: center;
        margin-bottom: 30px;
      }

      .sidebar .logo img {
        width: 40px;
        border-radius: 8px;
        margin-right: 10px;
      }

      .sidebar .logo span {
        color: white;
        font-size: 1.5rem;
        font-weight: 600;
      }

      .sidebar .nav-link {
        display: flex;
        align-items: center;
        color: white;
        padding: 10px 15px;
        margin-bottom: 10px;
        border-radius: 8px;
        transition: background 0.3s, transform 0.2s;
        text-decoration: none;
      }

      .sidebar .nav-link:hover {
        background: rgba(255, 255, 255, 0.2);
        transform: translateX(5px);
      }

      .sidebar .nav-link .material-icons {
        margin-right: 10px;
      }

      .sidebar .signout-btn {
        position: absolute;
        bottom: 20px;
        width: calc(100% - 40px);
        background: #dc3545;
        color: white;
        padding: 10px;
        border-radius: 8px;
        text-align: center;
        text-decoration: none;
        transition: background 0.3s;
      }

      .sidebar .signout-btn:hover {
        background: #c82333;
      }

      /* Main Content */
      .main-content {
        margin-left: 250px;
        padding: 20px;
        transition: margin-left 0.3s ease;
      }

      .main-content.full {
        margin-left: 0;
      }

      /* Hero Section */
      .hero-section {
        background: white;
        border-radius: 15px;
        padding: 30px;
        margin-bottom: 30px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        text-align: center;
      }

      .hero-section h1 {
        font-size: 2.5rem;
        color: #333;
        margin-bottom: 10px;
      }

      .hero-section p {
        font-size: 1.1rem;
        color: #666;
      }

      /* Job Grid */
      .job-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
        gap: 20px;
      }

      .job-card {
        background: white;
        border-radius: 10px;
        padding: 20px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        position: relative;
        overflow: hidden;
      }

      .job-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
      }

      .job-card h4 {
        font-size: 1.3rem;
        color: #007bff;
        margin-bottom: 10px;
      }

      .job-card p {
        font-size: 0.95rem;
        color: #555;
        margin-bottom: 15px;
      }

      .job-card .card-footer {
        display: flex;
        justify-content: flex-end;
      }

      .job-card .action-btn {
        background: #007bff;
        color: white;
        border: none;
        padding: 8px 15px;
        border-radius: 5px;
        cursor: pointer;
        transition: background 0.3s;
      }

      .job-card .action-btn:hover {
        background: #0056b3;
      }

      /* Toggle Button */
      .toggle-sidebar {
        position: fixed;
        top: 20px;
        left: 20px;
        background: #007bff;
        color: white;
        border: none;
        padding: 10px;
        border-radius: 50%;
        cursor: pointer;
        z-index: 1100;
        display: none;
      }

      .job-details p {
        margin-bottom: 0.75rem;
        font-size: 1rem;
        display: flex;
        justify-content: space-between;
        align-items: center;
      }
      .job-details strong {
        color: #343a40;
        font-weight: 600;
        flex: 0 0 30%;
      }
      .job-details span {
        color: #495057;
        flex: 0 0 70%;
        text-align: right;
      }
      .job-details h4 {
        color: #007bff;
        font-weight: 700;
        margin-bottom: 1.5rem;
        text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      }
      .btn-primary {
        background: linear-gradient(90deg, #007bff, #00d4ff);
        border: none;
        transition: transform 0.2s, background 0.3s;
      }
      .btn-primary:hover {
        background: linear-gradient(90deg, #0056b3, #0096cc);
        transform: scale(1.05);
      }
      .btn-secondary {
        background: #6c757d;
        border: none;
        transition: transform 0.2s;
      }
      .btn-secondary:hover {
        background: #5a6268;
        transform: scale(1.05);
      }

      /* Responsive */
      @media (max-width: 768px) {
        .sidebar {
          transform: translateX(-250px);
        }

        .sidebar.active {
          transform: translateX(0);
        }

        .main-content {
          margin-left: 0;
        }

        .toggle-sidebar {
          display: block;
        }

        .job-grid {
          grid-template-columns: 1fr;
        }
      }

      /* Animations */
      .animate__animated {
        animation-duration: 0.8s;
      }

      .modal-content {
        border-radius: 15px;
        box-shadow: 0 8px 30px rgba(0, 0, 0, 0.2);
        background: linear-gradient(135deg, #ffffff, #f8f9fa);
      }
      .modal-header {
        background: linear-gradient(90deg, #007bff, #00d4ff);
        color: white;
        border-top-left-radius: 15px;
        border-top-right-radius: 15px;
        padding: 1.5rem;
      }
      .modal-title {
        font-weight: 700;
        font-size: 1.5rem;
        text-align: center;
        width: 100%;
      }
      .modal-body {
        padding: 2rem;
      }
      .modal-footer {
        background: #f8f9fa;
        border-bottom-left-radius: 15px;
        border-bottom-right-radius: 15px;
        padding: 1rem;
      }
      .form-label {
        font-weight: 600;
        color: #343a40;
      }
      .form-control, .form-select {
        border-radius: 8px;
        border: 1px solid #ced4da;
        transition: border-color 0.3s;
      }
      .form-control:focus, .form-select:focus {
        border-color: #007bff;
        box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
      }
      .btn-primary {
        background: linear-gradient(90deg, #007bff, #00d4ff);
        border: none;
        transition: transform 0.2s, background 0.3s;
      }
      .btn-primary:hover {
        background: linear-gradient(90deg, #0056b3, #0096cc);
        transform: scale(1.05);
      }
      .btn-secondary {
        background: #6c757d;
        border: none;
        transition: transform 0.2s;
      }
      .btn-secondary:hover {
        background: #5a6268;
        transform: scale(1.05);
      }
      .error {
        color: #dc3545;
        font-size: 0.875rem;
        display: none;
        margin-top: 0.25rem;
      }
      .section-divider {
        margin: 1.5rem 0;
        border-top: 2px solid #e0e0e0;
        padding-top: 1rem;
        font-weight: 600;
        color: #007bff;
      }
      .job-card {
        max-width: 400px;
        margin: 20px auto;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
        transition: transform 0.3s;
      }
      .job-card:hover {
        transform: translateY(-5px);
      }
      .animate__fadeInUp {
        animation-duration: 0.5s;
      }
              /* Modal Background Animation */
        .modal-backdrop {
            backdrop-filter: blur(5px);
            background-color: rgba(0, 0, 0, 0.7);
        }

        /* Modal Content Styling */
        .modal-content {
            border: none;
            border-radius: 15px;
            overflow: hidden;
            background: linear-gradient(135deg, #ffffff, #f8f9fa);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            animation: scaleIn 0.5s ease forwards;
        }

        /* Scale Animation for Modal */
        @keyframes scaleIn {
            from {
                transform: scale(0.8);
                opacity: 0;
            }
            to {
                transform: scale(1);
                opacity: 1;
            }
        }

        /* Modal Header */
        .modal-header {
            border: none;
            background: linear-gradient(90deg, #007bff, #00d4ff);
            color: white;
            padding: 20px;
        }

        .modal-title {
            font-weight: 600;
            font-size: 1.5rem;
        }

        /* Close Button */
        .btn-close {
            filter: invert(1);
            transition: transform 0.3s ease;
        }

        .btn-close:hover {
            transform: rotate(90deg);
        }

        /* Modal Body */
        .modal-body {
            padding: 30px;
            text-align: center;
        }

        /* Checkmark Animation */
        .checkmark-circle {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            background: #28a745;
            margin: 0 auto 20px;
            position: relative;
            animation: pulse 2s infinite;
        }

        .checkmark {
            width: 50px;
            height: 25px;
            border-right: 5px solid white;
            border-bottom: 5px solid white;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%) rotate(45deg);
            animation: drawCheck 1s ease forwards;
        }

        @keyframes drawCheck {
            from {
                width: 0;
                height: 0;
            }
            to {
                width: 50px;
                height: 25px;
            }
        }

        @keyframes pulse {
            0% {
                box-shadow: 0 0 0 0 rgba(40, 167, 69, 0.4);
            }
            70% {
                box-shadow: 0 0 0 20px rgba(40, 167, 69, 0);
            }
            100% {
                box-shadow: 0 0 0 0 rgba(40, 167, 69, 0);
            }
        }

        /* Text Animation */
        .success-text {
            font-size: 1.8rem;
            font-weight: 700;
            color: #333;
            animation: fadeInUp 1s ease forwards;
        }

        .sub-text {
            font-size: 1rem;
            color: #666;
            margin-top: 10px;
            animation: fadeInUp 1.2s ease forwards;
        }

        @keyframes fadeInUp {
            from {
                transform: translateY(20px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        /* Button Animation */
        .btn-continue {
            background: linear-gradient(90deg, #007bff, #00d4ff);
            border: none;
            padding: 10px 30px;
            font-weight: 600;
            color: white;
            border-radius: 25px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            margin-top: 20px;
        }

        .btn-continue:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 123, 255, 0.4);
        }

        /* Confetti Animation */
        .confetti {
            position: absolute;
            width: 10px;
            height: 10px;
            background: #f39c12;
            top: -10px;
            left: 50%;
            animation: confettiFall 3s ease infinite;
        }

        .confetti:nth-child(2) { background: #e74c3c; animation-delay: 0.2s; left: 40%; }
        .confetti:nth-child(3) { background: #3498db; animation-delay: 0.4s; left: 60%; }
        .confetti:nth-child(4) { background: #2ecc71; animation-delay: 0.6s; left: 30%; }
        .confetti:nth-child(5) { background: #9b59b6; animation-delay: 0.8s; left: 70%; }

        @keyframes confettiFall {
            0% {
                transform: translateY(0) rotate(0deg);
                opacity: 1;
            }
            100% {
                transform: translateY(100vh) rotate(360deg);
                opacity: 0;
            }
        }

        
        .footer {
            background: linear-gradient(90deg, #1a3c6d, #2b4e8c);
            color: white;
            padding: 30px 0;
            border-top: 4px solid #00ddeb;
            animation: fadeInUp 0.8s ease-out;
        }

        .footer a {
            color: #00ddeb;
            font-weight: 500;
            margin: 0 10px;
            transition: color 0.3s ease, transform 0.3s ease;
        }

        .footer a:hover {
            color: white;
            transform: translateY(-2px);
        }

        @keyframes slideUp {
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        @keyframes pulse {
            0% {
                transform: scale(1);
            }

            50% {
                transform: scale(1.05);
            }

            100% {
                transform: scale(1);
            }
        }


    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
  </head>
  <body>
    <!-- Sidebar -->
    <div class="sidebar" id="sidebar">
      <div class="logo">
        <img src="Static/media/candidate.jpg" alt="Candidate Logo" />
        <span>Candidate Portal</span>
      </div>
      <c:choose>
        <c:when test="${not empty sessionScope.candidate}">
          <a
            class="nav-link animate__animated animate__fadeInLeft"
            href="candidate.jsp"
          >
            <span class="material-icons">dashboard</span> Dashboard
          </a>
          <a
            class="nav-link animate__animated animate__fadeInLeft"
            href="jobs.jsp"
          >
            <span class="material-icons">work</span> Jobs
          </a>
          <a
            class="nav-link animate__animated animate__fadeInLeft"
            href="Help.jsp"
          >
            <span class="material-icons">help</span> Help
          </a>
          <a
            class="nav-link animate__animated animate__fadeInLeft"
            href="messages.jsp"
          >
            <span class="material-icons">message</span> Messages
          </a>
          <a
            class="nav-link animate__animated animate__fadeInLeft"
            href="candidateProfile.jsp"
          >
            <span class="material-icons">person</span> Profile
          </a>
          <a
            href="logout.do"
            class="signout-btn animate__animated animate__fadeInUp"
          >
            <span class="material-icons">logout</span> Sign Out
          </a>
        </c:when>
        <c:otherwise>
          <a
            class="nav-link animate__animated animate__fadeInLeft"
            href="home.jsp"
          >
            <span class="material-icons">login</span> Sign In
          </a>
        </c:otherwise>
      </c:choose>
    </div>

    <!-- Toggle Sidebar Button -->
    <button class="toggle-sidebar" id="toggleSidebar">
      <span class="material-icons">menu</span>
    </button>

    <!-- Main Content -->
    <div class="main-content" id="mainContent">
      <!-- Hero Section -->
      <div class="hero-section animate__animated animate__fadeIn">
        <h1>
          Welcome,
          <c:out value="${sessionScope.candidate.name}" default="Candidate" />!
        </h1>
        <p>Explore exciting job opportunities tailored for you.</p>
      </div>

      <!-- Alerts -->
      <c:if test="${not empty sessionScope.error}">
        <div class="alert alert-danger animate__animated animate__shakeX">
          <c:out value="${sessionScope.error}" />
          <c:remove var="error" scope="session" />
        </div>
      </c:if>
      <c:if test="${not empty sessionScope.success}">
        <div class="alert alert-success animate__animated animate__bounceIn">
          <c:out value="${sessionScope.success}" />
          <c:remove var="success" scope="session" />
        </div>
      </c:if>

      <!-- Job Grid -->
      <h3 class="mb-4 animate__animated animate__fadeInDown">Available Jobs</h3>
      <div class="job-grid" id="all_jobs">
        <p class="text-muted animate__animated animate__fadeIn">
          Loading jobs...
        </p>
      </div>
    </div>

    <!-- Job Details Modal -->
    <div class="modal fade" id="jobDetailsModal" tabindex="-1" aria-labelledby="jobDetailsModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg animate__animated animate__bounceIn">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="jobDetailsModalLabel">Job Details</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <div class="job-details">
              <h4 id="modalJobTitle" class="text-center animate__animated animate__fadeInUp"></h4>
              <p class="animate__animated animate__fadeInUp" style="animation-delay: 0.1s;">
                <strong>Company:</strong> <span id="modalCompany"></span>
              </p>
              <p class="animate__animated animate__fadeInUp" style="animation-delay: 0.2s;">
                <strong>Salary:</strong> <span id="modalSalary" class="text-center"></span>
              </p>
              <p class="animate__animated animate__fadeInUp" style="animation-delay: 0.3s;">
                <strong>Location:</strong> <span id="modalLocation" class="text-center"></span>
              </p>
              <p class="animate__animated animate__fadeInUp" style="animation-delay: 0.4s;">
                <strong>Description:</strong> <span id="modalDescription" class="text-center"></span>
              </p>
              <p class="animate__animated animate__fadeInUp" style="animation-delay: 0.5s;">
                <strong>Job Type:</strong> <span id="modalJobType" class="text-center"></span>
              </p>
              <p class="animate__animated animate__fadeInUp" style="animation-delay: 0.6s;">
                <strong>Posted:</strong> <span id="modalPostDate" class="text-center"></span>
              </p>
              <p class="animate__animated animate__fadeInUp" style="animation-delay: 0.7s;">
                <strong>Deadline:</strong> <span id="modalDeadline" class="text-center"></span>
              </p>
              <p class="animate__animated animate__fadeInUp" style="animation-delay: 0.8s;">
                <strong>Skills Required:</strong> <span id="modalSkills" class="text-center"></span>
              </p>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button id="applyJobBtn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#candidate_detail">Apply Now</button>
          </div>
        </div>
      </div>
    </div>

    <!-- Candidate Application Form Modal -->
    <div class="modal fade" id="candidate_detail" tabindex="-1" aria-labelledby="candidateDetailLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg animate__animated animate__bounceIn">

        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="candidateDetailLabel">Candidate Application Form</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>

          <div class="modal-body">
            <form id="candidateForm" action="applicantDetail.do"  enctype="multipart/form-data" method="post">

              <input type="hidden" id="jobPostId" name="jobPostId" value="">
              <input type="hidden" id="candidateId" name="candidateId" value="${sessionScope.candidateId}">
              <input type="hidden" id="jobTitle" name="jobTitle" value="">

              
              <!-- Personal Information -->
              <h6 class="section-divider animate__animated animate__fadeInUp">Personal Information</h6>
              <div class="row">
                <div class="col-md-6 mb-3 animate__animated animate__fadeInUp" style="animation-delay: 0.1s;">
                  <label for="fullName" class="form-label">Full Name <span class="text-danger">*</span></label>
                  <input type="text" value="${candidate.name}" class="form-control" id="fullName" name="fullName" required>
                  <div class="error" id="fullNameError">Please enter your full name.</div>
                </div>
                <div class="col-md-6 mb-3 animate__animated animate__fadeInUp" style="animation-delay: 0.2s;">
                  <label for="email" class="form-label">Email <span class="text-danger">*</span></label>
                  <input type="email" value="${candidate.email}" class="form-control" id="email" name="email" required>
                  <div class="error" id="emailError">Please enter a valid email address.</div>
                </div>
              </div>
              <div class="mb-3 animate__animated animate__fadeInUp" style="animation-delay: 0.3s;">
                <label for="phone" class="form-label">Phone Number <span class="text-danger">*</span></label>
                <input type="tel" value="${candidate.contact}" class="form-control" id="phone" name="phone" required>
                <div class="error" id="phoneError">Please enter a valid phone number (10 digits).</div>
              </div>
              <!-- Qualifications -->
              <h6 class="section-divider animate__animated animate__fadeInUp" style="animation-delay: 0.4s;">Qualifications</h6>
              <div class="row">
                <div class="col-md-6 mb-3 animate__animated animate__fadeInUp" style="animation-delay: 0.5s;">
                  <label for="jobQualifications" class="form-label">Highest Degree <span class="text-danger">*</span></label>
                  <select class="form-control select2" id="jobQualifications" name="qualifications[]" multiple required>
                    <c:forEach var="qual" items="${applicationScope.qualifications}">
                      <option value="${qual.qualificationId}">
                        <c:out value="${qual.name}" />
                      </option>
                    </c:forEach>
                  </select>
                  <div class="error" id="highestDegreeError">Please select your highest degree.</div>
                </div>
                <div class="col-md-6 mb-3 animate__animated animate__fadeInUp" style="animation-delay: 0.6s;">
                  <label for="fieldOfStudy" class="form-label">Field of Study <span class="text-danger">*</span></label>
                  <input type="text" class="form-control" id="fieldOfStudy" name="fieldOfStudy" placeholder="e.g., Computer Science" required>
                  <div class="error" id="fieldOfStudyError">Please enter your field of study.</div>
                </div>
              </div>
              <div class="mb-3 animate__animated animate__fadeInUp" style="animation-delay: 0.7s;">
                <label for="institution" class="form-label">Institution <span class="text-danger">*</span></label>
                <input type="text" class="form-control" id="institution" name="institution" placeholder="e.g., XYZ University" required>
                <div class="error" id="institutionError">Please enter the institution name.</div>
              </div>
              <div class="mb-3 animate__animated animate__fadeInUp" style="animation-delay: 0.7s;">
                <label for="year_of_passing" class="form-label">Year of Passing <span class="text-danger">*</span></label>
                <input type="date" class="form-control" id="year_of_passing" name="year_of_passing" required>
                <div class="error" id="yearOfPassingError">Please enter the year of passing.</div>
              </div>
              <!-- Work Experience -->
              <h6 class="section-divider animate__animated animate__fadeInUp" style="animation-delay: 0.8s;">Work Experience</h6>
              <div class="row">
                <div class="col-md-6 mb-3 animate__animated animate__fadeInUp" style="animation-delay: 0.9s;">
                  <label for="recentJobTitle" class="form-label">Most Recent Job Title</label>
                  <input type="text" class="form-control" id="recentJobTitle" name="recentJobTitle" placeholder="e.g., Software Engineer">
                  <div class="error" id="recentJobTitleError">Please enter your job title.</div>
                </div>
                <div class="col-md-6 mb-3 animate__animated animate__fadeInUp" style="animation-delay: 1s;">
                  <label for="recentCompany" class="form-label">Company Name</label>
                  <input type="text" class="form-control" id="recentCompany" name="recentCompany" placeholder="e.g., Acme Corp">
                  <div class="error" id="recentCompanyError">Please enter the company name.</div>
                </div>
              </div>
              <div class="mb-3 animate__animated animate__fadeInUp" style="animation-delay: 1.1s;">
                <label for="workDuration" class="form-label">Duration</label>
                <input type="text" class="form-control" id="workDuration" name="workDuration" placeholder="e.g., Jan 2020 - Dec 2022">
                <div class="error" id="workDurationError">Please enter the duration.</div>
              </div>
              <!-- Additional Details -->
              <h6 class="section-divider animate__animated animate__fadeInUp" style="animation-delay: 1.2s;">Additional Details</h6>
              <div class="mb-3 animate__animated animate__fadeInUp" style="animation-delay: 1.3s;">
                <label for="resume" class="form-label">Resume (PDF) <span class="text-danger">*</span></label>
                <input type="file" class="form-control" id="resume" name="resume" accept=".pdf" required>
                <div class="error" id="resumeError">Please upload a PDF resume.</div>
              </div>
              <div class="mb-3 animate__animated animate__fadeInUp" style="animation-delay: 1.4s;">
                <label for="coverLetter" class="form-label">Cover Letter</label>
                <textarea class="form-control" id="coverLetter" name="coverLetter" rows="4"></textarea>
              </div>
              <div class="mb-3 animate__animated animate__fadeInUp" style="animation-delay: 1.5s;">
                <label for="linkedin" class="form-label">LinkedIn Profile</label>
                <input type="url" class="form-control" id="linkedin" name="linkedin" placeholder="e.g., https://linkedin.com/in/yourprofile">
                <div class="error" id="linkedinError">Please enter a valid LinkedIn URL.</div>
              </div>
              <div class="mb-3 animate__animated animate__fadeInUp" style="animation-delay: 1.6s;">
                <label for="portfolio" class="form-label">Portfolio/Website</label>
                <input type="url" class="form-control" id="portfolio" name="portfolio" placeholder="e.g., https://yourportfolio.com">
                <div class="error" id="portfolioError">Please enter a valid URL.</div>
              </div>
              <div class="mb-3 animate__animated animate__fadeInUp" style="animation-delay: 1.7s;">
                <label for="jobSkills" class="form-label">Key Skills <span class="text-danger">*</span></label>
                <select class="form-control select2" id="jobSkills" name="skills[]" placeholder="Select Skills" multiple required>
                  <c:forEach var="skill" items="${applicationScope.skills}">
                    <option value="${skill.skillId}">
                      <c:out value="${skill.name}" />
                    </option>
                  </c:forEach>
                </select>
                <div class="error" id="skillsError">Please list your key skills.</div>
              </div>
              <div class="mb-3 animate__animated animate__fadeInUp" style="animation-delay: 1.8s;">
                <label for="experience" class="form-label">Years of Experience <span class="text-danger">*</span></label>
                <select class="form-select" id="experience" name="experience" required>
                  <option value="" disabled selected>Select experience level</option>
                  <option value="0-1">0-1 years</option>
                  <option value="1-3">1-3 years</option>
                  <option value="3-5">3-5 years</option>
                  <option value="5+">5+ years</option>
                </select>
                <div class="error" id="experienceError">Please select your experience level.</div>
              </div>
              <div class="mb-3 animate__animated animate__fadeInUp" style="animation-delay: 1.9s;">
                <label for="availability" class="form-label">Availability <span class="text-danger">*</span></label>
                <select class="form-select" id="availability" name="availability" required>
                  <option value="" disabled selected>Select availability</option>
                  <option value="Immediate">Immediate</option>
                  <option value="1-2 Weeks">1-2 Weeks</option>
                  <option value="1 Month">1 Month</option>
                  <option value="More than 1 Month">More than 1 Month</option>
                </select>
                <div class="error" id="availabilityError">Please select your availability.</div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <input type="button" id="submit_application" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#applicationSubbmitedModal" value="Submit Application">
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>



    <!-- Modal -->
    <div class="modal fade" id="applicationSubbmitedModal" tabindex="-1" aria-labelledby="applicationModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="applicationModalLabel">Application Submitted</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- Confetti Elements -->
                    <div class="confetti"></div>
                    <div class="confetti"></div>
                    <div class="confetti"></div>
                    <div class="confetti"></div>
                    <div class="confetti"></div>
                    <!-- Checkmark Animation -->
                    <div class="checkmark-circle">
                        <div class="checkmark"></div>
                    </div>
                    <!-- Success Message -->
                    <div class="success-text">Application Submitted!</div>
                    <div class="sub-text">
                        Thank you for applying. We'll review your application and get back to you soon.
                    </div>
                    <!-- Continue Button -->
                    <button class="btn btn-continue" data-bs-dismiss="modal">Continue</button>
                </div>
            </div>
        </div>
    </div>

     <div class="container-fluid text-center mt-5 mb-3 footer">
            <footer>
                <p>© 2025 Recruitment Management System. All rights reserved.</p>
                <p>Follow us on:
                    <a href="#" class="text-decoration-none">Facebook</a> |
                    <a href="#" class="text-decoration-none">Twitter</a> |
                    <a href="#" class="text-decoration-none">LinkedIn</a>
                </p>
            </footer>
        </div>

    <script>
      // Toggle Sidebar
      const sidebar = document.getElementById("sidebar");
      const mainContent = document.getElementById("mainContent");
      const toggleSidebarBtn = document.getElementById("toggleSidebar");
      const submitApplicationBtn = document.getElementById("submit_application");

      toggleSidebarBtn.addEventListener("click", () => {
        sidebar.classList.toggle("active");
        mainContent.classList.toggle("full");
      });

      // Initialize Select2
      $(document).ready(function () {
        $('#jobSkills').select2({
          placeholder: "Select skills...",
          allowClear: true,
          width: '100%',
          closeOnSelect: false,
          templateResult: function (data) {
            if (!data.id) return data.text;
            return $('<span><input type="checkbox" ' + (data.selected ? 'checked' : '') + '> ' + data.text + '</span>');
          }
        });

        $('#jobQualifications').select2({
          placeholder: "Select qualifications...",
          allowClear: true,
          width: '100%',
          closeOnSelect: false,
          templateResult: function (data) {
            if (!data.id) return data.text;
            return $('<span><input type="checkbox" ' + (data.selected ? 'checked' : '') + '> ' + data.text + '</span>');
          }
        });
      });

      // Function to get company name by ID
      const getCompanyNameById = async (companyId) => {
        try {
          const response = await fetch("getCompanyName.do?companyId=" + companyId);
          if (response.ok) {
            const data = await response.json();
            console.log("##Company Name:", data);
            return data.companyName || "N/A";
          } else {
            throw new Error("Failed to fetch company name");
          }
        } catch (error) {
          console.error("Error fetching company name:", error);
          return "N/A";
        }
      };

      // Fetch Jobs
      const all_jobs = document.getElementById("all_jobs");

      const collectAllJobs = async () => {
        try {
          const response = await fetch("collectalljobs.do");
          if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
          }
          const data = await response.json();
          console.log("Fetched jobs:", data);
          return data;
        } catch (error) {
          console.error("Error fetching jobs:", error);
          return [];
        }
      };

      const showAllJobs = async () => {
        collectAllJobs().then((data) => {
          if (Array.isArray(data) && data.length > 0) {
            console.log("candidate Id:", document.getElementById("candidateId").value);
            all_jobs.innerHTML = "";
            console.log("Jobs data:", data);

            data.forEach((job, index) => {
              //set in seesion scope jobPostId and jobTitle
                // Store jobPostId and jobTitle in variables for use in the modal
                const jobCard = document.createElement("div");
                jobCard.dataset.jobPostId = job.jobPostId;
                jobCard.dataset.jobTitle = job.jobTitle;
              
              getCompanyNameById(job.company.companyId).then((companyName) => {
                console.log("Company Name:", companyName);
              
                jobCard.className = "job-card animate__animated animate__fadeIn";
                jobCard.innerHTML = `
                  <h4>` + job.jobTitle +`</h4>
                  <p><strong>Company:</strong> `+ companyName +`</p>
                  <p><strong>Salary:</strong> `+ job.salary +`</p>
                  <p><strong>Location:</strong> `+ job.jobLocation +`</p>
                  <p><strong>Job Type:</strong> `+ job.jobType +`</p>
                  
                  <p><strong>JobPostId</strong>`+ job.jobPostId +`</p>
                  
                  <div class="card-footer">
                    <button class="action-btn btn btn-primary mx-auto" data-bs-toggle="modal" data-bs-target="#jobDetailsModal">View Details</button>
                  </div>
                `;
                all_jobs.appendChild(jobCard);

                const jobDetailsBtn = jobCard.querySelector(".action-btn");
                jobDetailsBtn.addEventListener("click", () => {
                  const modalJobTitle = document.getElementById("modalJobTitle");
                  const modalCompany = document.getElementById("modalCompany");
                  const modalSalary = document.getElementById("modalSalary");
                  const modalLocation = document.getElementById("modalLocation");
                  const modalDescription = document.getElementById("modalDescription");
                  const modalJobType = document.getElementById("modalJobType");
                  const modalPostDate = document.getElementById("modalPostDate");
                  const modalDeadline = document.getElementById("modalDeadline");
                  const modalSkills = document.getElementById("modalSkills");

                  modalJobTitle.innerText = job.jobTitle;
                  modalCompany.innerText = companyName;
                  modalSalary.innerText = job.salary;
                  modalLocation.innerText = job.jobLocation;
                  modalDescription.innerText = job.description;
                  modalJobType.innerText = job.jobType;
                  modalPostDate.innerText = job.postDate;
                  modalDeadline.innerText = job.deadline;
                  modalSkills.innerText = job.skills;

                  // Set jobId and jobTitle for the application form
                 document.getElementById("jobPostId").value = job.jobPostId || "";
                 document.getElementById("jobTitle").value = job.jobTitle || "";

                 

                });
              });
            });
          } else {
            all_jobs.innerHTML = '<p class="text-muted animate__animated animate__fadeIn">No jobs found.</p>';
          }
        });
      };

      // Initialize Jobs
      showAllJobs();

      // Initialize Tooltips
      const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
      const tooltipList = [...tooltipTriggerList].map(
        (tooltipTriggerEl) => new bootstrap.Tooltip(tooltipTriggerEl)
      );


      //handle submit application
   // Handle submit application
      submitApplicationBtn.addEventListener("click", (event) => {
        event.preventDefault();
        const form = document.getElementById("candidateForm");
        const formData = new FormData(form);
        const jobPostId = document.getElementById("jobPostId").value;
        // const candidateId = document.getElementById("candidateId").value;
        const jobTitle = document.getElementById("jobTitle").value;

        formData.append("jobPostId", jobPostId);
        // formData.append("candidateId", candidateId);
        formData.append("jobTitle", jobTitle);

        for (let pair of formData.entries()) {
          console.log(pair[0] + ': ' + pair[1]);
        }

        // Submit the form using Fetch
        fetch("applicantDetail.do", {
          method: "POST",
          body: formData
        })
          .then(response => {
            if (!response.ok) {
              throw new Error(`HTTP error! Status: ${response.status}`);
            }
            return response.json();
          })
          .then(data => {
            console.log("Response:", data);
            if (data.success) {
              alert("Application submitted successfully!");
              // $('#candidate_detail').modal('hide');
              form.reset();
            } else {
              // alert("Error submitting application: " + (data.error || "Unknown error"));
            }
          })
          .catch(error => {
            console.error("Error:", error);
            // alert("An error occurred while submitting the application.");
          });
      });
        
       
      //   // Validate form fields if error set style.bordercolour as red 


      //   let isValid = true;
      //   const fullName = document.getElementById("fullName");
      //   const email = document.getElementById("email");
      //   const phone = document.getElementById("phone"); 
      //   const jobQualifications = document.getElementById("jobQualifications"); 
      //   const fieldOfStudy = document.getElementById("fieldOfStudy");
      //   const institution = document.getElementById("institution");
      //   const year_of_passing = document.getElementById("year_of_passing");
      //   const resume = document.getElementById("resume");
      //   const jobSkills = document.getElementById("jobSkills");
      //   const recentJobTitle = document.getElementById("recentJobTitle");
      //   const recentCompany = document.getElementById("recentCompany");
      //   const workDuration = document.getElementById("workDuration");
      //   const linkedin = document.getElementById("linkedin");
      //   const portfolio = document.getElementById("portfolio");
      //   const experience = document.getElementById("experience");
      //   const availability = document.getElementById("availability");
      //   const errors = {
      //     fullName: document.getElementById("fullNameError"),
      //     email: document.getElementById("emailError"),
      //     phone: document.getElementById("phoneError"),
      //     jobQualifications: document.getElementById("highestDegreeError"),
      //     fieldOfStudy: document.getElementById("fieldOfStudyError"),
      //     institution: document.getElementById("institutionError"),
      //     year_of_passing: document.getElementById("yearOfPassingError"),
      //     resume: document.getElementById("resumeError"),
      //     jobSkills: document.getElementById("skillsError"),
      //     recentJobTitle: document.getElementById("recentJobTitleError"),
      //     recentCompany: document.getElementById("recentCompanyError"),
      //     workDuration: document.getElementById("workDurationError"),
      //     linkedin: document.getElementById("linkedinError"),
      //     portfolio: document.getElementById("portfolioError"),
      //     experience: document.getElementById("experienceError"),
      //     availability: document.getElementById("availabilityError")
      //   };
      //   // Reset error messages
      //   Object.values(errors).forEach((error) => {
      //     error.style.display = "none";
      //   });
      //   // Validate Full Name
      //   if (!fullName.value.trim()) {
      //     errors.fullName.style.display = "block";
      //     fullName.style.borderColor = "red";
      //     isValid = false;
      //   } else {
      //     fullName.style.borderColor = "";
      //   }
      //   // Validate Email
      //   const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      //   if (!email.value.trim() || !emailPattern.test(email.value)) {
      //     errors.email.style.display = "block";
      //     email.style.borderColor = "red";
      //     isValid = false;
      //   } else {
      //     email.style.borderColor = "";
      //   }
      //   // Validate Phone
      //   const phonePattern = /^\d{10}$/;
      //   if (!phone.value.trim() || !phonePattern.test(phone.value)) {
      //     errors.phone.style.display = "block";
      //     phone.style.borderColor = "red";
      //     isValid = false;
      //   } else {
      //     phone.style.borderColor = "";
      //   }
      //   // Validate Job Qualifications
      //   if (jobQualifications.value.length === 0) {
      //     errors.jobQualifications.style.display = "block";
      //     jobQualifications.style.borderColor = "red";
      //     isValid = false;
      //   } else {
      //     jobQualifications.style.borderColor = "";
      //   }
      //   // Validate Field of Study
      //   if (!fieldOfStudy.value.trim()) {
      //     errors.fieldOfStudy.style.display = "block";
      //     fieldOfStudy.style.borderColor = "red";
      //     isValid = false;
      //   } else {
      //     fieldOfStudy.style.borderColor = "";
      //   }
      //   // Validate Institution
      //   if (!institution.value.trim()) {
      //     errors.institution.style.display = "block";
      //     institution.style.borderColor = "red";
      //     isValid = false;
      //   } else {
      //     institution.style.borderColor = "";
      //   }
      //   // Validate Year of Passing
      //   if (!year_of_passing.value.trim()) {
      //     errors.year_of_passing.style.display = "block";
      //     year_of_passing.style.borderColor = "red";
      //     isValid = false;
      //   } else {
      //     year_of_passing.style.borderColor = "";
      //   }
      //   // Validate Resume
      //   if (!resume.files.length || resume.files[0].type !== "application/pdf") {
      //     errors.resume.style.display = "block";
      //     resume.style.borderColor = "red";
      //     isValid = false;
      //   } else {
      //     resume.style.borderColor = "";
      //   }
      //   // Validate Job Skills
      //   if (jobSkills.value.length === 0) {
      //     errors.jobSkills.style.display = "block";
      //     jobSkills.style.borderColor = "red";
      //     isValid = false;
      //   } else {
      //     jobSkills.style.borderColor = "";
      //   }
      //   // Validate Recent Job Title
      //   if (recentJobTitle.value.trim() && recentJobTitle.value.length < 3) {
      //     errors.recentJobTitle.style.display = "block";
      //     recentJobTitle.style.borderColor = "red";
      //     isValid = false;
      //   } else {
      //     recentJobTitle.style.borderColor = "";
      //   }
      //   // Validate Recent Company
      //   if (recentCompany.value.trim() && recentCompany.value.length < 3) {
      //     errors.recentCompany.style.display = "block";
      //     recentCompany.style.borderColor = "red";
      //     isValid = false;
      //   } else {
      //     recentCompany.style.borderColor = "";
      //   }
      //   // Validate Work Duration
      //   if (workDuration.value.trim() && workDuration.value.length < 3) {
      //     errors.workDuration.style.display = "block";
      //     workDuration.style.borderColor = "red";
      //     isValid = false;
      //   } else {
      //     workDuration.style.borderColor = "";
      //   }
      //   // Validate LinkedIn
      //   if (linkedin.value.trim() && !/^https?:\/\/(www\.)?linkedin\.com\/in\/[a-zA-Z0-9_-]+$/.test(linkedin.value)) {
      //     errors.linkedin.style.display = "block";
      //     linkedin.style.borderColor = "red";
      //     isValid = false;
      //   } else {
      //     linkedin.style.borderColor = "";
      //   }
      //   // Validate Portfolio
      //   if (portfolio.value.trim() && !/^https?:\/\/[^\s/$.?#].[^\s]*$/.test(portfolio.value)) {
      //     errors.portfolio.style.display = "block";
      //     portfolio.style.borderColor = "red";
      //     isValid = false;
      //   } else {
      //     portfolio.style.borderColor = "";
      //   }
      //   // Validate Experience
      //   if (!experience.value) {
      //     errors.experience.style.display = "block";
      //     experience.style.borderColor = "red";
      //     isValid = false;
      //   } else {
      //     experience.style.borderColor = "";
      //   }
      //   // Validate Availability
      //   if (!availability.value) {
      //     errors.availability.style.display = "block";
      //     availability.style.borderColor = "red";
      //     isValid = false;
      //   } else {
      //     availability.style.borderColor = "";
      //   }
      //   // If form is valid, submit the form
      //   if (isValid) {
      //     console.log("Form is valid. Submitting...");
      //     fetch("applicantDetail.do", {
      //       method: "POST",
      //       body: formData
      //     })
      //     .then(response => response.json())
      //     .then(data => {
      //       console.log("Response:", data);
      //       if (data.success) {
      //         alert("Application submitted successfully!");
      //         $('#candidate_detail').modal('hide');
      //         form.reset();
      //       } else {
      //         alert("Error submitting application: " + data.error);
      //       }
      //     })
      //     .catch(error => {
      //       console.error("Error:", error);
      //       alert("An error occurred while submitting the application.");
      //     });
      //   } else {
      //     console.log("Form is invalid. Please fix the errors.");
      //   }
      // });








    </script>
  </body>
</html>
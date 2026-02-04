<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Recruitment Management System</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet">
    </head>
    <style>
        body {
            background: linear-gradient(135deg, #dfebf8 0%, #e6f0fa 100%);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            overflow-x: hidden;
        }

        .container {
            margin-top: 80px;
            text-align: center;
        }

        #company_navbar {
            background: linear-gradient(90deg, #007bff, #00d4ff);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            position: sticky;
            top: 0;
            z-index: 1000;
            animation: slideInDown 0.5s ease-out;
        }

        #navbar-brand img {
            height: 45px;
            border-radius: 8px;
            transition: transform 0.3s ease;
        }

        #navbar-brand img:hover {
            transform: scale(1.1);
        }

        #navbar-nav .nav-link {
            color: white !important;
            font-weight: 600;
            margin-right: 20px;
            position: relative;
            transition: color 0.3s ease;
        }

        #navbar-nav .nav-link::after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            bottom: 0;
            left: 0;
            background-color: #fff;
            transition: width 0.3s ease;
        }

        #navbar-nav .nav-link:hover::after {
            width: 100%;
        }

        .signout-btn {
            background: linear-gradient(45deg, #dc3545, #ff6b6b);
            border: none;
            padding: 10px 20px;
            border-radius: 25px;
            font-weight: 600;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .signout-btn:hover {
            background: linear-gradient(45deg, #c82333, #e63946);
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
        }

        .navbar-toggler {
            border-color: rgba(255, 255, 255, 0.8);
        }

        .navbar-toggler-icon {
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 30 30'%3e%3cpath stroke='rgba(255, 255, 255, 0.8)' stroke-linecap='round' stroke-miterlimit='10' stroke-width='2' d='M4 7h22M4 15h22M4 23h22'/%3e%3c/svg%3e");
        }

        .job-card {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.15);
            transition: transform 0.4s ease, box-shadow 0.4s ease, background 0.4s ease;
            opacity: 0;
            transform: translateY(30px);
            animation: slideUp 0.6s ease-out forwards;
        }

        .job-card:nth-child(1) {
            animation-delay: 0.1s;
        }

        .job-card:nth-child(2) {
            animation-delay: 0.2s;
        }

        .job-card:nth-child(3) {
            animation-delay: 0.3s;
        }

        .job-card:nth-child(4) {
            animation-delay: 0.4s;
        }

        .job-card:hover {
            transform: translateY(-10px) rotateY(5deg);
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.25);
            background: rgba(255, 255, 255, 1);
        }

        .job-title {
            background: linear-gradient(45deg, #007bff, #00d4ff);
            color: white;
            padding: 15px;
            border-radius: 10px 10px 0 0;
            font-weight: 700;
            transition: transform 0.3s ease;
        }

        .job-card:hover .job-title {
            transform: scale(1.02);
        }

        .job-detail .job-info {
            transition: background 0.3s ease;
        }

        .job-detail .job-info:hover {
            background: rgba(0, 123, 255, 0.05);
        }

        .add-job-btn {
            background: linear-gradient(45deg, #28a745, #51cf66);
            color: white;
            padding: 12px 30px;
            border-radius: 50px;
            font-size: 1.2rem;
            font-weight: 600;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            animation: pulse 2s infinite;
        }

        .add-job-btn:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.3);
        }

        .modal-content {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(12px);
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            animation: zoomIn 0.4s ease-in-out;
        }

        .modal-header {
            background: linear-gradient(45deg, #007bff, #00d4ff);
            color: white;
            border-radius: 20px 20px 0 0;
        }

        .badge-active {
            background: linear-gradient(45deg, #28a745, #51cf66);
            padding: 6px 12px;
            border-radius: 12px;
        }

        .badge-closed {
            background: linear-gradient(45deg, #dc3545, #ff6b6b);
            padding: 6px 12px;
            border-radius: 12px;
        }

        .select2-container {
            width: 100% !important;
        }

        .select2-selection--multiple,
        .select2-selection--single {
            border: 1px solid #ced4da !important;
            border-radius: 8px !important;
            min-height: 40px !important;
            transition: border-color 0.3s ease;
        }

        .select2-selection--multiple:hover,
        .select2-selection--single:hover {
            border-color: #007bff !important;
        }

        .select2-selection__rendered {
            display: none !important;
        }

        .tag-container {
            margin-top: 10px;
            min-height: 40px;
            border: 1px solid #ced4da;
            border-radius: 8px;
            padding: 8px;
            background: rgba(255, 255, 255, 0.8);
        }

        .tag {
            background: linear-gradient(45deg, #007bff, #00d4ff);
            color: white;
            padding: 6px 10px;
            margin: 4px;
            border-radius: 6px;
            font-size: 14px;
            transition: transform 0.3s ease;
        }

        .tag:hover {
            transform: scale(1.1);
        }

        .tag .remove-tag {
            margin-left: 8px;
            cursor: pointer;
            font-weight: bold;
        }

        .select2-results__option {
            padding: 8px 14px;
            transition: background 0.3s ease;
        }

        .select2-results__option:hover {
            background: rgba(0, 123, 255, 0.1);
        }

        .select2-results__option input[type="checkbox"] {
            margin-right: 10px;
        }

        .select2-dropdown {
            z-index: 1055;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        .select2-search--dropdown {
            display: none !important;
        }

        .jobs-container {
            max-width: 1200px;
            margin: 0 auto 60px;
            animation: fadeIn 1.2s ease-out;
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

        @media (max-width: 768px) {
            .container {
                margin-top: 60px;
            }

            .job-card {
                width: 100% !important;
                margin: 10px auto;
            }

            .job-title {
                font-size: 1.5rem;
            }

            .add-job-btn {
                padding: 10px 20px;
                font-size: 1rem;
            }
        }
    </style>

    <body>
        <c:import url="header.jsp"></c:import>

        <nav class="navbar navbar-expand-lg navbar-light mt-2" id="company_navbar">
            <div class="container-fluid">
                <a class="navbar-brand animate__animated animate__fadeIn" href="add_logo.do" id="navbar-brand">
                    <img src="https://via.placeholder.com/40x40?text=Logo" alt="${sessionScope.company.name}"
                        class="img-fluid">
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <c:choose>
                        <c:when test="${not empty sessionScope.company}">
                            <ul class="navbar-nav me-auto mb-2 mb-lg-0" id="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link animate__animated animate__fadeInLeft" href="company.jsp">
                                        <span class="material-icons align-text-bottom">dashboard</span> Dashboard
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link animate__animated animate__fadeInLeft" href="profile.jsp">
                                        <span class="material-icons align-text-bottom">person</span> Profile
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link animate__animated animate__fadeInLeft" href="job_postings.jsp">
                                        <span class="material-icons align-text-bottom">work</span> Job Postings
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link animate__animated animate__fadeInLeft" href="candidates.jsp">
                                        <span class="material-icons align-text-bottom">people</span> Candidates
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link animate__animated animate__fadeInLeft" href="messages.jsp">
                                        <span class="material-icons align-text-bottom">message</span> Messages
                                    </a>
                                </li>
                            </ul>
                            <a href="logout.do"
                                class="btn signout-btn text-white animate__animated animate__fadeInRight">
                                <span class="material-icons align-text-bottom">logout</span> Sign Out
                            </a>
                        </c:when>
                        <c:otherwise>
                            <ul class="navbar-nav ms-auto">
                                <li class="nav-item">
                                    <a class="nav-link animate__animated animate__fadeInRight"
                                        href="home.jsp">
                                        <span class="material-icons align-text-bottom">login</span> Sign In
                                    </a>
                                </li>
                            </ul>

                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </nav>

        


        <c:choose>
            <c:when test="${not empty sessionScope.company}">
                <div class="container text-center mt-5">
                    <h2 class="animate__animated animate__fadeIn">Welcome,
                        <c:out value="${sessionScope.company.name}" />
                    </h2>
                    <p class="lead animate__animated animate__fadeIn">Manage your job postings and candidates
                        efficiently.</p>
                </div>
                <div class="container mb-4 text-center animate__animated animate__bounceIn">
                    <button type="button" class="btn add-job-btn" data-bs-toggle="modal" data-bs-target="#addJobModal">
                        <span class="material-icons">add_circle</span> Add Job
                    </button>
                </div>

            </c:when>
            <c:otherwise>
                <div class="container text-center mt-5">
                    <h2 class="animate__animated animate__fadeIn">Welcome to the Recruitment Management System</h2>
                    <p class="lead animate__animated animate__fadeIn">Please sign in to manage your company profile and
                        job postings.</p>
                </div>

                <div class="modal fade mt-5" id="companyloginModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header bg-dark-subtle">
                                <h1 class="modal-title fs-5 mx-50" id="login_title">SignIn </h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form action="login.do" method="post" id="login_form">

                                    <label for="email" class="form-label">Email</label>
                                    <input type="email" name="email" class="form-control" required>
                                    <br>

                                    <label for="password" class="form-label">Password</label>
                                    <input type="password" name="password" class="form-control" required>

                                    <br>
                                    <label for="user" class="form-label">User Type</label>
                                    <select class="form-select" name="user" id="user" required>

                                        <option value="company">Company</option>

                                    </select>

                            </div>
                            <div class="modal-footer bg-dark-subtle">

                                <button type="submit" class="btn btn-primary mx-auto" id="login_btn"
                                    form="login_form">Login</button>

                                <button type="button" class="btn btn-light ms-0" id="forgot_password_btn">Forgot
                                    Password</button>

                                <button type="button" class="btn btn-secondary ms-0" id="signup_btn"
                                    data-bs-target="#signupbox" data-bs-toggle="modal">SignUp</button>



                                <input type="hidden" name="user" value="company">
                            </div>
                            </form>
                        </div>
                    </div>
                </div>

            </c:otherwise>
        </c:choose>

        <div class="container jobs-container animate__animated animate__fadeIn">
            <div class="row mb-3" id="all_jobs"></div>
        </div>




        <!-- modal started  -->
        <div class="modal fade" tabindex="-1" id="addJobModal" aria-labelledby="addJobModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <form action="addjob.do" method="post">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addJobModalLabel">Add New Job</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="mb-3 animate__animated animate__fadeInUp">
                                <label for="jobTitle" class="form-label">Job Title</label>
                                <input type="text" class="form-control" id="jobTitle" name="title" required>
                            </div>
                            <div class="mb-3 animate__animated animate__fadeInUp" style="animation-delay: 0.1s;">
                                <label for="postDate" class="form-label">Post Date</label>
                                <input type="date" class="form-control" id="postDate" name="postDate" required>
                            </div>
                            <div class="mb-3 animate__animated animate__fadeInUp" style="animation-delay: 0.2s;">
                                <label for="deadline" class="form-label">Deadline</label>
                                <input type="date" class="form-control" id="deadline" name="deadline" required>
                            </div>
                            <div class="mb-3 animate__animated animate__fadeInUp" style="animation-delay: 0.3s;">
                                <label for="jobDescription" class="form-label">Description</label>
                                <textarea class="form-control" id="jobDescription" name="description" rows="4"
                                    required></textarea>
                            </div>
                            <div class="mb-3 animate__animated animate__fadeInUp" style="animation-delay: 0.4s;">
                                <label for="jobSkills" class="form-label">Skills Required</label>
                                <select class="form-control select2" id="jobSkills" name="skills[]"
                                    placeholder="Select Skills" multiple required>
                                    <c:forEach var="skill" items="${applicationScope.skills}">
                                        <option value="${skill.skillId}">
                                            <c:out value="${skill.name}" />
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="mb-3 animate__animated animate__fadeInUp" style="animation-delay: 0.5s;">
                                <label for="jobQualifications" class="form-label">Qualifications Required</label>
                                <select class="form-control select2" id="jobQualifications" name="qualifications[]"
                                    multiple required>
                                    <c:forEach var="qual" items="${applicationScope.qualifications}">
                                        <option value="${qual.qualificationId}">
                                            <c:out value="${qual.name}" />
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="mb-3 animate__animated animate__fadeInUp" style="animation-delay: 0.6s;">
                                <label for="jobCity" class="form-label">City</label>
                                <select class="form-control select2" id="jobCity" name="cityId" required>
                                    <option value="">Select a city</option>
                                    <c:forEach var="city" items="${applicationScope.cities}">
                                        <option value="${city.cityId}">
                                            <c:out value="${city}" />
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="mb-3 animate__animated animate__fadeInUp" style="animation-delay: 0.7s;">
                                <label for="jobType" class="form-label">Job Type</label>
                                <select class="form-control" id="jobType" name="jobType" required>
                                    <option value="FULL_TIME">Full Time</option>
                                    <option value="PART_TIME">Part Time</option>
                                    <option value="INTERNSHIP">Internship</option>
                                </select>
                            </div>
                            <div class="mb-3 animate__animated animate__fadeInUp" style="animation-delay: 0.8s;">
                                <label for="jobLocation" class="form-label">Location Details</label>
                                <input type="text" class="form-control" id="jobLocation" name="location">
                            </div>
                            <div class="mb-3 animate__animated animate__fadeInUp" style="animation-delay: 0.9s;">
                                <label for="minExperience" class="form-label">Experience Required (Years)</label>
                                <input type="number" class="form-control" id="minExperience" name="minExperience"
                                    min="0" required>
                            </div>
                            <div class="mb-3 animate__animated animate__fadeInUp" style="animation-delay: 1s;">
                                <label for="jobSalary" class="form-label">Salary</label>
                                <input type="number" class="form-control" id="jobSalary" name="salary" step="0.01">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary animate__animated animate__fadeIn"
                                data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary animate__animated animate__fadeIn">Save
                                changes</button>
                        </div>
                    </form>
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

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
        <script src="Static/js/header.js"></script>
        <script>
            // for showing all jobs
            const all_jobs = document.getElementById("all_jobs");

            const collectAllJobs = async () => {
                try {
                    const response = await fetch(`collectCompanyJobs.do?companyId=${sessionScope.company != null ? sessionScope.company.getCompanyId() : 0}`);
                    if (!response.ok) {
                        throw new Error(`HTTP error! Status: ${response.status}`);
                    }
                    const data = await response.json();
                    console.log("Fetched data:", data); // Log the data to inspect its structure
                    return data;
                } catch (error) {
                    console.error("Error fetching jobs:", error);
                    return []; // Return an empty array on error
                }
            }

            const showAllJobs = () => {
                collectAllJobs().then((data) => {
                    console.log("Data received in showAllJobs:", data); // Log data
                    if (Array.isArray(data) && data.length > 0) {
                        console.log("if block done arraylist not empty")
                        all_jobs.innerHTML = "";
                        for (let job of data) {
                            all_jobs.innerHTML += `
                    <div class=" mt-4 mx-auto card job-card animate__animated animate__fadeInUp" style="width: 18rem;">
                                                <div class="card-body">
                                                    
                                                    <h5 class="job-title btn btn-light w-100 mb-3 border border-secondary">
                                                    ` + job.jobTitle + `
                                                    </h5>
                                                    
                                                    <div class="job-detail">
                                                    <div class="job-info d-flex justify-content-between align-items-center border-bottom py-2">
                                                        <label class="btn btn-sm btn-info">Salary:</label> 
                                                        <span>` + job.salary + ` LPA</span>
                                                    </div>
                                                    
                                                    <div class="job-info d-flex justify-content-between align-items-center border-bottom py-2">
                                                        <label class="btn btn-sm btn-info">Experience:</label> 
                                                        <span>` + job.minExperience + ` years</span>
                                                    </div>
                                                    
                                                    <div class="job-info d-flex justify-content-between align-items-center border-bottom py-2">
                                                        <label class="btn btn-sm btn-info">Type:</label> 
                                                        <span>` + job.jobType + `</span>
                                                    </div>
                                                    
                                                    <div class="job-info d-flex justify-content-between align-items-center border-bottom py-2">
                                                        <label class="btn btn-sm btn-info">Post Date:</label> 
                                                        <span>` + job.postDate + `</span>
                                                    </div>
                                                    
                                                    <div class="job-info d-flex justify-content-between align-items-center border-bottom py-2">
                                                        <label class="btn btn-sm btn-info">Deadline:</label> 
                                                        <span>` + job.deadline + `</span>
                                                    </div>
                                                    
                                                    <div class="job-info d-flex justify-content-between align-items-center py-2">
                                                        <label class="btn btn-sm btn-info">Location:</label> 
                                                        <span>` + job.location + `</span>
                                                    </div>
                                                 </div>

                                                    <div class="mt-3">
                                                        <a href="editJob.do?jobId=`+ job.jobPostId + `" class="btn btn-primary btn-sm me-2" data-bs-toggle="tooltip" title="Edit Job">
                                                            <span class="material-icons align-text-bottom">edit</span> Edit
                                                        </a>
                                                        <a href="deleteJob.do?jobId=`+ job.jobPostId + `" class="btn btn-danger btn-sm me-2" data-bs-toggle="tooltip" title="Delete Job" onclick="return confirm('Are you sure you want to delete this job?');">
                                                            <span class="material-icons align-text-bottom">delete</span> Delete
                                                        </a>
                                                        <a href="viewApplications.do?jobId=`+ job.jobPostId + `" class="btn btn-info btn-sm mt-2 mx-auto" data-bs-toggle="tooltip" title="View Applications">
                                                            <span class="material-icons align-text-bottom">people</span> Registrations
                                                        </a>
                                                  </div>

                                                 

                                         </div>
                                         </div>
                        
                    `;
                        }

                        // Initialize tooltips and popovers
                        const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
                        const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));

                        const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]');
                        const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl));
                    } else {
                        all_jobs.innerHTML = '<p class="text-center animate__animated animate__fadeIn">No jobs found.</p>';
                    }
                }).catch((err) => {
                    console.error("Error in showAllJobs:", err);
                    all_jobs.innerHTML = '<p class="text-center text-danger animate__animated animate__fadeIn">Error loading jobs.</p>';
                });
            };

            showAllJobs();

            // Initialize Select2 and other existing scripts
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

                $(document).on('click', '.select2-results__option input[type="checkbox"]', function (e) {
                    e.stopPropagation();
                    var $select = $(this).closest('.select2-container').prev('select');
                    var optionText = $(this).parent().text().trim();
                    var optionId = $('.select2-results__option').filter(function () {
                        return $(this).text().trim() === optionText;
                    }).attr('id').replace('select2-' + $select.attr('id') + '-result-', '');
                    var currentVal = $select.val() || [];

                    if ($(this).is(':checked')) {
                        if (!currentVal.includes(optionId)) {
                            currentVal.push(optionId);
                        }
                    } else {
                        currentVal = currentVal.filter(function (val) {
                            return val !== optionId;
                        });
                    }

                    $select.val(currentVal).trigger('change');
                });

                // $('form').submit(function (e) {
                //     if ($('#jobSkills').val().length === 0) {
                //         alert('Please select at least one skill.');
                //         e.preventDefault();
                //     }
                //     if ($('#jobQualifications').val().length === 0) {
                //         alert('Please select at least one qualification.');
                //         e.preventDefault();
                //     }
                // });
            });

        </script>
    </body>

    </html>
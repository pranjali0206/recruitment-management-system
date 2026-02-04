<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Company Profile - Recruitment Management System</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            font-family: 'Inter', Arial, sans-serif;
            background: linear-gradient(180deg, #f0f4f8, #d9e2ec);
            min-height: 100vh;
            margin: 0;
            overflow-x: hidden;
        }
        .navbar {
            background: #1a3c6d;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .navbar-brand, .nav-link {
            color: #fff !important;
            transition: color 0.3s ease;
        }
        .nav-link:hover {
            color: #00ddeb !important;
        }
        .hero-section {
            background: url('https://via.placeholder.com/1920x400?text=Company+Banner') no-repeat center;
            background-size: cover;
            padding: 80px 0;
            text-align: center;
            color: #fff;
            position: relative;
            animation: fadeInHero 1.5s ease-out;
        }
        .hero-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(26, 60, 109, 0.7);
        }
        .hero-section h1 {
            font-size: 3rem;
            font-weight: 700;
            position: relative;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
        }
        .hero-section img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            border: 5px solid #fff;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease;
        }
        .hero-section img:hover {
            transform: scale(1.1);
        }
        .profile-container {
            max-width: 1000px;
            margin: -50px auto 50px;
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.15);
            padding: 40px;
            animation: slideUp 1s ease-out;
            transform: translateY(50px);
            opacity: 0;
            animation-fill-mode: forwards;
        }
        @keyframes fadeInHero {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
        @keyframes slideUp {
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }
        .profile-info .card {
            border: none;
            border-radius: 10px;
            background: #f8f9fa;
            margin-bottom: 20px;
            padding: 20px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .profile-info .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
        }
        .profile-info label {
            font-weight: 600;
            color: #1a3c6d;
            font-size: 1.1rem;
        }
        .profile-info p {
            color: #333;
            font-size: 1rem;
        }
        .update-btn {
            background: linear-gradient(45deg, #1a3c6d, #00ddeb);
            color: #fff;
            padding: 12px 30px;
            font-size: 1.1rem;
            font-weight: 600;
            border: none;
            border-radius: 50px;
            text-decoration: none;
            transition: all 0.3s ease;
            animation: pulse 2s infinite;
        }
        .update-btn:hover {
            background: linear-gradient(45deg, #153258, #00b7c3);
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
            animation: none;
        }
        @keyframes pulse {
            0% {
                box-shadow: 0 0 0 0 rgba(26, 60, 109, 0.7);
            }
            70% {
                box-shadow: 0 0 0 15px rgba(26, 60, 109, 0);
            }
            100% {
                box-shadow: 0 0 0 0 rgba(26, 60, 109, 0);
            }
        }
        .footer {
            background: #1a3c6d;
            color: #fff;
            padding: 20px 0;
            text-align: center;
            margin-top: 50px;
        }
        .footer a {
            color: #00ddeb;
            text-decoration: none;
            transition: color 0.3s ease;
        }
        .footer a:hover {
            color: #fff;
        }
        .modal-content {
            border-radius: 15px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.2);
        }
        .modal-header {
            background: #1a3c6d;
            color: #fff;
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
        }
        .modal-title {
            font-weight: 600;
        }
        .modal-body {
            padding: 30px;
        }
        .form-label {
            font-weight: 600;
            color: #1a3c6d;
        }
        .form-control, .form-control-file {
            border-radius: 8px;
            border: 1px solid #ced4da;
            transition: border-color 0.3s ease;
        }
        .form-control:focus {
            border-color: #00ddeb;
            box-shadow: 0 0 5px rgba(0, 221, 235, 0.5);
        }
        .btn-submit {
            background: linear-gradient(45deg, #1a3c6d, #00ddeb);
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .btn-submit:hover {
            background: linear-gradient(45deg, #153258, #00b7c3);
            transform: translateY(-2px);
        }
        @media (max-width: 768px) {
            .hero-section h1 {
                font-size: 2rem;
            }
            .hero-section img {
                width: 120px;
                height: 120px;
            }
            .profile-container {
                padding: 20px;
                margin: 20px;
            }
            .update-btn {
                padding: 10px 25px;
                font-size: 1rem;
            }
            .modal-body {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">RMS</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="company.jsp">Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="profile.html">Profile</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="jobs.jsp">Jobs</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="logout.do">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero-section">
        <div class="container position-relative">
            <img src="Static/media/company.jpg" alt="Company Logo">
            <h1>${company.name}</h1>
        </div>
    </section>

    <!-- Profile Container -->
    <div class="profile-container">
        <!-- Profile Information -->
        <div class="profile-info">
            <div class="card">
                <div class="row">
                    
                    <div class="col-md-6">
                        <label>Location:</label>
                        <p>${company.address}</p>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="row">
                    <div class="col-md-6">
                        <label>Email:</label>
                        <p>${company.email}</p>
                    </div>
                    <div class="col-md-6">
                        <label>Phone:</label>
                        <p>${company.contact}</p>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="row">
                    <div class="col-12">
                        <label>About Company:</label>
                        <p>${company.description}</p>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="row">
                    <div class="col-md-6">
                        <label>Website:</label>
                        <p><a href="https://www.company.com" target="_blank">${company.website}</a></p>
                    </div>
                    <div class="col-md-6">
                        <label>Founded:</label>
                        <p>${company.establishedOn}</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Update Button -->
        <div class="text-center mt-4">
            <button type="button" class="update-btn" data-bs-toggle="modal" data-bs-target="#updateProfileModal">Update Profile</button>
        </div>
    </div>

    <!-- Update Profile Modal -->
    <div class="modal fade" id="updateProfileModal" tabindex="-1" aria-labelledby="updateProfileModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="updateProfileModalLabel">Update Company Profile</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="update-profile.do" method="POST" enctype="multipart/form-data">
                        <div class="mb-3">
                            <label for="name" class="form-label">Company Name</label>
                            <input type="text" class="form-control" id="name" name="name" value="${company.name}" required>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" name="email" value="${company.email}" required>
                        </div>
                        <div class="mb-3">
                            <label for="contact" class="form-label">Contact Number</label>
                            <input type="tel" class="form-control" id="contact" name="contact" value="${company.contact}" required>
                        </div>
                        <div class="mb-3">
                            <label for="address" class="form-label">Address</label>
                            <textarea class="form-control" id="address" name="address" rows="3">${company.address}</textarea>
                        </div>
                        <div class="mb-3">
                            <label for="website" class="form-label">Website</label>
                            <input type="url" class="form-control" id="website" name="website" value="">${company.website}">
                        </div>
                        <div class="mb-3">
                            <label for="profilePic" class="form-label">Profile Picture</label>
                            <input type="file" class="form-control" id="profilePic" name="profilePic" accept="image/*">
                        </div>
                        <div class="mb-3">
                            <label for="banner" class="form-label">Banner Image</label>
                            <input type="file" class="form-control" id="banner" name="banner" accept="image/*">
                        </div>
                        <div class="mb-3">
                            <label for="establishedOn" class="form-label">Established On</label>
                            <input type="date" class="form-control" id="establishedOn" name="establishedOn" value="${company.establishedOn}">
                        </div>
                        <div class="mb-3">
                            <label for="description" class="form-label">Description</label>
                            <textarea class="form-control" id="description" name="description" rows="4">${company.description}</textarea>
                        </div>
                        <div class="mb-3">
                            <label for="mission" class="form-label">Mission</label>
                            <textarea class="form-control" id="mission" name="mission" rows="3">">${company.mission}</textarea>
                        </div>
                        <div class="mb-3">
                            <label for="vision" class="form-label">Vision</label>
                            <textarea class="form-control" id="vision" name="vision" rows="3">">${company.vision}</textarea>
                        </div>
                        <div class="text-end">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-submit ms-2">Save Changes</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <p>© 2025 Recruitment Management System. All rights reserved. | <a href="privacy.html">Privacy Policy</a> | <a href="terms.html">Terms of Service</a></p>
        </div>
    </footer>

    <!-- Bootstrap JS and Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
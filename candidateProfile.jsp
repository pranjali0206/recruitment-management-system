<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Candidate Profile</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background: linear-gradient(to bottom, #f0f4f8, #d9e2ec);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Segoe UI', sans-serif;
            padding: 20px;
        }

        .profile-container {
            background: white;
            border-radius: 15px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);
            max-width: 600px;
            width: 100%;
            padding: 25px;
            animation: fadeInUp 0.8s ease-out;
        }

        .profile-header {
            text-align: center;
            margin-bottom: 20px;
        }

        .profile-img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid #007bff;
            transition: all 0.3s ease;
        }

        .profile-img:hover {
            transform: rotate(5deg) scale(1.05);
            box-shadow: 0 0 15px rgba(0, 123, 255, 0.3);
        }

        .profile-details {
            margin: 20px 0;
        }

        .profile-details p {
            margin: 10px 0;
            font-size: 1.1rem;
            color: #333;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .update-btn {
            background: #007bff;
            color: white;
            padding: 10px 25px;
            border-radius: 8px;
            border: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .update-btn:hover {
            background: #0056b3;
            transform: translateY(-2px);
        }

        /* Timeline Styles */
        .timeline {
            position: relative;
            margin-top: 30px;
            padding: 20px 0;
        }

        .timeline::before {
            content: '';
            position: absolute;
            left: 20px;
            width: 4px;
            height: 100%;
            background: #007bff;
        }

        .timeline-item {
            margin-bottom: 20px;
            position: relative;
            padding-left: 50px;
        }

        .timeline-item::before {
            content: '';
            position: absolute;
            left: 15px;
            top: 5px;
            width: 14px;
            height: 14px;
            background: #007bff;
            border-radius: 50%;
            border: 3px solid white;
        }

        .timeline-item p {
            background: #f8f9fa;
            padding: 10px 15px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        /* Modal Styles */
        .modal-content {
            border-radius: 12px;
            border: none;
            animation: slideDown 0.5s ease-out;
        }

        .modal-header {
            background: #007bff;
            color: white;
            border-radius: 12px 12px 0 0;
            padding: 15px 20px;
        }

        .modal-body {
            padding: 20px;
        }

        .form-control {
            border-radius: 8px;
            transition: border-color 0.3s ease;
        }

        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 8px rgba(0, 123, 255, 0.2);
        }

        .btn-save {
            background: #007bff;
            border: none;
            border-radius: 8px;
            padding: 10px 20px;
        }

        .btn-save:hover {
            background: #0056b3;
        }

        /* Animations */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes slideDown {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Responsive Design */
        @media (max-width: 576px) {
            .profile-container {
                padding: 15px;
            }

            .profile-img {
                width: 100px;
                height: 100px;
            }

            .timeline::before {
                left: 15px;
            }

            .timeline-item {
                padding-left: 40px;
            }

            .timeline-item::before {
                left: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="profile-container">
        <div class="profile-header">
            <img src="https://via.placeholder.com/120" alt="Candidate Image" class="profile-img">
            <h2 class="mt-3">${candidate.name}</h2>
        </div>
        <div class="profile-details">
            <p><i class="fas fa-envelope"></i> Email: ${candidate.email}</p>
            <p><i class="fas fa-phone"></i> Phone: ${candidate.phone}</p>
           
        </div>
        <button class="update-btn" data-bs-toggle="modal" data-bs-target="#updateProfileModal">
            Update Profile
        </button>
        <div class="timeline">
            <h5 class="mb-3">Application History</h5>
            <div class="timeline-item">
                <p>Applied for UI/UX Designer at TechCorp - 2025-06-15</p>
            </div>
            <div class="timeline-item">
                <p>Interview Scheduled - 2025-06-20</p>
            </div>
            <div class="timeline-item">
                <p>Offer Received - 2025-07-01</p>
            </div>
        </div>
    </div>

    <!-- Bootstrap Modal -->
    <div class="modal fade" id="updateProfileModal" tabindex="-1" aria-labelledby="updateProfileModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="updateProfileModalLabel">Update Profile</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label for="name" class="form-label">Full Name</label>
                                <input type="text" class="form-control" id="name" value="Jane Smith" required>
                            </div>
                            <div class="col-md-6">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" class="form-control" id="email" value="jane.smith@example.com" required>
                            </div>
                            <div class="col-md-6">
                                <label for="phone" class="form-label">Phone</label>
                                <input type="tel" class="form-control" id="phone" value="+1 (987) 654-3210">
                            </div>
                            <div class="col-md-6">
                                <label for="role" class="form-label">Role</label>
                                <input type="text" class="form-control" id="role" value="UI/UX Designer">
                            </div>
                            <div class="col-12">
                                <label for="location" class="form-label">Location</label>
                                <input type="text" class="form-control" id="location" value="San Francisco, USA">
                            </div>
                            <div class="col-12">
                                <label for="profileImage" class="form-label">Profile Image</label>
                                <input type="file" class="form-control" id="profileImage" accept="image/*">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-save">Save Changes</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
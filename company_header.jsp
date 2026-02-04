
    
    <div class="container-fluid border mt-5 mb-5" style="background-color: #ffffff; border-radius: 10px; padding: 20px;">
        
        <div class="container mt-3 mb-3">
            <h1 class="text-center">Welcome to the Company Dashboard</h1>
            <p class="text-center">Manage your job postings and candidates efficiently.</p>
        </div>

    <div class="container-fluid">
        <c:if test="${not empty sessionScope.company}">
            <div class="container mb-4 text-center animate__animated animate__bounceIn">
                <button type="button" class="btn btn-primary add-job-btn" data-bs-toggle="modal" data-bs-target="#addJobModal">
                    <span class="material-icons">add_circle</span> Add Job
                </button>
            </div>

            <!-- Add Job Modal -->
            <div class="modal fade" id="addJobModal" tabindex="-1" aria-labelledby="addJobModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="addJob.do" method="post">
                            <div class="modal-header">
                                <h5 class="modal-title" id="addJobModalLabel">Add New Job</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div class="mb-3">
                                    <label for="jobTitle" class="form-label">Job Title</label>
                                    <input type="text" class="form-control" id="jobTitle" name="title" required>
                                </div>
                                <div class="mb-3">
                                    <label for="postDate" class="form-label">Post Date</label>
                                    <input type="date" class="form-control" id="postDate" name="postDate" required>
                                </div>
                                <div class="mb-3">
                                    <label for="deadline" class="form-label">Deadline</label>
                                    <input type="date" class="form-control" id="deadline" name="deadline" required>
                                </div>
                                <div class="mb-3">
                                    <label for="jobDescription" class="form-label">Description</label>
                                    <textarea class="form-control" id="jobDescription" name="description" rows="4" required></textarea>
                                </div>
                                <div class="mb-3">
                                    <label for="jobQualifications" class="form-label">Qualifications Required</label>
                                    <input type="text" class="form-control" id="jobQualifications" name="qualifications" placeholder="Type to search..." required>
                                    <select class="form-control" id="jobQualifications" name="qualifications[]" multiple>
                                        <c:forEach var="qual" items="${applicationScope.qualifications}">
                                            <option value="${qual.qualificationId}"><c:out value="${qual.name}" /></option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="jobSkills" class="form-label">Skills Required</label>
                                    <input type="text" class="form-control" id="jobSkills" name="skills" placeholder="Type to search..." required>
                                    <select class="form-control " id="jobSkills" name="skills[]" multiple>
                                        <c:forEach var="skill" items="${applicationScope.skills}">
                                            <option value="${skill.skillId}"><c:out value="${skill.name}" /></option>
                                        </c:forEach>
                                    </select>
                                </div>
                             
                                <div class="mb-3">
                                    <label for="jobType" class="form-label">Job Type</label>
                                    <select class="form-control" id="jobType" name="jobType" required>
                                        <option value="FULL_TIME">Full Time</option>
                                        <option value="PART_TIME">Part Time</option>
                                        <option value="INTERNSHIP">Internship</option>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="jobLocation" class="form-label">Location</label>
                                    <input type="text" class="form-control" id="jobLocation" name="location">
                                    <select name="city" id="job_city">
                                        <c:forEach var="ct" items="${cities}">
                                            <option value="${ct.city}(${ct.state.state})" id="${ct.cityId}"><c:out value="${ct.city}" /></option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="mb-3">
                                    <label for="minExperience" class="form-label">Experience Required</label>
                                    <input type="Number" class="form-control" id="minExperience" name="minExperience" placeholder="in years" required>
                                </div>
                                <div class="mb-3">
                                    <label for="jobSalary" class="form-label">Salary</label>
                                    <input type="number" class="form-control" id="jobSalary" name="salary" step="0.01">
                                </div>
                                
                                <div class="mb-3">
                                    <label for="city">City</label>
                                    <input list="city_list" autocomplete="off" type="text" class="form-control" name="city"
                                        id="city" required>
                                    <input type="hidden" name="city_id" id="city_id">
                                    <datalist id="city_list">
                                        <c:forEach var="ct" items="${cities}">
                                            <option value="${ct.city}(${ct.state.state})" id="${ct.cityId}">
                                        </c:forEach>
                                    </datalist>
                                </div>

                                <div class="mb-3">
                                    <label for="jobStatus" class="form-label">Status</label>
                                    <select class="form-control" id="jobStatus" name="status">
                                        <option value="ACTIVE">Active</option>
                                        <option value="CLOSED">Closed</option>
                                    </select>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Save Job</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="container mb-5">
                <h3 class="text-center mb-4 animate__animated animate__fadeIn">Open Positions</h3>
                <div id="jobsContainer" class="row g-4">
                    <!-- Dynamic job cards will be added here -->
                </div>
            </div>
        </c:if>

        <c:if test="${param.success == 'job_added'}">
            <div class="container">
                <div class="alert alert-success animate__animated animate__fadeIn">Job added successfully!</div>
            </div>
        </c:if>
        <c:if test="${not empty param.error}">
            <div class="container">
                <div class="alert alert-danger animate__animated animate__fadeIn">Error: <c:out value="${param.error}" /></div>
            </div>
        </c:if>
</div>

</div>
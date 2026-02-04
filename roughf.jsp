<form action="addjob.do" method="post">
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
            <label for="jobSkills" class="form-label">Skills Required</label>
            <select class="form-control select2" id="jobSkills" name="skills[]" placeholder="Select Skills" multiple required>
                <option value="select Skills">Skills required</option>
                <c:forEach var="skill" items="${applicationScope.skills}">
                    <option value="${skill.skillId}"><c:out value="${skill.name}" /></option>
                </c:forEach>
            </select>
            
        </div>

        <div class="mb-3">
            <label for="jobQualifications" class="form-label">Qualifications Required</label>
            <select class="form-control select2" id="jobQualifications" name="qualifications[]" multiple required>
                <c:forEach var="qual" items="${applicationScope.qualifications}">
                    <option value="${qual.qualificationId}"><c:out value="${qual.name}" /></option>
                </c:forEach>
            </select>
            
        </div>

        
        <div class="mb-3">
            <label for="jobCity" class="form-label">City</label>
            <select class="form-control select2" id="jobCity" name="cityId" required>
                <option value="">Select a city</option>
                <c:forEach var="city" items="${applicationScope.cities}">
                    <option value="${city.cityId}"><c:out value="${city}" /></option>
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
            <label for="jobLocation" class="form-label">Location Details</label>
            <input type="text" class="form-control" id="jobLocation" name="location">
        </div>
        <div class="mb-3">
            <label for="minExperience" class="form-label">Experience Required (Years)</label>
            <input type="number" class="form-control" id="minExperience" name="minExperience" min="0" required>
        </div>
        <div class="mb-3">
            <label for="jobSalary" class="form-label">Salary</label>
            <input type="number" class="form-control" id="jobSalary" name="salary" step="0.01">
        </div>
        <div class="mb-3">
            <label for="jobStatus" class="form-label">Status</label>
            <select class="form-control" id="jobStatus" name="status" required>
                <option value="ACTIVE">Active</option>
                <option value="CLOSED">Closed</option>
                <option value="OPENING_SOON">Opening Soon</option>
            </select>
        </div>
        <input type="hidden" name="companyId" value="${sessionScope.company.companyId}">
    </div>
        <input type="hidden" name="companyId" value="${sessionScope.company.companyId}">
       
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Save Job</button>
    </div>
</form>






<div class="card-footer">
    <button class="action-btn" title="Edit Job" onclick="editJob(1)">
        <span class="material-icons">edit</span>
    </button>
    <button class="action-btn delete-btn" title="Delete Job" onclick="deleteJob(1)">
        <span class="material-icons">delete</span>
    </button>
</div>









all_jobs.innerHTML += '<div class="col-3 mb-4">' +
    '<div class="card p-2" style="width: 18rem;">' +
    '<img id="_' + job.jobId + '" src="download_media.do?thumbnail=' + job.thumbnail + '" class="card-img-top img-thumbnail" style="height:14rem" alt="Job Thumbnail">' +
    '<div class="card-body">' +
        '<h5 id="t_' + job.jobId + '" class="card-title">' + job.title + '</h5>' +
        '<p class="card-text">' + job.description.substr(0, 100) + '... <a class="fw-semibold text-primary btn" data-bs-toggle="popover" data-bs-title="Job Description" data-bs-trigger="focus" data-bs-content="' + job.description + '" tabindex="0">more</a></p>' +
        '<div>' +
            '<small class="me-2 p-2 badge text-bg-primary" data-bs-toggle="tooltip" data-bs-title="Company">' + job.companyName + '</small>' +
            '<small class="me-2 p-2 badge text-bg-primary" data-bs-toggle="tooltip" data-bs-title="Location">' + job.location + '</small>' +
            '<small class="me-2 p-2 badge text-bg-primary" data-bs-toggle="tooltip" data-bs-title="Job Type">' + job.jobType + '</small>' +
        '</div>' +
    '</div>' +
    '<div class="card-footer">' +
        '<button id="' + job.jobId + '" type="button" data-bs-toggle="offcanvas" data-bs-target="#job_details_box" class="job_details_btn btn btn-sm btn-primary d-flex align-items-center"><span class="material-icons">add</span> View Details</button>' +
    '</div>' +
    '</div>' +
'</div>';
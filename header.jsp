<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!-- ############################################################### Navbar Start ####################################################################  -->



<nav class="navbar navbar-expand-lg bg-body-tertiary me-auto ms-auto w-75 mt-2 rounded sticky-top">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Rms</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
      aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active d-flex align-items-center " aria-current="page" href="index.do"> <span
              class="material-icons">home</span>Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link d-flex align-items-center " href="#"><span
              class="material-icons">link</span>Link</a>
        </li>
      </ul>
      <form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" />
        <button class="btn btn-outline-success" type="submit"><span
            class="material-icons fs-5 d-flex aligh-items-end ">search</span></button>
      </form>

      <!-- ################################################################################################################################# -->

       <c:choose>

        <c:when test = "${not empty company}">
          <div class="dropdown ms-2 mt-0">
            <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown"
              aria-expanded="false">
              <span class="material-icons mx-auto me-1">person</span>${company.getName()}
            </button>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
              <li><a class="dropdown-item d-flex align-items-center w-100" href="#"><span class="material-icons mx-2">account_circle</span>Profile</a></li>
              <li><a class="dropdown-item d-flex align-items-center w-100" href="#"><span class="material-icons mx-2">settings</span>Settings</a></li>
              <li><a class="dropdown-item d-flex align-items-center w-100" href="logout.do" id="logout"><span class="material-icons mx-2">logout</span>Logout</a></li>
            </ul>
          </div>
        </c:when>

        <c:when test="${not empty candidate}">
          <div class="dropdown ms-2 mt-0">
            <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown"
              aria-expanded="false">
              <span class="material-icons mx-2 mb-0">person</span>${candidate.getName()}
            </button>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
              <li><a class="dropdown-item d-flex align-items-center w-100" href="#"><span class="material-icons mx-2">account_circle</span>Profile</a></li>
              <li><a class="dropdown-item d-flex align-items-center w-100" href="#"><span class="material-icons mx-2">settings</span>Settings</a></li>
              <li><a class="dropdown-item d-flex align-items-center w-100" href="logout.do" id="logout"><span class="material-icons mx-2">logout</span>Logout</a></li>
            </ul>
          </div>
        </c:when>

        <c:otherwise>

          <button class="nav-item dropdown btn btn-primary ms-2 mt-0 bg-dark ">
            <a class="nav-link dropdown-toggle d-flex align-items-center " href="#" role="button"
              data-bs-toggle="dropdown" aria-expanded="false"><span class="material-icons">person</span>
              JoinUs
            </a>
            <ul class="dropdown-menu mt-1">
              <li>
                <a class="dropdown-item d-flex align-items-center w-100" href="#"   data-bs-target="#login" data-bs-toggle="modal"><span class="material-icons mx-2"> login
                  </span>Login</a>
              </li>
              <li>
                <span data-bs-target="#signupbox" data-bs-toggle="modal">
                  <a class="dropdown-item d-flex align-items-center" id="signup" href="#"><span
                      class="material-icons mx-2">person_add</span>SignUp</a>
              </li>
    
              </span>
            </ul>
          </button>

        </c:otherwise>
       </c:choose>


      <!-- ################################################################################################################################# -->
     </div>
  </div>
</nav>


  <!-- ############################################################### Navbar  END####################################################################  -->



  <!-- ########################################## Login MODEL START PART 1##############################################################################  -->
  <div class="modal fade mt-5" id="login" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header bg-dark-subtle">
          <h1 class="modal-title fs-5 mx-50" id="login_title">SignIn </h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
             <form action="login.do" method="post" id="login_form">

              <label for="email" class="form-label">Email</label>
              <input type="email" name="email" class="form-control" required>
              <br>

              <label for="password" class="form-label" >Password</label>
              <input type="password"  name="password" class="form-control" required>

              <br>
              <label for="user" class="form-label">User Type</label>
              <select class="form-select" name="user" id="user" required>
                <option value="" disabled selected>Select User Type</option>
                <option value="company">Company</option>
                <option value="candidate">Candidate</option>
              </select>
            
        </div>
        <div class="modal-footer bg-dark-subtle">

          <button type="submit" class="btn btn-primary mx-auto" id="login_btn" form="login_form">Login</button>

          <button type="button" class="btn btn-light ms-0" id="forgot_password_btn">Forgot Password</button>
         
          <button type="button" class="btn btn-secondary ms-0" id="signup_btn" data-bs-target="#signupbox" data-bs-toggle="modal">SignUp</button>



          <input type="hidden" name="user">
        </div>
      </form>
      </div>
    </div>
  </div>

  
  <!-- ########################################## Login MODEL START PART 1##############################################################################  -->




  <!-- ########################################## SIGNUP MODEL START PART 1##############################################################################  -->

  <div class="modal fade mt-5" id="signupbox" tabindex="-1">
    <div class="modal-dialog modal-lg">
      <div class="modal-content text-align-center">
        <div class="modal-header  text-align-center">
          <h5 class="modal-title">Create Account</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body bg-primary-subtle rounded">
          <div class="container">
            <div class="row justify-content-around" id="user_card_box">

              <div class="card col-lg-5 user_type  "id="a1" style="cursor: pointer;" data-bs-target="#signup_modal" data-bs-toggle="modal" >
                <img src="Static/media/company.jpg" class="card-img-top pt-5 pb-0" alt="...">
                <div class="card-body" style="margin-top:50px;">
                  <h5 class="card-title"><b>Company</b></h5>
                </div>
              </div>

              <div class="card col-lg-5  user_type"id="a2" data-bs-target="#signup_modal" data-bs-toggle="modal" style="cursor: pointer;"  >
                <img src="Static/media/candidate.jpg" class="card-img-top pt-0 pb-0" alt="...">
                <div class="card-body mt-1">
                  <h5 class="card-title" ><b>Candidate</b></h5>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  </div>


    <!-- ########################################## SIGNUP MODEL END  ##############################################################################  -->




    <!-- ########################################## SIGNUP MODAL PART 2 START ########################################## -->

    <div class="modal fade mt-5" id="signup_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="signup_title"></h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
    
          <div class="modal-body">
            <form id="signup_form" action="signup.do" method="POST">
              <div class="mb-3">
                <label for="name" class="form-label">UserName</label>
                <input type="text" class="form-control" id="name" name="name" required>
              </div>
    
              <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" required>
                <!-- <a href="verifyEmail.do" class="btn btn-primary mt-1">Verify Email</a> -->
              </div>
              <!-- <div class="mb-3">
                <label for="otp" class="form-label">OTP</label>
                <input type="text" class="form-control mt-1" id="otp" name="otp" placeholder="Enter OTP">
              </div>   -->

             
    
              <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" required>
              </div>
    
              <div class="mb-3">
                <label for="contact" class="form-label">Contact</label>
                <input type="text" class="form-control" id="contact" name="contact" required maxlength="10">
              </div>
    
              <div class="mb-3">
                <label for="address" class="form-label">Address</label>
                <input autocomplete="off" type="text" class="form-control" id="address" name="address" required>
              </div>
    
              <!-- Hidden input to send user type -->
              <input type="hidden" name="user" id="user_type">
            </form>
          </div>
    
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-primary" id="signup_btn" form="signup_form">SignUp</button>
          </div>
        </div>
      </div>
    </div>

    <!-- ########################################## SIGNUP MODAL PART 2 END ########################################## -->

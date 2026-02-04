
const users = new Array ("company","candidate");
const user_card_box = document.querySelector("#user_card_box");
const user_type = document.querySelector("#user_type");
const uType = document.querySelector('#uType');

const mymodel = document.getElementById("#myModal");
const myInput = document.getElementById("#myInput") ;

const signup_btn = document.querySelector("#signup_btn");
const signup_form = document.querySelector("#signup_form");
const signup_title = document.querySelector("#signup_title");

const login_btn = document.getElementById("login_btn");

 // Utility function to show/hide error messages
 function showError(field, errorElement, message) {
  field.classList.add('invalid');
  field.classList.remove('valid');
  errorElement.style.display = 'block';
  errorElement.textContent = message;
}

function clearError(field, errorElement) {
  field.classList.remove('invalid');
  field.classList.add('valid');
  errorElement.style.display = 'none';
}

// Validation functions for specific field types
function isValidEmail(email) {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
}

function isValidPassword(password) {
  return /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\W]).{8,}$/.test(password);
}

function isValidContact(contact) {
  return /^\d{10}$/.test(contact);
}

function isValidName(name) {
  return /^[A-Za-z\s]{2,50}$/.test(name);
}

function isValidAddress(address) {
  return address.length >= 5 && address.length <= 100;
}


 // Login Form Validation
 function validateLoginForm() {
  let isValid = true;

  // Email
  let emailField = document.querySelector('#login_form [name="email"]');
  let emailError = emailField.nextElementSibling;
  if (!emailError || !emailError.classList.contains('error')) {
      emailError = document.createElement('div');
      emailError.className = 'error';
      emailField.parentNode.insertBefore(emailError, emailField.nextSibling);
  }

  if (!emailField.value) {
      showError(emailField, emailError, 'Email is required.');
      isValid = false;
  } else if (!isValidEmail(emailField.value)) {
      showError(emailField, emailError, 'Please enter a valid email address.');
      isValid = false;
  } else {
      clearError(emailField, emailError);
  }

  // Password
  let passwordField = document.querySelector('#login_form [name="password"]');
  let passwordError = passwordField.nextElementSibling;
  if (!passwordError || !passwordError.classList.contains('error')) {
      passwordError = document.createElement('div');
      passwordError.className = 'error';
      passwordField.parentNode.insertBefore(passwordError, passwordField.nextSibling);
  }

  if (!passwordField.value) {
      showError(passwordField, passwordError, 'Password is required.');
      isValid = false;
  } else if (passwordField.value.length < 8) {
      showError(passwordField, passwordError, 'Password must be at least 8 characters.');
      isValid = false;
  } else {
      clearError(passwordField, passwordError);
  }

  // User Type
  let userTypeField = document.querySelector('#login_form [name="user"]');
  let userTypeError = userTypeField.nextElementSibling;
  if (!userTypeError || !userTypeError.classList.contains('error')) {
      userTypeError = document.createElement('div');
      userTypeError.className = 'error';
      userTypeField.parentNode.insertBefore(userTypeError, userTypeField.nextSibling);
  }

  if (!userTypeField.value || !['company', 'candidate'].includes(userTypeField.value)) {
      showError(userTypeField, userTypeError, 'Please select a valid user type.');
      isValid = false;
  } else {
      clearError(userTypeField, userTypeError);
  }

  return isValid;
}



 // Signup Form Validation
 function validateSignupForm() {
  let isValid = true;

  // Username
  let nameField = document.querySelector('#signup_form [name="name"]');
  let nameError = nameField.nextElementSibling;
  if (!nameError || !nameError.classList.contains('error')) {
      nameError = document.createElement('div');
      nameError.className = 'error';
      nameField.parentNode.insertBefore(nameError, nameField.nextSibling);
  }

  if (!nameField.value) {
      showError(nameField, nameError, 'Username is required.');
      isValid = false;
  } else if (!isValidName(nameField.value)) {
      showError(nameField, nameError, 'Username must be 2-50 characters, letters and spaces only.');
      isValid = false;
  } else {
      clearError(nameField, nameError);
  }

  // Email
  let emailField = document.querySelector('#signup_form [name="email"]');
  let emailError = emailField.nextElementSibling;
  if (!emailError || !emailError.classList.contains('error')) {
      emailError = document.createElement('div');
      emailError.className = 'error';
      emailField.parentNode.insertBefore(emailError, emailField.nextSibling);
  }

  if (!emailField.value) {
      showError(emailField, emailError, 'Email is required.');
      isValid = false;
  } else if (!isValidEmail(emailField.value)) {
      showError(emailField, emailError, 'Please enter a valid email address.');
      isValid = false;
  } else {
      clearError(emailField, emailError);
  }

  // Password
  let passwordField = document.querySelector('#signup_form [name="password"]');
  let passwordError = passwordField.nextElementSibling;
  if (!passwordError || !passwordError.classList.contains('error')) {
      passwordError = document.createElement('div');
      passwordError.className = 'error';
      passwordField.parentNode.insertBefore(passwordError, passwordField.nextSibling);
  }

  if (!passwordField.value) {
      showError(passwordField, passwordError, 'Password is required.');
      isValid = false;
  } else if (!isValidPassword(passwordField.value)) {
      showError(passwordField, passwordError, 'Password must be 8+ characters with uppercase, lowercase, number, and special character.');
      isValid = false;
  } else {
      clearError(passwordField, passwordError);
  }

  // Contact
  let contactField = document.querySelector('#signup_form [name="contact"]');
  let contactError = contactField.nextElementSibling;
  if (!contactError || !contactError.classList.contains('error')) {
      contactError = document.createElement('div');
      contactError.className = 'error';
      contactField.parentNode.insertBefore(contactError, contactField.nextSibling);
  }

  if (!contactField.value) {
      showError(contactField, contactError, 'Contact number is required.');
      isValid = false;
  } else if (!isValidContact(contactField.value)) {
      showError(contactField, contactError, 'Contact must be a 10-digit number.');
      isValid = false;
  } else {
      clearError(contactField, contactError);
  }

  // Address
  let addressField = document.querySelector('#signup_form [name="address"]');
  let addressError = addressField.nextElementSibling;
  if (!addressError || !addressError.classList.contains('error')) {
      addressError = document.createElement('div');
      addressError.className = 'error';
      addressField.parentNode.insertBefore(addressError, addressField.nextSibling);
  }

  if (!addressField.value) {
      showError(addressField, addressError, 'Address is required.');
      isValid = false;
  } else if (!isValidAddress(addressField.value)) {
      showError(addressField, addressError, 'Address must be 5-100 characters.');
      isValid = false;
  } else {
      clearError(addressField, addressError);
  }

  // User Type (hidden)
  let userTypeField = document.querySelector('#signup_form [name="user"]');
  let userTypeError = userTypeField.nextElementSibling;
  if (!userTypeError || !userTypeError.classList.contains('error')) {
      userTypeError = document.createElement('div');
      userTypeError.className = 'error';
      userTypeField.parentNode.insertBefore(userTypeError, userTypeField.nextSibling);
  }

  if (!userTypeField.value || !['company', 'candidate'].includes(userTypeField.value)) {
      showError(userTypeField, userTypeError, 'User type must be selected.');
      isValid = false;
  } else {
      clearError(userTypeField, userTypeError);
  }

  return isValid;
}

// Attach form submission handlers
document.getElementById('login_form')?.addEventListener('submit', function (event) {
  if (!validateLoginForm()) {
      event.preventDefault();
      event.stopPropagation();
  }
});

document.getElementById('signup_form')?.addEventListener('submit', function (event) {
  if (!validateSignupForm()) {
      event.preventDefault();
      event.stopPropagation();
  }
});

// Real-time validation on input
const inputs = document.querySelectorAll('#login_form input, #login_form select, #signup_form input');
inputs.forEach(input => {
  input.addEventListener('input', function () {
      const formId = this.closest('form').id;
      if (formId === 'login_form') {
          validateLoginForm();
      } else if (formId === 'signup_form') {
          validateSignupForm();
      }
  });
});




// To handle login through button click


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



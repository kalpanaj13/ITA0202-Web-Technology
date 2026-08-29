document.getElementById("registrationForm").addEventListener("submit", function(event) {
  event.preventDefault(); // Prevent form submission

  let name = document.getElementById("name").value.trim();
  let email = document.getElementById("email").value.trim();
  let phone = document.getElementById("phone").value.trim();
  let password = document.getElementById("password").value.trim();
  let course = document.getElementById("course").value;
  let errorMsg = document.getElementById("errorMsg");

  // Regular Expressions
  let nameRegex = /^[A-Za-z ]{3,}$/;
  let emailRegex = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
  let phoneRegex = /^[0-9]{10}$/;
  let passwordRegex = /^(?=.*[A-Z])(?=.*[0-9]).{6,}$/;

  // Validation
  if (!nameRegex.test(name)) {
    errorMsg.textContent = "Name must be at least 3 letters.";
    return;
  }
  if (!emailRegex.test(email)) {
    errorMsg.textContent = "Enter a valid email address.";
    return;
  }
  if (!phoneRegex.test(phone)) {
    errorMsg.textContent = "Phone number must be 10 digits.";
    return;
  }
  if (!passwordRegex.test(password)) {
    errorMsg.textContent = "Password must be 6+ chars, include a number & uppercase.";
    return;
  }
  if (course === "") {
    errorMsg.textContent = "Please select a course.";
    return;
  }

  // Success
  errorMsg.style.color = "green";
  errorMsg.textContent = "Registration Successful!";
});

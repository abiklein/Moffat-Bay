/** Silver Team: Shayla Bradley, Patrick Ellis, Abigail Klein, Yawa Hallo */

function validateForm() {
	var email = document.forms["registrationForm"]["email"].value;
	var firstName = document.forms["registrationForm"]["firstName"].value;
	var lastName = document.forms["registrationForm"]["lastName"].value;
	var telephone = document.forms["registrationForm"]["telephone"].value;
	var password = document.forms["registrationForm"]["password"].value;
	var confPassword = document.forms["registrationForm"]["confPassword"].value;

	// Validation logic
	var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
	var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z]).{8,}$/;

	var errors = [];

	if (email === "") {
		document.getElementById("emailError").innerHTML = "An Email is Required";
		errors.push("no email");
	} else if (!emailRegex.test(email)) {
		document.getElementById("emailError").innerHTML = "Please Enter a Valid Email";
		errors.push("invalid email");
	} else {
		document.getElementById("emailError").innerHTML = "";
	}

	if (firstName === "") {
		document.getElementById("fNameError").innerHTML = "A First Name is Required";
		errors.push("no first name");
	} else {
		document.getElementById("fNameError").innerHTML = "";
	}

	if (lastName === "") {
		document.getElementById("lNameError").innerHTML = "A Last Name is Required";
		errors.push("no last name");
	} else {
		document.getElementById("lNameError").innerHTML = "";
	}

	if (telephone === "") {
		document.getElementById("phoneError").innerHTML = "A Telephone number is Required";
		errors.push("no phone number");
	} else {
		document.getElementById("phoneError").innerHTML = "";
	}

	if (password === "") {
		document.getElementById("pwordError").innerHTML = "A Password is Required";
		errors.push("no password");
	} else if (!passwordRegex.test(password)) {
		document.getElementById("pwordError").innerHTML = "Password Needs to Contain: 8 characters, 1 uppercase letter, and 1 lowercase letter";
		errors.push("password doesnt meet criteria");
	} else {
		document.getElementById("pwordError").innerHTML = "";
	}

	if (password !== confPassword) {
		document.getElementById("confPwordError").innerHTML = "Passwords Need to Match";
		errors.push("passwords dont match");
	} else {
		document.getElementById("confPwordError").innerHTML = "";
	}

	// Check if all input fields are valid
	if (errors.length === 0) {
		return true; // Allow form submission
	} else {            
		return false; // prevent submission
	}
}

// Enable/disable submit button based on form validity
function toggleSubmitButton() {
	var isValid = validateForm();
	var submitButton = document.getElementById("submitBtn");
	submitButton.disabled = !isValid;
}
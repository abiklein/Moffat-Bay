/**
 * Silver team: Shayla Bradley, Patrick Ellis, Abigail Klein, Yawa Hallo
Date: 9-3-23
CSD 460: Assignment 6
Change Password Validation
 */
function validateForm() {
	var username = document.forms["changeForm"]["username"].value;
	var password = document.forms["changeForm"]["password"].value;
	var confPassword = document.forms["changeForm"]["confPassword"].value;

	//Validation logic
	var usernameRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
	var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z]).{8,}$/;

	var errors = [];

	if (username === "") {
		document.getElementById("usernameError").innerHTML = "A Username (Your Email) is Required";
		errors.push("no username");
	} else if (!usernameRegex.test(username)) {
		document.getElementById("usernameError").innerHTML = "Please Enter a Valid username";
		errors.push("invalid username");
	} else {
		document.getElementById("usernameError").innerHTML = "";
	}

	

	if (password === "") {
		document.getElementById("pwordError").innerHTML = "A Password is Required";
		errors.push("no password");
	} else if (!passwordRegex.test(password)) {
		document.getElementById("pwordError").innerHTML = "Password Does Not Meet Requirements";
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
	if(!isValid){
	document.getElementById("submitBtn").className = "form_button_false";
	//document.getElementById("submitBtn").style.backgroundColor = "#A9A9A9";
	}
	else if(isValid){
	document.getElementById("submitBtn").className = "form_button";
	 //document.getElementById("submitBtn").style.backgroundColor = "#AA6D23";
	 //change hover state of button
	 
	}
}
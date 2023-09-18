/**
 * Silver team: Shayla Bradley, Patrick Ellis, Abigail Klein, Yawa Hallo
Date: 9-17-23
CSD 460: Assignment 9
Reservation Search Page
 */

function validateForm() {
	var email = document.forms["searchForm"]["email"].value;
	var reservationID = document.forms["searchForm"]["reservationID"].value;

	// Validation logic
	var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
	var errors = [];

	if (email === "" && reservationID ==="") {
		document.getElementById("emailError").innerHTML = "Please Enter Either Your Email or Reservation ID";
		errors.push("no email or reservation ID");
	} else if (email != "" && reservationID !=""){
		document.getElementById("emailError").innerHTML = "Please Enter Either Your Email or Reservation ID";
		errors.push("Both fields filled with values");
	}
	else if (email != "" && !emailRegex.test(email)) {
		document.getElementById("emailError").innerHTML = "Please Enter a Valid Email";
		errors.push("invalid email");
	} else {
		document.getElementById("emailError").innerHTML = "";
	}


	// Check if all input fields are valid
	if (errors.length === 0) {
		return true; // Allow form submission
	} else {            
		return false; // prevent submission
	}
}

function checkInput1(input) {
  if (input.value.length > 0) {
    document.getElementById("email").disabled = true;
    document.getElementById("email").style.backgroundColor = "#f2f2f2";
  } 
  else {
    document.getElementById("email").disabled = false;
    document.getElementById("email").style.backgroundColor = "#ffffff";
  }
}
function checkInput2(input) {
  if (input.value.length > 0) {
    document.getElementById("reservationID").disabled = true;
    document.getElementById("reservationID").style.backgroundColor = "#f2f2f2";
  } else {
    document.getElementById("reservationID").disabled = false;
    document.getElementById("reservationID").style.backgroundColor = "#ffffff";
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
	document.getElementById("submitBtn").className = "form__button";
	 //document.getElementById("submitBtn").style.backgroundColor = "#AA6D23";
	 //change hover state of button
	 
	}
	}
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <!--Fonts-->
    <!--Poppins-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,500;0,600;0,700;1,400&display=swap" rel="stylesheet">
    <!--P22 Eaglefeather-->
    <link rel="stylesheet" href="https://use.typekit.net/sve2obm.css">

    <!--Width = device width with an initial scale of 1.0-->
    <meta name ="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8">

    <!-- CSS Files -->
    <link rel="stylesheet" href="css/index.css" />
    <link rel="stylesheet" href="css/register.css" />

    <!-- Title of your web page -->
    <title>Moffat Bay Lodge</title>
</head>
<body>
<div class="nav"><jsp:include page="navbar.jsp" flush="true"/></div>
<form class="form" id="createAccount" action="registerSubmit.jsp">
            <img src="media/logo_black.png" id="logo" width="200">
            <h1 class="form__title">Account Registration</h1>
            <div class="form__input-group">
                <input type="text" name="signupEmail" class="form__input" placeholder="Email Address" required>
            </div>
            <div class="form__input-group">
                <input type="text" name="signupFirstName" class="form__input" placeholder="First Name" required>
            </div>
            <div class="form__input-group">
                <input type="text" name="signupLastName" class="form__input" placeholder="Last Name" required>

            </div>
            <div class="form__input-group">
                <input type="text" name="signupTelephone" class="form__input" placeholder="Telephone Number" required>
            </div>
            <div class="form__input-group">
                <p>Password must contain at least:</p>
                <ul>
                    <li>8 characters</li>
                    <li>1 uppercase letter</li>
                    <li>1 lowercase letter</li>
                </ul>
                <input type="password" name="signupPassword" class="form__input" placeholder="Password" required>
                <div class="form__input-error-message"></div>
            </div>
            <div class="form__input-group">
                <input type="password" name="signupConfirmPassword" class="form__input" placeholder="Confirm password" required>
                <div class="form__input-error-message"></div>
            </div>
            <button class="form__button" type="submit" value="Register">Create Your Account</button>
            <p class="form__text">
                By creating an account, you agree to our <a class="form__link" href="#" id="linkTerms">Terms</a></br>
                Already have an account? <a class="form__link" href="login.jsp" id="linkLogin">Sign in</a>
            </p>
        </form>
<jsp:include page="footer.jsp" flush="true"/>
</body>
</html>
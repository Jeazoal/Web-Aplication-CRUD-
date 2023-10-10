<%--
  Created by IntelliJ IDEA.
  User: Jeazoal
  Date: 6/10/2023
  Time: 17:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Coffe Souls | Login & Register</title>
    <link rel="stylesheet" href="Styles/Style-LoginRegister.css" />
    <!-- Unicons -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css" />
</head>
<body>
<!-- Header -->
<header class="header">
    <nav class="nav">
        <a href="#" class="nav_logo">Coffe Souls</a>

        <ul class="nav_items">
            <li class="nav_item">
                <a href="Login.jsp" class="nav_link">Home</a>
                <a href="#" class="nav_link">Contact</a>
            </li>
        </ul>

        <button class="button" id="form-open">Login</button>
    </nav>
</header>

<!-- Home -->
<section class="home">
    <div class="form_container">
        <i class="uil uil-times form_close"></i>
        <!-- Login From -->
        <div class="form login_form">
            <form action="LoginServlet" method="post">
                <h2>Login</h2>

                <div class="input_box">
                    <input type="text" id="nombreUsuario" name="nombreUsuario" required placeholder="Enter your User" />
                    <i class="uil uil-user user"></i>
                </div>
                <div class="input_box">
                    <input type="password" id="contraseña" name="contraseña" required placeholder="Enter your Password"/>
                    <i class="uil uil-lock password"></i>
                    <i class="uil uil-eye-slash pw_hide"></i>
                </div>

                <div class="option_field">
              <span class="checkbox">
                <input type="checkbox" id="check" />
                <label for="check">Remember me</label>
              </span>
                    <a href="#" class="forgot_pw">Forgot password?</a>
                </div>

                <button class="button">Login Now</button>

                <div class="login_signup">Don't have an account? <a href="#" id="signup">Signup</a></div>
            </form>
        </div>

        <!-- Signup From -->
        <div class="form signup_form">
            <form action="RegistroServlet" method="post">
                <h2>Signup</h2>


                <div class="input_box">
                    <input type="text" id="nombreUser" name="nombreUser" placeholder="Enter your User" required pattern="[A-Za-z0-9]{4,}">
                    <i class="uil uil-user user"></i>
                </div>
                <div class="input_box">
                    <input type="email" id="correo" name="correo" placeholder="Enter your Email" required>
                    <i class="uil uil-envelope-alt email"></i>
                </div>
                <div class="input_box">
                    <input type="password" id="contraseñaregistro" name="contraseñaregistro" placeholder="Enter your Password" required pattern=".{8,}">
                    <i class="uil uil-lock password"></i>
                    <i class="uil uil-eye-slash pw_hide"></i>
                </div>
                <input class="button" type="submit" value="Signup Now">
                <div class="login_signup">Already have an account? <a href="#" id="login">Login</a></div>
            </form>
        </div>
    </div>
</section>

<script src="Scripts/Login.js"></script>
</body>
</html>
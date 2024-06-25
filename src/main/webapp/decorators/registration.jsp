<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!doctype html>
<html lang="en">
<head>
    <title>ALOHCMUTE</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">



    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <link rel="stylesheet" href="/template/register.css">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<div class="login bg-light container-fluid">
    <div class="container">

        <!-- title -->
        <div class="login__title justify-content-center row p-3">
            <p class="justify-content-center row text-primary">ALOHCMUTE</p>
        </div>
        <!-- success message  -->
                <c:if test="${param.success != null}">
                    <div class="alert alert-info"> You are successfully registered to our awesome app!</div>
                </c:if>
		<c:if test="${param.checkpass != null}">
                    <div class="alert alert-info" style="background-color:red;color:white"> Your password and checkpass do not match! Please check it.</div>
                </c:if>
       <c:if test="${param.emailexist != null}">
                        <div class="alert alert-info" style="background-color:red;color:white"> Your email already exists. Please register with another email.</div>
                    </c:if>
        <div class="row container-fluid">
            <div class="col-7 justify-content-center d-flex">
                <img src="/assets/bg_login.png" alt="Login Img" class="login__img ml-4">
            </div>

            <div class="login__form col-4 bg-white p-4 ms-4">
                <h3 class="justify-content-center pt-2 text-center">Registration</h3>
                <form action="${pageContext.request.contextPath}/registration" method="post" >
                    <div class="form-group">
                        <label class="control-label" for="Email"> Email </label>
                        <input type="text" id="Email" class="form-control" name="email" required autofocus="autofocus"
                               value="${userdto.email}"/>
                    </div>
                    

                    <div class="form-group">
                        <label class="control-label" for="Username"> UserDisplayName </label>
                        <input type="text" id="Username" class="form-control" name="userName" required
                               value="${userdto.userName}"/>
                    </div>

                    <div class="form-group">
                        <label class="control-label" for="Password"> Password </label>
                        <input type="password" id="Password" class="form-control" name="password" required
                               value="${userdto.password}"/>
                    </div>

                   <div class="form-group">
                    <label class="control-label" for="checkpass"> Check Password </label>
                    <input type="password" id="checkpass" class="form-control" name="checkPass" required/>
                </div>

                

                    <div class="form-group">
                        <button type="submit" class="btn btn-success" style="width:100%">Register</button>
                        <br>
                        <span style="margin-top: 20px; display: block;">Already registered? <a href="${pageContext.request.contextPath}/login">Login here</a></span>
                    </div>
                </form>
                
            </div>
        </div>
    </div>
</div>

</body>
</html>



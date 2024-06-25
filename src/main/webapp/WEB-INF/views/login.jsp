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

    <link rel="stylesheet" href="/template/login.css">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body>
<div class="login bg-light container-fluid">
    <div class="container">

        <!-- title -->
        <div class="login__title justify-content-center row p-3">
            <p class="justify-content-center row text-primary">ALOHCMUTE</p>
        </div>
		<c:if test="${param.emailwrong != null}">
                    <div class="alert alert-info" style="background-color:red;color:white"> Your email is not correct</div>
                	</c:if>
        <c:if test="${param.passwordwrong != null}">
                    	<div class="alert alert-info" style="background-color:red;color:white"> Your password is not correct</div>
                	</c:if>
        <div class="row container-fluid">
            <div class="col-7 justify-content-center d-flex">
                <img src="/assets/bg_login.png" alt="Login Img" class="login__img ml-4">
            </div>

            <div class="login__form col-4 bg-white p-4 ms-4">
                <h3 class="justify-content-center pt-2 text-center">Sign In</h3>
                <form action="#" class="signin-form p-2" method="POST">
                    <div class="form-group mb-3">
                        <label class="label mb-2" for="Email">Email</label>
                        <input type="text" id="Email" name="email" class="form-control" placeholder="Email" required autofocus="autofocus">
                    </div>
                      	
                    <div class="form-group mb-3">
                        <label class="label mb-2" for="Password">Password</label>
                        <input type="password" id="Password" name="password" class="form-control" placeholder="Password" required>
                    </div>                                  
                	
              
                    <div class="form-group">
                        <button type="submit" class="form-control btn btn-primary rounded submit px-3 mb-3 mt-2">Sign In</button>
                        <span>Your don't have an account? <a href="<%=request.getContextPath()%>/registration">Registration</a></span>
                    </div>
                    
                    

                    
                </form>
                
            </div>
        </div>
    </div>
</div>

</body>
</html>



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

        <div class="row container-fluid">
            <div class="col-7 justify-content-center d-flex">
                <img src="/assets/bg_login.png" alt="Login Img" class="login__img ml-4">
            </div>

            <div class="login__form col-4 bg-white p-4 ms-4">
                <h3 class="justify-content-center pt-2 text-center">Sign In</h3>
                <form action="#" class="signin-form p-2">
                    <div class="form-group mb-3">
                        <label class="label mb-2">Username</label>
                        <input type="text" class="form-control" placeholder="Username" required>
                    </div>
                    <div class="form-group mb-3">
                        <label class="label mb-2">Password</label>
                        <input type="password" class="form-control" placeholder="Password" required>
                    </div>
                    <div class="form-group">
                        <button onclick="window.location.href='/home'" type="submit" class="form-control btn btn-primary rounded submit px-3 mb-3 mt-2">Sign In</button>
                    </div>

                    <div class="form-group d-flex mb-4">
                        <div class="d-flex justify-content-start">
                            <input type="checkbox" checked>
                            <label class="checkbox-wrap checkbox-primary ms-1">Remember Me
                                <span class="checkmark"></span>
                            </label>
                        </div>
                        <div class="d-flex ms-auto">
                            <a href="#">Forgot Password</a>
                        </div>
                    </div>
                </form>
                <!-- <div class="login__socialMedia d-flex justify-content-around mb-2 ps-5 pe-5">
                    <i class="fa-brands fa-google"></i>
                    <i class="fa-brands fa-facebook"></i>
                    <i class="fa-brands fa-instagram"></i>
                    <i class="fa-brands fa-github"></i>
                </div> -->
                <p class="text-center">Not a member? <a data-toggle="tab" href="#signup" data-bs-toggle="modal" data-bs-target="#modalForm">Sign Up</a></p>
            </div>
        </div>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="modalForm" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header text-center">
                <h4 class="modal-title" id="exampleModalLabel">Sign Up</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="mb-3 ms-3 me-3">
                        <label class="form-label">Họ và Tên</label>
                        <input type="text" class="form-control" name="username" placeholder="Username" />
                    </div>
                    <div class="mb-3 ms-3 me-3">
                        <label class="form-label">Email Address</label>
                        <input type="text" class="form-control"  name="username" placeholder="Username" />
                    </div>
                    <div class="mb-3 ms-3 me-3">
                        <label class="form-label">Số điện thoại</label>
                        <input type="password" class="form-control"  name="password" placeholder="Số điện thoại" />
                    </div>
                    <div class="mb-3 ms-3 me-3">
                        <label class="form-label">Password</label>
                        <input type="password" class="form-control" name="password" placeholder="Password" />
                    </div>
                    <div class="mb-3 ms-3 me-3">
                        <label class="form-label">Nhập lại Password</label>
                        <input type="password" class="form-control"  name="password" placeholder="Nhập lại password" />
                    </div>
                    <div class="modal-footer d-flex justify-content-center">
                        <button type="submit" class="btn btn-success" style="width: 100%;">Sign Up</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>



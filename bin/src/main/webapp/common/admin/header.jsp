<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="/common/taglib.jsp"%>
<nav class="navbar navbar-expand-sm navbar-dark bg-primary ps-3 fixed-top">
    <div class="container-fluid d-flex justify-content-between ">
        <a class="navbar-brand ms-3" href="#">ALOHCMUTE</a>
        <div style="width: 500px"  id="navbarsExampleDefault">
            <ul class="navbar-nav m-auto">
                <li class="nav-item active">
                    <a style="color: white" class="nav-link" href="/home">Home<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a style="color: white" class="nav-link" href="#">Trang cá nhân</a>
                </li>
            </ul>
        </div>
        <form action="/action_page.php" style="width: 250px">
            <div class="navbar__search me-3" style="display: flex; margin-left: -50px">
                <input type="text" class="form-control" id="search" placeholder="Search..." >
<%--                <div class="input-group-append">--%>
<%--                    <i class="fa fa-search" style="cursor: pointer;"></i>--%>
<%--                </div>--%>
                <div class="input-group-append" style="justify-items: center; margin: 5px -25px;">
                    <i class="fa fa-search" style="cursor: pointer;"></i>
                </div>
            </div>
        </form>
    </div>

    <div class="collapse navbar-collapse me-4" id="mynavbar">

        <div class="dropdown ">
            <img src="assets/avt-profile.png" alt="avatar" class="avatar-profile dropdown-toggle" data-bs-toggle="dropdown" >
            <ul class="dropdown-menu dropdown-menu-end">
                <li class="mb-2">
                    <a class="dropdown-item" href="#">
                        <i class="fa-solid fa-user me-1"></i>
                        Trang cá nhân
                    </a>
                </li>
                <li><hr class="dropdown-divider"></li>
                <li class="mb-2">
                    <a class="dropdown-item" href="/">
                        <i class="fa-solid fa-right-from-bracket me-1"></i>
                        Log out
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<%--<nav class="navbar navbar-expand-md navbar-dark bg-dark">--%>
<%--    <div class="container">--%>
<%--        <a class="navbar-brand" href="index.html">Simple Ecommerce</a>--%>
<%--        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">--%>
<%--            <span class="navbar-toggler-icon"></span>--%>
<%--        </button>--%>
<%--        <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">--%>
<%--            <ul class="navbar-nav m-auto">--%>
<%--                <li class="nav-item active">--%>
<%--                    <a class="nav-link" href="<c:url value = '/login'/>">Home <span class="sr-only">(current)</span></a>--%>
<%--                </li>--%>
<%--                <li class="nav-item">--%>
<%--                    <a class="nav-link" href="<c:url value = '/logout'/>">Logout</a>--%>
<%--                </li>               --%>
<%--            </ul>--%>
<%--            <form class="form-inline my-2 my-lg-0">--%>
<%--                <div class="input-group input-group-sm">--%>
<%--                    <input type="text" class="form-control" placeholder="Search...">--%>
<%--                    <div class="input-group-append">--%>
<%--                        <button type="button" class="btn btn-secondary btn-number">--%>
<%--                            <i class="fa fa-search"></i>--%>
<%--                        </button>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <a class="btn btn-success btn-sm ml-3" href="cart.html">--%>
<%--                    <i class="fa fa-shopping-cart"></i> Cart--%>
<%--                    <span class="badge badge-light">3</span>--%>
<%--                </a>--%>
<%--            </form>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</nav>--%>

<%--<section class="jumbotron text-center">--%>
<%--    <div class="container">--%>
<%--        <h1 class="jumbotron-heading">E-COMMERCE BOOTSTRAP THEME</h1>--%>
<%--        <p class="lead text-muted mb-0">Simple theme for e-commerce build with Bootstrap 4.0.0. Pages available : home, category, product, cart  contact</p>--%>
<%--    </div>--%>
<%--</section>--%>
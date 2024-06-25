<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="/common/taglib.jsp"%>
<nav class="navbar navbar-expand-sm navbar-dark bg-primary ps-3 fixed-top">
    <div class="container-fluid d-flex justify-content-between ">
        <a class="navbar-brand ms-3" href="/home">ALOHCMUTE</a>
        <div style="width: 500px"  id="navbarsExampleDefault">
            <ul class="navbar-nav m-auto">
                <li class="nav-item active">
                    <a style="color: white" class="nav-link" href="/home">Home<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
				    <a style="color: white" class="nav-link" href="/profile">Trang cá nhân</a>
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
    
    <a href="/message" style="color: white; font-size: 20px; cursor: pointer; text-decoration: none;" class="ms-3 me-4">
            <i class="fa fa-comments"></i></a>

    <div class="collapse navbar-collapse me-4" id="mynavbar">

        <div class="dropdown ">
            <img src="/assets/avt-profile.png" alt="avatar" class="avatar-profile dropdown-toggle" data-bs-toggle="dropdown" >
            <ul class="dropdown-menu dropdown-menu-end">
                <li class="mb-2">
                    <a class="dropdown-item" href="/profile">
                        <i class="fa-solid fa-user me-1"></i>
                        Trang cá nhân
                    </a>
                </li>
                <li><hr class="dropdown-divider"></li>
                <li class="mb-2">
                    <a class="dropdown-item" href="/logout">
                    <a class="dropdown-item" href="/login">
                        <i class="fa-solid fa-right-from-bracket me-1"></i>
                        Log out
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

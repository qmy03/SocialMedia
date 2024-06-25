<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>ALOHCMUTE</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <link rel="stylesheet" href="/template/home.css">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>
<!-- content-area------------ -->
<div class="row bg-light">
    <!-- leftSidebar -->
    <div class="leftSidebar col-3">
        <div class="card chat-app">
			<div id="plist" class="people-list">
				<h4>Tin nhắn</h4>
					<!-- Search form -->
                    <form action="/message/findUserName=${userName}" method="POST">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fa fa-search"></i></span>
                            </div>
                            <input type="text" class="form-control" name="userName" value='${userName}' placeholder="Search...">
                            <div class="input-group-append">
                                <button type="submit" class="btn btn-primary">Search</button>
                            </div>
                        </div>
                    </form>
				<ul class="list-unstyled chat-list mt-2 mb-0">
					<c:forEach var="user" items="${usersList}">
						<li class="clearfix">
							<c:if test="${user.userId ne userId }">
								<a href="<c:url value='/message/receiverId=${user.userId}'/>">
									<img src="/assets/avt-profile.png" alt="avatar">
									<div class="about">
										<div class="name">${user.userName}</div>
										<div class="status">
											<c:choose>
                    							<c:when test="${user.status eq true}">
                        							<i class="fa fa-circle online"></i> Online
                    							</c:when>
                    							<c:otherwise>
                        							<i class="fa fa-circle offline"></i> Offline
                    							</c:otherwise>
                							</c:choose>
										</div>
									</div>
								</a>
							</c:if>
						</li>
					</c:forEach>
				</ul>
			</div>
    	</div>
    </div>

    <!-- content-area -->
    <div class="content-area col-9 bg-white"></div>

</div>
<script src="function.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript"></script>
</body>
</html>
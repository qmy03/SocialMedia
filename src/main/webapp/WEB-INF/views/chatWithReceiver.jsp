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
    <div class="content-area col-9 bg-white">
        <div class="chat d-flex flex-column h-100">
        	<form action="/sendMessage" method="POST">
			<div class="chat-header clearfix">
				<div class="row">
					<div class="col-lg-6" style="display: flex; align-items: center;">
    					<a href="javascript:void(0);" data-toggle="modal" data-target="#view_info">
        					<img src="/assets/avt-profile.png" alt="avatar" style="width: 50px; margin-right: 10px;">
    					</a>
    					<div class="chat-about">
        					<h6 class="m-b-0">${receiver.userName }</h6>
        					<c:choose>
                    			<c:when test="${receiver.status eq true}">
                        			<i class="fa fa-circle online"></i> Online
                    			</c:when>
                    			<c:otherwise>
                        			<i class="fa fa-circle offline"></i> Offline
                    			</c:otherwise>
                			</c:choose>
    					</div>
					</div>

					<div class="col-lg-6 text-lg-end text-sm-start mt-lg-0 mt-sm-3">
						<a href="javascript:void(0);" class="btn btn-outline-info"><i class="fa fa-phone"></i></a>
						<a href="javascript:void(0);" class="btn btn-outline-primary" id="imageButton"><i class="fa fa-image"></i></a>
						<a href="javascript:void(0);" class="btn btn-outline-info"><i
							class="fa fa-cogs"></i></a> <a href="javascript:void(0);"
							class="btn btn-outline-warning"><i class="fa fa-question"></i></a>
						<div class="mb-3">
							<input type="hidden" name="receiverId" value="${receiverId}">
            				<input type="hidden" name="status" value="True">
            				<input type="hidden" name="users.userId" value="${userId}">
							<input type="file" class="form-control visually-hidden" id="imageInput" name="image" value="${message.image}" accept="image/*">
						</div>
					</div>
				</div>
			</div>
			</form>
			<div class="chat-history">
				<ul class="m-b-0">
					<c:forEach var="message" items="${receiverMessage}">
            			<c:choose>
                			<c:when test="${receiverId ne userId && userId eq message.users.userId}">
                    			<li class="clearfix">
                        			<div class="message-data text-lg-end text-sm-start mt-lg-0 mt-sm-3">
                            			<span class="message-data-time">${message.createTime}</span>
                            			<img src="/assets/avt-profile.png" alt="avatar" style="width: 50px;">
                        			</div>
                        			<div class="message other-message float-right text-lg-end text-sm-start mt-lg-0 mt-sm-3">${message.content}</div>
                    			</li>
                			</c:when>
                			<c:otherwise>
                    			<li class="clearfix">
                        			<div class="message-data">
                            			<span class="message-data-time">${message.createTime}</span>
                        			</div>
                        			<div class="message my-message">${message.content}</div>
                    			</li>
                			</c:otherwise>
            			</c:choose>
        			</c:forEach>
				</ul>
			</div>
			
			<div class="flex-grow-1"></div>
			<form action="/sendMessage" method="POST">
			<div class="chat-message clearfix">
            	<div class="input-group mb-0">
            		<input type="hidden" name="receiverId" value="${receiverId}">
            		<input type="hidden" name="status" value="True">
            		<input type="hidden" name="users.userId" value="${userId}">
                	<input type="text" class="form-control" name="content" value="${message.content}" placeholder="Enter text here..."></input>
                	<div class="input-group-append">
                    	<button type="submit" class="btn btn-outline-secondary" type="button">
                        	<i class="fas fa-paper-plane fa-xs"></i>
                    	</button>
                	</div>
            	</div>
        	</div>
        	</form>
		</div>
    </div>
    
</div>
<script src="function.js"></script>
<script>
  document.getElementById('imageButton').addEventListener('click', function() {
    // Trigger click on the hidden file input when the button is clicked
    document.getElementById('imageInput').click();
  });

  // Add an event listener to handle file selection
  document.getElementById('imageInput').addEventListener('change', function() {
    // Handle the selected file (you can access it using this.files[0])
    var selectedImage = this.files[0];

    // Add your code to process the selected image here
    console.log('Selected Image:', selectedImage);
  });
</script>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript"></script>
</body>
</html>
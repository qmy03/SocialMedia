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
        <div class="advertisement bg-white mt-3 ms-3">
            <div class="advertisement__title d-flex m-2 pt-3 ps-3">
                <h6 class="mb-1" style="font-size: 14px;">Advertisement</h6>
            </div>
            <img src="/assets/Advertisement-img.png" alt="" class="advertisement__img me-2 ms-2 pe-3 ps-3 pb-3">
        </div>
        <div class="notification bg-white mt-3 ms-3">
            <div class="advertisement__title  m-2 pt-3 ps-3 d-flex">
                <i class="fa-solid fa-bell me-2"></i>
                <h6 class="mb-1 text-" >Notification</h6>
            </div>
            <div class="notification__content m-2 pt-3 ps-3 pb-3 d-flex">
                <h6 class="mb-1" style="font-size: 14px;">Nguyễn Chí Thanh đã nhắc đến bạn trong 1 bình luận</h6>

            </div>

        </div>
    </div>
    <!-- content-area -->
    <div class="content-area col-6 bg-white">

           <a href="/add" class="btn btn-primary justify-content-between" style="width:100%">Post</a>

        <c:forEach items="${posts}" var="post" varStatus="loop">
            <div class="status bg-white">
                <div class="status__userProfile d-flex m-2 pt-3 ps-3">
                    <img src="/assets/avt-profile.png" alt="" class="status__userImg me-1">
                    <div>
                        <h6 class="mb-1" style="font-size: 14px;">${post.users.userName}</h6>
                        <p class="mb-1" style="font-size: 12px;">${post.privacyLevel == true ? 'Public': 'Private'}</p>
                        <p class="mb-1" style="font-size: 12px;">${post.postTime}</p>
                    </div>
                </div>
                <div class="status__content">
                    <p class="ms-4 me-5">${post.content}</p>
                    <c:if test="${not empty base64Images[loop.index]}">
                    	<img src="data:image/jpeg;base64,${base64Images[loop.index]}" alt="img" class="status__contentImg ms-4 me-5">
					</c:if>
                </div>
                <hr class="ms-4 me-5">
                <div class="activity-icon ms-3 pb-3" style="display: flex;  justify-content: space-between;">
                	<div >
                        <a href="#" class="btn btn-link" onclick="likePost(${post.postId})">
                            <i id="likeIcon_${post.postId}" class="${likesService.isLikedByUser(userId, post.postId) ? 'fa-solid fa-thumbs-up' : 'fa-regular fa-thumbs-up'} ps-3 pe-3"></i>
                            <span id="likeCount_${post.postId}">${likesService.getTotalLikesByPostId(post.postId)}</span>
                        </a>
                        <a href="javascript:void(0);" class="btn btn-link toggle-comments" data-post-id="${post.postId}">
                            <i class="fa-regular fa-comment ps-3 pe-3"></i>
                            <span id="commentCount_${post.postId}" class="comment-count">
                                    ${commentService.getTotalCommentByPostId(post.postId)}
                            </span>
                        </a>
<%--                        <a href="/comments/${post.postId}" class="btn btn-link"><i class="fa-regular fa-comment ps-3 pe-3"> 50 </i></a>--%>
                    </div>
                    <div class="me-4">
                        <c:if test="${userId eq post.users.userId}">
                            <a href="/edit/${post.postId}"><i class="fa-solid fa-pen-to-square ps-3 pe-3"></i></a>
                            <a data-bs-toggle="modal" data-bs-target="#ModalDeletePost${post.postId}" data-post-id="${post.postId}">
                                <i class="fa-solid fa-trash ps-3 pe-3 text-danger"></i>
                            </a>
                        </c:if>
                    </div>
               </div>
            		<!-- The Modal Button Delete Post-->
					<div class="modal" id="ModalDeletePost${post.postId}">
					  <div class="modal-dialog">
					    <div class="modal-content">


					      <!-- Modal body -->
					      <div class="modal-body">
					        Bạn có muốn xóa chứ ?
					      </div>

					      <!-- Modal footer -->
					      <div class="modal-footer">
					     	<a href="/delete/${post.postId}" type="button" class="btn btn-danger">Delete</a>
					        <button type="button" class="btn btn-success" data-bs-dismiss="modal">Close</button>
					      </div>

					    </div>
					  </div>
					</div>
                <div class="comments-container" id="comments_${post.postId}" style="display: none;">
                    <c:forEach items="${comments}" var="comment" varStatus="commentLoop">

                        <c:if test="${comment.posts.postId eq post.postId}">
                            <div class="comment-container">
                                <div class="status__userProfile d-flex m-2 pt-3 ps-3">
                                    <img src="/assets/avt-profile.png" alt="" class="status__userImg me-1">
                                    <div>
                                        <h6 class="mb-1" style="font-size: 14px;">${comment.users.userName}</h6>
                                        <p class="mb-1" style="font-size: 12px;">${comment.createTime}</p>
                                        <p class="ms-4 me-5">${comment.content}</p>
                                        <c:if test="${not empty base64Images2[commentLoop.index]}">
                                            <img src="data:image/jpeg;base64,${base64Images2[commentLoop.index]}" alt="img"
                                                 class="status__contentImg ms-4 me-5">
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
				<!-- Form for adding new comments -->
				<form class="comment-form ms-4 me-5" action="/comments/save-comment" method="post" enctype="multipart/form-data">
					<input type="hidden" name="postId" value="${post.postId}"></input>
    				<div class="mb-3 position-relative">
        				<textarea class="form-control" rows="3" id="writeComment" name="content" placeholder="Viết bình luận..."></textarea>
        				<div class="d-flex justify-content-end align-items-end position-absolute bottom-0 end-0 p-2">
            				<label style="cursor: pointer;" for="image" class="image-icon-label me-2"><i class="fas fa-image"></i></label>
            				<button type="submit" class="btn btn-primary writeComment__btnComment ms-2"><i class="fas fa-paper-plane fa-xs"></i></button>
        				</div>
    				</div>
    				<hr class="mb-3">
    				<div class="mb-3"><input type="file" class="form-control visually-hidden" id="image" name="image" accept="image/png, image/jpeg"></div>
				</form>

            </div>
        </c:forEach>



    </div>
    <!-- rightSidebar -->
    <div class="rightSidebar col-3 bg-light ps-3">
    	<div id="plist" class="people-list">
        <p class="pt-2 m-2">Người liên Hệ</p>
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
<!-- Add this script section to your HTML file -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
//Hàm kiểm tra trạng thái của like

function likePost(postId) {
    console.log('Like button clicked for post ID: ' + postId);

    // Get the initial total likes
    var initialLikes = parseInt($('#likeCount_' + postId).text());

    $.ajax({
        type: 'GET',
        url: '/like-post?postId=' + postId,
        success: function (data) {
            console.log('Success! Updated like count:', data);

            // Update the like count in the UI
            $('#likeCount_' + postId).text(data);

            // Check if the user has liked the post
            if (data > initialLikes) {
                // Change the like icon to the liked state
                $('#likeIcon_' + postId).removeClass('fa-regular fa-thumbs-up').addClass('fa-solid fa-thumbs-up');
            } else {
                // Change the like icon to the unliked state
                $('#likeIcon_' + postId).removeClass('fa-solid fa-thumbs-up').addClass('fa-regular fa-thumbs-up');
            }
        },
        error: function () {
            console.error('Failed to like the post.');
        }
    });

    // Prevent the default event of the link
    event.preventDefault();
}


$(document).ready(function () {
    // Toggle comments visibility when the "Comment" button is clicked
    $('.toggle-comments').on('click', function () {
        var postId = $(this).data('post-id');
        $('#comments_' + postId).toggle();
    });
});
</script>


</body>
</html>
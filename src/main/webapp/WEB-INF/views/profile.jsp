<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>ALOHCMUTE</title>
	<meta charset="utf-8">
	<meta name="viewport"
		  content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link
			href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap"
			rel="stylesheet">

	<link
			href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
			rel="stylesheet"
			integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
			crossorigin="anonymous">

	<link rel="stylesheet" href="/template/home.css">

	<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

	<link rel="stylesheet"
		  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
		  integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
		  crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body>
<div class="container" style="margin-top: 50px;">
<%--	<c:forEach items="${listProfile}" var="profiles">--%>
	<div class="col-md-12 mb-5">
		<div class="card-body">
				 <div class=" border-right">
                    <div class="d-flex flex-column align-items-center text-center p-2">
                    <img class="rounded-circle mt-5" src="https://e7.pngegg.com/pngimages/799/987/png-clipart-computer-icons-avatar-icon-design-avatar-heroes-computer-wallpaper-thumbnail.png" width="90">
                    <%--<input class="mt-4" type="file" >
                    <button class="btn btn-primary ">Submit</button>--%>
                    </div>
                </div>
			</div>
		</div>
	</div>
	<div class="content-area col-8 bg-white mx-auto pt-0" style="padding-top: 55px;">
		<div class="card mb-3">
			<div class="card-body">

				<div class="row">
					<div class="col-sm-3">
						<h6 class="mb-0">Full Name</h6>
					</div>
					<div class="col-sm-9 text-secondary">${listProfile.users.userName}
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-sm-3">
						<h6 class="mb-0">Gender</h6>
					</div>
					<div class="col-sm-9 text-secondary">${listProfile.users.gender}</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-sm-3">
						<h6 class="mb-0">Email</h6>
					</div>
					<div class="col-sm-9 text-secondary">${listProfile.users.email}</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-sm-3">
						<h6 class="mb-0">Phone</h6>
					</div>
					<div class="col-sm-9 text-secondary">${listProfile.users.phone}</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-sm-3">
						<h6 class="mb-0">Address</h6>
					</div>
					<div class="col-sm-9 text-secondary">${listProfile.users.address}</div>
				</div>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-sm-12">
				<a href="/profile/edit/${userId}"class="btn btn-primary " target="__blank">Chỉnh sửa</a>

			</div>
		</div>
	</div>

	<br>
	<div class="row bg-light bg-white">
		<div class="content-area col-8 bg-white mx-auto pt-0">

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
							<a href="/edit/${post.postId}" > <i class="fa-solid fa-pen-to-square ps-3 pe-3"></i></a>
							<a data-bs-toggle="modal" style="cursor: pointer;" data-bs-target="#ModalDeletePost${post.postId}" data-post-id="${post.postId}"><i class="fa-solid fa-trash ps-3 pe-3 text-danger"></i></a>
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
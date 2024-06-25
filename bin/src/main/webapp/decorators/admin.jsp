<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <!-- Site meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Quan Ly Ban Hang</title>
    <!-- CSS -->
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="//fonts.googleapis.com/css?family=Open+Sans:400,300,600" rel="stylesheet" type="text/css">
    <link href='<c:url value = "/templates/users/css/style.css" />' rel="stylesheet" type="text/css">
</head>

<body>

	<header class="row">
		<div class="col">
			<%@include file="/common/admin/header.jsp"%>
		</div>
	</header>
	
	<main class="container-fluid">
		<div class="row mt-4">
			<div class="col mt-5 mb-5">
				<sitemesh:write property='body'></sitemesh:write>
			</div>
		</div>
	</main>
	
	<footer class="row">
		<div class="col">
			<%@include file="/common/admin/footer.jsp"%>
		</div>
	</footer>
	

	<!-- JS -->
<script src="//code.jquery.com/jquery-3.2.1.slim.min.js" type="text/javascript"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" type="text/javascript"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" type="text/javascript"></script>


</body>
</html>
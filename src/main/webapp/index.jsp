<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>jsp page</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/mystyle.css" type="text/css" />

<style>
	.banner-bg{
	 clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
	}
</style>

</head>
<body>
	<%@include file="navbar.jsp"%>

	<div class="container-fluid p-0 m-0">

		<div  style="background:#0E2954;border-radius:0;" class="jumbotron primary-background text-white">
			<div class="container">
				<h3 class="display-3">Welcome to TechBlog</h3>

				<p>Welcome to Technical blog , world of technology A programming
					language is a system of notation for writing computer programs.[1]
					Most programming languages are text-based formal languages, but
					they may also be graphical. They are a kind of computer language.</p>
					
				<p>The description of a programming language is usually split
					into the two components of syntax (form) and semantics (meaning),
					which are usually defined by a formal language</p>

				<div style="display:flex;justify-content:space-between;width:30%;">
				<button class="btn btn-outlight-light btn-lg">
					<span class="fa fa-user-plus"></span> Start ! its Free
				</button>
				<a href="login_page.jsp" class="btn btn-light btn-lg"><span
					class="fa fa-user-circle fa-spin"></span> Login</a>
				</div>
			</div>

		</div>



	</div>

	<!-- cards -->
	<div class="container">
		<div class="row mb-5">

		<div class="col-md-4">
				<div class="card">
					<div class="card-body">

						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>
			</div>


			<div class="col-md-4">
				<div class="card">
					<div class="card-body">

						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>
			</div>


			<div class="col-md-4">
				<div class="card">
					<div class="card-body">

						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>
			</div>

		
		</div>
		
		<div class="row mt-3">
			
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">

						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>
			</div>


			<div class="col-md-4">
				<div class="card">
					<div class="card-body">

						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>
			</div>


			<div class="col-md-4">
				<div class="card">
					<div class="card-body">

						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>
			</div>

				
		</div>



	</div>
	


	<%@include file="footer.jsp"%>

	<script src="https://code.jquery.com/jquery-3.7.0.min.js"
		integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>
</html>

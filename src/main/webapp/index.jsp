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
				<div class="card" style="min-height: 320px" >
					<div class="card-body" style="display :flex; flex-direction: column; justify-content: space-between;">
                     
                    <div>
						<h5 class="card-title"> Programming Language</h5>
						<p class="card-text">A programming language provides a set of predefined symbols, keywords, and rules that allow programmers to express their ideas and algorithms in a structured and understandable way. It defines the syntax and semantics that determine how code is written and interpreted by a computer or compiler.</p>
					</div>
						<a href="#" class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>
			</div>


			<div  class="col-md-4">
				<div class="card" style="min-height: 320px" >
					<div class="card-body" style="display :flex; flex-direction: column; justify-content: space-between;">
                     <div>
						<h5 class="card-title">Database Management System</h5>
						<p class="card-text">A database management system (DBMS) is software that allows users to manage and manipulate databases. It provides a structured approach for storing, organizing, and retrieving data efficiently.</p>
					</div>
						<a href="#" class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>
			</div>


			<div   class="col-md-4">
				<div class="card" style="min-height: 320px">
					<div class="card-body" style="display :flex; flex-direction: column; justify-content: space-between;">
                      <div>
						<h5 class="card-title">Cloud Platform</h5>
						<p class="card-text">A cloud platform is a virtualized environment that enables users to access and utilize computing resources, such as virtual machines, storage, and networking, through the internet without the need for on-premises hardware infrastructure.</p>
						</div>
						<a href="#" class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>
			</div>

		
		</div>
		
		<div class="row mt-3">
			
			<div   class="col-md-4">
				<div class="card" style="min-height: 320px">
					<div class="card-body"style="display :flex; flex-direction: column; justify-content: space-between;">
                        <div>
						<h5 class="card-title">Machine Learning</h5>
						<p class="card-text">Machine learning is a subset of artificial intelligence that focuses on the development of algorithms and models that allow computers to learn and make predictions or decisions based on data without being explicitly programmed.</p>
					
						</div>
						<a href="#" class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>
			</div>


			<div class="col-md-4">
				<div class="card"  style="min-height: 320px">
					<div class="card-body" style="display :flex; flex-direction: column; justify-content: space-between;">
                       <div>
						<h5 class="card-title">Blockchain</h5>
						<p class="card-text">Blockchain is a distributed and decentralized digital ledger technology that securely records and verifies transactions across multiple computers in a network.</p>
						</div>
						<a href="#" class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>
			</div>


			<div  class="col-md-4">
				<div class="card" style="min-height: 320px">
					<div class="card-body"style="display :flex; flex-direction: column; justify-content: space-between;">
                        <div>
						<h5 class="card-title">Cyber Security</h5>
						<p class="card-text">Cybersecurity aims to maintain the confidentiality of sensitive information by preventing unauthorized access. This involves implementing measures such as encryption, access controls, and secure communication protocols.</p>
						</div>
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

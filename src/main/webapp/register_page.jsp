<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>


<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/mystyle.css" type="text/css" />
</head>
<body>

	<%@include file="navbar.jsp"%>

	<main
		class="d-flex align-items-center primary-background  padding-bottam : 50px">

		<div class="container ">

			<div class="col-md-5  offset-md-3">

				<div class="card ">
					<div
						class="class-header  primary-background text-white text-center">
						<span class="fa fa-3x fa-user-circle"></span> <br> Register
						here
					</div>
					<div class="class-body p-3">
						<form action="RegisterServlet" method="POST" id="reg_form">
							<div class="form-group">
								<label for="exampleInputEmail1">User Name</label> <input
									name="user_name" type="text" class="form-control"
									id="user name" aria-describedby="emailHelp"
									placeholder="Enter name">
							</div>




							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									name="user_email" type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter email"> <small id="emailHelp"
									class="form-text text-muted">We'll never share your
									email with anyone else.</small>
							</div>


							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									name="user_password" type="password" class="form-control"
									id="exampleInputPassword1" placeholder="Password">
							</div>

							<div class="form-group">
								<label for=" gender">Select Gender</label> <br> <input
									type="radio" id="gender" name="gender" value="male">Male
								<input type="radio" id="gender" name="gender" value="female">Female
							</div>

							<div class="from-group">
								<textarea name="about" class="for m-control" rows="3" cols="40"
									placeholder="Enter somthing about your self"></textarea>
							</div>


							<div class="form-check">
								<input name="check" type="checkbox" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">agree terms and condition</label>
							</div>

							<br>
							<div class="container" id="loader" style="display: none;">
								<span class="fa fa-refresh fa-spin fa-2x"></span>
								<h4>please wait...</h4>
							</div>
							<button type="submit" class="btn primary-background">Submit</button>
						</form>


					</div>
				</div>
			</div>
	</main>




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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
$(document).ready(function() {
	  console.log("PAGE BE READY....");
	  $("#reg_form").on('submit', function(event) {
	    event.preventDefault();
	    
	    var form = $(this).serialize();
	    $("#loader").show();
	    $("#submitbtn").hide();
	    $.ajax({
	      url: "RegisterServlet",
	      data: form,
	      type: 'post',
	      success: function(data, textStatus, jqXHR) {
	        console.log(data);
	        $("#loader").hide();
	        $("#submitbtn").show();
	        swal("Registration successful. Please go to the login page.")
	        .then((value) => {
	          window.location = "login_page.jsp"
	        });
	      },
	      error: function(jqXHR, textStatus, errorThrown) {
	        console.log(jqXHR);
	        $("#loader").hide();
	        $("#submitbtn").show();
	      }
	    });
	  });
	});
</script>

</body>
</html>
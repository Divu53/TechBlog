<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Massage"%>
<%@page import="com.tech.blog.entities.User"%>

<%@page errorPage="error.jsp"%>

<%
User user = (User) session.getAttribute("CurrentUser");
if (user == null) {

	response.sendRedirect("login_page.jsp");
}
%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Jsp Page</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="css/mystyle.css" type="text/css" />
</head>
<body>

	<!-- nav bar -->

	<nav class="navbar navbar-expand-lg navbar-light   primary-background">
		<a class="navbar-brand" href="index.jsp"><span
			class="fa fa-asterisk nav-item-color">TechBlog</span></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#"> <span
						class="fa fa-bell-o  nav-item-color">&nbsp;learnCode with
							Divu </span> <span class="sr-only">(current)</span></a></li>



				<li class="nav-item"><a class="nav-link" href="#"><span
						class="fa fa-id-card-o nav-item-color">&nbsp;Contact Us</span></a></li>



				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#add-post-modal"><span
						class="fa fa-asterisk nav-item-color">&nbsp;Do Post</span></a></li>



				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <span
						class="fa fa-check-circle-o nav-item-color">&nbsp;Dropdown</span>
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Programming Language</a> <a
							class="dropdown-item" href="#">Project Implementation</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Data structure</a>
					</div>
			</ul>



			<ul class="navbar-nav mr-right">

				<li class="nav-item"><a class="nav-link" href="#!"
					data-toggle="modal" data-target="#example"><span
						class="fa fa-user-circle nav-item-color">&nbsp;<%=user.getName()%>
					</span></a></li>

				<li class="nav-item"><a class="nav-link" href="LogoutServlet"><span
						class="fa fa-user-plus nav-item-color">&nbsp;Logout</span> </a></li>


			</ul>


		</div>
	</nav>

	<!-- end nav bar -->


	<%
	Massage m = (Massage) session.getAttribute("msg");
	if (m != null) {
	%>
	<div class="alert <%=m.getCssClass()%>" role="alert">
		<%=m.getContent()%></div>
	<%
	session.removeAttribute("msg");
	}
	%>


	<main>
		<div class="container">
			<div class="row mt-4">
				<div class="col-md-4">

					<div class="list-group">
						<a href="#"  onclick="getPosts(0, this)" class=" c-link list-group-item list-group-item-action active">
							All posts </a> 
							
							<%
							
							PostDao d = new PostDao(ConnectionProvider.getConnection());
							ArrayList<Category> list1 = d.getAllCategories();
							for(Category cc : list1)
							{
								
							 %>
							    <a href="#" onclick=k="getPosts(<%= cc.getCid()%> , this)" class=" c-link list-group-item list-group-item-action"><%= cc.getName() %></a>
							 
							 <% 
							}
							 %>
							
					</div>
				</div>

			</div>
			<div class="col-md-8" >
			   <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-4x fa-spin"></i>
                            <h3 class="mt-2">Loading...</h3>
                        </div>
			 <div class="container-fluid" id="post-container">
			
			</div>
              

		</div>


		</div>




	</main>







	<!-- Modal -->
	<div class="modal fade" id="example" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background text-light">
					<h5 class="modal-title " id="exampleModalLabel">TechBlog</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img src="pics/<%=user.getProfile()%>" class="img-fluid"
							style="border-radius: 50%; max-width: 150px;"> <br>
						<h5 class="modal-title" id="exampleModalLabel">
							<%=user.getName()%></h5>

						<div id="profile-details">
							<table class="table">

								<tbody>
									<tr>
										<th scope="row">ID :</th>
										<td><%=user.getId()%></td>

									</tr>
									<tr>
										<th scope="row">Email :</th>
										<td><%=user.getEmail()%></td>

									</tr>
									<tr>
										<th scope="row">Gender :</th>
										<td><%=user.getGender()%></td>

									</tr>
									<tr>
										<th scope="row">Status :</th>
										<td><%=user.getAbout()%></td>

									</tr>
									<tr>
										<th scope="row">Registered</th>
										<td><%=user.getDatatime().toString()%></td>

									</tr>
								</tbody>
							</table>
						</div>




						<div id="profile-edit" style="display: none">
							<h3 class=mb-4>please edit carefully</h3>

							<form action="EditServlet" method="POST"
								enctype="multipart/form-data">
								<table class="table">
									<tr>
										<td>ID :</td>
										<td><%=user.getId()%></td>
									</tr>

									<tr>
										<td>Email :</td>
										<td><input type="email" class="form-control"
											name="user_email" value="<%=user.getEmail()%>"></td>
									</tr>

									<tr>
										<td>Name :</td>
										<td><input type="text" class="form-control"
											name="user_name" value="<%=user.getName()%>"></td>
									</tr>


									<tr>
										<td>Password :</td>
										<td><input type="password" class="form-control"
											name="user_password" value="<%=user.getPassword()%>"></td>
									</tr>

									<tr>
										<td>Gender :</td>
										<td><%=user.getGender().toUpperCase()%></td>
									</tr>

									<tr>
										<td>About :</td>
										<td><textarea rows="5" class="form-control"
												name="user_about"><%=user.getAbout()%></textarea></td>
									<tr>
										<td>New Profile:</td>
										<td><input type="file" name="image" class="form-control">
										</td>
									</tr>
								</table>

								<div class="container">
									<button type="submit" class="btn btn-outline-primary">Save</button>

								</div>


							</form>
						</div>



					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button id="edit-profile-buttons" type="button"
							class="btn btn-primary">EDIT</button>
					</div>
				</div>
			</div>
		</div>
	</div>





	<!-- Modal -->
	<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Provide the
						post Details.....</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">
					<form id="add-post-form" action="AddPostServlet"
						enctype="multipart/form-data" method="post">

						<div class="form-group">
							<select class="form-control" name="cid">
								<option selected="disabled">---Select Category---</option>

								<%
								PostDao postd = new PostDao(ConnectionProvider.getConnection());
								ArrayList<Category> list = postd.getAllCategories();
								for (Category c : list) {
								%>
								<option value="<%=c.getCid()%>"><%=c.getName()%></option>

								<%
								}
								%>
							</select>
						</div>

						<div class="form-group">
							<input name="pTitle" type="text" placeholder="Enter post title"
								class="form-control" />
						</div>

						<div class="form-group">
							<textarea name="pContent" class="form-control"
								style="height: 150px" placeholder="Enter your content"></textarea>
						</div>

						<div class="form-group">
							<textarea name="pCode" class="form-control" style="height: 150px"
								placeholder="Enter your program(if any)"></textarea>
						</div>

						<div class="form-group">
							<label>Select your pic....</label> <br> <input type="file"
								name="pic">
						</div>

						<div class="container text-center">
							<button type="submit" class="btn btn-primary">Post</button>

						</div>


					</form>






				</div>
			</div>
		</div>
	</div>















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
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
		$(document).ready(function() {
			var editStatus = false;
			$("#edit-profile-buttons").click(function() {
				if (editStatus == false) {
					$("#profile-details").hide();
					$("#profile-edit").show();
					editStatus = true;
					$(this).text("Back");
				} else {
					$("#profile-details").show();
					$("#profile-edit").hide();
					editStatus = false;
					$(this).text("Edit");
				}
			})
		});
	</script>





	<script>
	

							$("#add-post-form")
									.on(
											"submit",
											function(event) {
												//this code gets called when form is submitted....
												event.preventDefault();
												console
														.log("you have clicked on submit..")
												var form = new FormData(this);

												//now requesting to server

												$
														.ajax({
															url : "AddPostServlet",
															type : 'POST',
															data : form,
															success : function(
																	data,
																	textStatus,
																	jqXHR) {
																//success ..
																if (data.trim() == 'done'
																		|| jqXHR.status == 200) {
																	swal(
																			"Good job!",
																			"saved successfully",
																			"success");
																} else {
																	swal(
																			"Error!!",
																			"Something went wrong try again...",
																			"error");
																}
															},
															error : function(
																	jqXHR,
																	textStatus,
																	errorThrown) {
																//error..
																swal(
																		"Error!!",
																		"Something went wrong try again...",
																		"error");
															},
															processData : false,
															contentType : false
														})
											})
						})
	</script>
	
	  </script>

        <!--loading post using ajax-->
        <script>

            function getPosts(catId, temp) {
                $("#loader").show();
                $("#post-container").hide()

                $(".c-link").removeClass('active')


                $.ajax({
                    url: "load_posts.jsp",
                    data: {cid: catId},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $("#loader").hide();
                        $("#post-container").show();
                        $('#post-container').html(data)
                        $(temp).addClass('active')

                    }
                })

            }

            $(document).ready(function (e) {

                let allPostRef = $('.c-link')[0]
                getPosts(0, allPostRef)


            })
        </script>
	
	
	
	
	
	}
</body>
</html>
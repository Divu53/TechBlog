<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>

<%@page errorPage="error.jsp"%>

<%
User user = (User) session.getAttribute("CurrentUser");
if (user == null) {
	response.sendRedirect("login_page.jsp");
}
%>


<div class="row">

    <%  
        Thread.sleep(1000);
        PostDao d = new PostDao(ConnectionProvider.getConnection());
        
        int cid = Integer.parseInt(request.getParameter("cid"));
        List<Post> posts = null;
        if (cid == 0) {
            posts = d.getAllList();
        } else {
            posts = d.getPostBycatID(cid);
        }
        
        if (posts.size() == 0) {
            out.println("<h3 class='display-3 text-center'>No Posts in this category..</h3>");
            return;
        }
        
        for (Post p : posts) {
    %>

    <div class="col-md-4 mt-5">
        <div  class="card"  style="min-height: 500px;">
            <div >
             <img height="200px" class="card-img-top" src="blog_pics/<%= p.getpPic()%>" alt="Card image cap">
            </div>
            <div class="card-body">
                <b><%= p.getpTitle()%></b>
                <p><%= p.getpSubContent() %></p>

            </div>
            <div style="background-color:#0E2954;" class="card-footer primary-background text-center">
                <% 
                    LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                %>
                
                <a href="#!" onclick="doLike(<%= p.getPid()%>,<%=user.getId()%>)" class="btn btn-outline-light btn-sm"> <i class="fa fa-thumbs-o-up"></i> <span class="like-counter"><%= ld.countLikeOnPost(p.getPid())%></span>  </a>

                <a href="show_blog_page.jsp?post_id=<%= p.getPid()%>" class="btn btn-outline-light btn-sm">Read More...</a>
                <a href="#!" class="btn btn-outline-light btn-sm"> <i class="fa fa-commenting-o"></i> <span>20</span>  </a>
            </div>

        </div>


    </div>


    <%
        }
        

    %>

        
        <!-- like post  -->

<script>

function doLike(pid, uid)
{
    console.log(pid + "," + uid)
    
    const d = {
        uid: uid,
        pid: pid
    }

    $.ajax({
        url: "LikeServlet",
        data: d,
        success: function (data, textStatus, jqXHR) {

            if (data.trim() == 'true')
            {
                /* let c = $(".like-counter").html();
                c++;
                $('.like-counter').html(c); */
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(errorThrown)
        }
    })
}


</script>



</div>
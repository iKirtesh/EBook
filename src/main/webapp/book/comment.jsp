<%@ page import="entity.Comment" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.User" %>

<div class="container mt-5">
    <!-- Display existing comments -->
    <%
        @SuppressWarnings("unchecked")
        List<Comment> comments = (List<Comment>) request.getAttribute("allComments");
        User user = (User) session.getAttribute("user");

        if (comments != null && !comments.isEmpty()) {
            for (Comment comment : comments) {
                User commentUser = comment.getUser();
    %>
    <div class="card">
        <div class="card-body">
            <!-- Display the user's name instead of ID -->
            <h5 class="card-title"><%= commentUser.getFullName() %></h5>
            <h6 class="card-subtitle mb-2 text-muted"><%= comment.getTimestamp() %></h6>
            <p class="card-text"><%= comment.getCommentText() %></p>

            <!-- Display update and delete options for the logged-in user -->
            <%-- Check if the user is logged in and the comment belongs to the logged-in user --%>
            <% if (user != null && commentUser.getId() == user.getId()) { %>
            <a href="updateComment.jsp?commentId=<%= comment.getCommentId() %>" class="btn btn-sm btn-info">Update</a>
            <a href="deleteComment?deleteComment=<%= comment.getCommentId() %>" class="btn btn-sm btn-danger">Delete</a>
            <% } %>
        </div>
    </div>
    <%
        }
    } else {
    %>
    <p>No comments found.</p>
    <%
        }
    %>

    <!-- Add a new comment -->
    <div class="mt-4">
        <h3>Add Your Comment</h3>
        <%-- Check if the user is logged in before displaying the form --%>
        <%
            if (user != null) {
        %>
        <form action="book/newComment" method="post">
            <div class="form-group">
                <label for="commentText">Your Comment:</label>
                <textarea class="form-control" id="commentText" name="commentText" rows="3" required></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Submit Comment</button>
            <input type="hidden" name="bookId" value="<%= request.getParameter("bookId") %>">
        </form>
        <%
        } else {
        %>
        <p>Please log in to add a comment.
            <a href="#">
                Login here</a>.</p>
        <%
            }
        %>
    </div>
</div>
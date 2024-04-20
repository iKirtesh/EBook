
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>EBook Store</title>
    <%@ include file="components/bootstrap.jsp"%>
</head>
<body>
<%@ include file="navbar.jsp"%>



<%@ include file="components/heroSection.jsp"%>

<div class="container">
    <div class="row">
        <div class="col-md-12 my-3 text-center ">
            <h1 style="font-variant: small-caps;">Recent Books</h1>
        </div>
    </div>
</div>
<%@ include file="/components/Bookcard.jsp"%>
<div class="container">
    <div class="row">
        <div class="col-md-12 my-3 text-center ">
            <a href="#" class="btn btn-primary">View All</a>
        </div>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-md-12 my-3 text-center ">
            <h1 style="font-variant: small-caps;">New Books</h1>
        </div>
    </div>
</div>
<%@ include file="components/cardBook.jsp"%>

<div class="container">
    <div class="row">
        <div class="col-md-12 my-3 text-center ">
            <h1 style="font-variant: small-caps;">Old Books</h1>
        </div>
    </div>
</div>
<%@ include file="book/OldBooks.jsp"%>

<%@ include file="components/footer.jsp"%>
</body>
</html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <title>Add a New Comment</title>
    </head>
    <body>
        

        <security:authorize access="!isAuthenticated()">
            <a href="<c:url value="/login"/>">Login</a>
        </security:authorize>
        <security:authorize access="isAuthenticated()">
            <c:url var="logoutUrl" value="/logout"/>
            <form action="${logoutUrl}" method="post">
                <input type="submit" value="Log out"/>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
        </security:authorize>
            <h1>Add a New Comment</h1>
        <br>
        <form:form method="POST" modelAttribute="pollCommentForm">
            <form:textarea path="comment" rows="5" cols="50" placeholder="Leave Comment Here" required="required"/>
            <form:hidden path="username" value="${principal.username}"/>
            <form:hidden path="poll_id" value="${poll.id}"/><br/>
            <input type="submit" value="Comment"/>
        </form:form>
            <br/>
            <form action="<c:url value="/lecture" />" method="GET">
                <input type="submit" value="Cancel"/>
            </form>
        <br/>
        <br/>
    </body>
</html>


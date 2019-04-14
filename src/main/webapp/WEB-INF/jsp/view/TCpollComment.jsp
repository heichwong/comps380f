<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <title>學生支援</title>
    </head>
    <body>
    <h1>留下評論</h1>

        <security:authorize access="!isAuthenticated()">
            <a href="<c:url value="/login?TC"/>">登入</a>
        </security:authorize>
        <security:authorize access="isAuthenticated()">
            <c:url var="logoutUrl" value="/logout"/>
            <form action="${logoutUrl}" method="post">
                <input type="submit" value="登出"/>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
        </security:authorize>

        <br>
        <form:form method="POST" modelAttribute="pollCommentForm">
            <form:textarea path="comment" rows="5" cols="50" required="required"/>
            <form:hidden path="username" value="${principal.username}"/>
            <form:hidden path="poll_id" value="${poll.id}"/>
            <input type="submit" value="評論"/>
        </form:form>
            <form action="<c:url value="/lecture" />" method="GET">
                <input type="submit" value="取消"/>
            </form>
        <br/>
        <br/>
    </body>
</html>


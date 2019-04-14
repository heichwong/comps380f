<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <title>Add Poll Page</title>
    </head>
    <body>
            
                    <security:authorize access="!isAuthenticated()">
                        <a href="<c:url value="/login"/>">Login</a>
                    </security:authorize>
                    <security:authorize access="isAuthenticated()">
                        <c:url var="logoutUrl" value="/logout"/>
                        <form action="${logoutUrl}" method="post">
                            <input type="submit" value="Log out" class="btn btn-primary"/>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        </form>
                    </security:authorize>
            <br>
            <h1>Create a Poll</h1>
            <form:form method="POST" modelAttribute="pollForm">
                    <form:label path="question">Question:</form:label><br/>
                    <form:textarea path="question" rows="2" cols="50" required="required"/><br/><br/>
                    <form:label path="response1">Answer1:</form:label><br/>
                    <form:textarea path="response1" rows="2" cols="50" required="required"/><br/><br/>
                    <form:label path="response2">Answer2:</form:label><br/>
                    <form:textarea path="response2" rows="2" cols="50" required="required"/><br/><br/>
                    <form:label path="response3">Answer3:</form:label><br/>
                    <form:textarea path="response3" rows="2" cols="50" required="required"/><br/><br/>
                    <form:label path="response4">Answer4:</form:label><br/>
                    <form:textarea path="response4" rows="2" cols="50" required="required"/><br/>
                <input type="submit" value="Submit"/>
            </form:form>
                <br/>
            <form action="<c:url value="/lecture/list" />" method="GET">
                <input type="submit" value="Cancel"/>
            </form>
    </body>
</html>
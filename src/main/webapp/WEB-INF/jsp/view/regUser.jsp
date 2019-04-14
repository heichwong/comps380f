<!DOCTYPE html>
<html>
<head>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <title>Student Support</title>
</head>
<body>
<a href="<c:url value="/login" />">Login</a><br />
        <c:if test="${param.error != null}">
            <p>Registration failed! Username already used by another user.</p>
        </c:if>
<h2>Registration</h2>
<form:form method="POST" enctype="multipart/form-data"
           modelAttribute="lectureUser">
    <form:label path="username">Username</form:label><br/>
    <form:input type="text" path="username" required="required"/><br/><br/>
    <form:label path="password">Password</form:label><br/>
    <form:input type="text" path="password" required="required"/><br/><br/>
    <form:hidden path="roles" value="ROLE_USER" />
    <br /><br />
    <input type="submit" value="Register"/>
</form:form>
    <br />
        <a href="<c:url value="/lecture/list" />">Return to list lectures</a>

</body>
</html>

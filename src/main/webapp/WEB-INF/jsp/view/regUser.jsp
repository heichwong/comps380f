<!DOCTYPE html>
<html>
<head>
    <title>Student Support</title>
</head>
<body>
<a href="<c:url value="/login" />">Login</a><br />
<h2>Registration</h2>
<form:form method="POST" enctype="multipart/form-data"
           modelAttribute="lectureUser">
    <form:label path="username">Username</form:label><br/>
    <form:input type="text" path="username" /><br/><br/>
    <form:label path="password">Password</form:label><br/>
    <form:input type="text" path="password" /><br/><br/>
    <form:hidden path="roles" value="ROLE_USER" />
    <br /><br />
    <input type="submit" value="Register"/>
</form:form>
</body>
</html>

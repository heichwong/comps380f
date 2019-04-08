<!DOCTYPE html>
<html>
<head>
    <title>Student Support</title>
</head>
<body>
<h2>Registration</h2>
<form:form method="POST" enctype="multipart/form-data"
           modelAttribute="lectureUser">
    <form:label path="username">Username</form:label><br/>
    <form:input type="text" path="username" /><br/><br/>
    <form:label path="password">Password</form:label><br/>
    <form:input type="text" path="password" /><br/><br/>
    <form:label path="roles">Roles</form:label><br/>
    <form:radiobutton path="roles" value="ROLE_USER" />ROLE_USER
    <br /><br />
    <input type="submit" value="Register"/>
</form:form>
</body>
</html>

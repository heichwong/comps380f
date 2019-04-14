<!DOCTYPE html>
<html>
    <head>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <title>學生支援</title>
    </head>
    <body>
        <c:url var="logoutUrl" value="/logout"/>
        <form action="${logoutUrl}" method="post">
            <input type="submit" value="登出" />
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

        <h2>新增 / 編輯用戶</h2>
        <form:form method="POST" enctype="multipart/form-data"
                   modelAttribute="lectureUser">
            <form:label path="username">用戶名稱</form:label><br/>
            <form:input type="text" path="username" required="required"/><br/><br/>
            <form:label path="password">密碼</form:label><br/>
            <form:input type="text" path="password" required="required"/><br/><br/>
            <form:label path="roles">權限</form:label><br/>
            <form:checkbox path="roles" value="ROLE_USER" />學生
            <form:checkbox path="roles" value="ROLE_ADMIN" />教師
            <br /><br />
            <input type="submit" value="新增 / 編輯用戶"/>
        </form:form>
    </body>
</html>

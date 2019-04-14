<!DOCTYPE html>
<html>
    <head>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <title>學生支援</title>
    </head>
    <body>
        <a href="<c:url value="/login?TC" />">登入</a><br />
        <c:if test="${param.error != null}">
            <p>註冊失敗! 用戶名稱已經被使用。</p>
        </c:if>
        <h2>註冊</h2>
        <form:form method="POST" enctype="multipart/form-data"
                   modelAttribute="lectureUser">
            <form:label path="username">用戶名稱</form:label><br/>
            <form:input type="text" path="username" required="required"/><br/><br/>
            <form:label path="password">密碼</form:label><br/>
            <form:input type="text" path="password" required="required"/><br/><br/>
            <form:hidden path="roles" value="ROLE_USER" />
            <br /><br />
            <input type="submit" value="註冊"/>
        </form:form>
            <br/>
            <a href="<c:url value="/lecture/list/tc" />">返回課程列表</a>
    </body>
</html>

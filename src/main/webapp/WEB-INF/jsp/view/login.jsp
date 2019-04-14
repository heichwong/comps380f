<!DOCTYPE html>
<html>
    <head>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <title>Student Support Login</title>
    </head>
    <body>
        <a href="<c:url value="/register/create" />">
            <c:choose>
                <c:when test="${param.TC != null}">註冊</c:when>
                <c:otherwise>Sign Up</c:otherwise>
            </c:choose>        
        </a><br />
        <c:if test="${param.error != null}">
            <c:choose>
                <c:when test="${param.TC != null}"><p>登入失敗</p></c:when>
                <c:otherwise><p>Login failed.</p></c:otherwise>
            </c:choose>           
        </c:if>
        <c:if test="${param.logout != null}">
            <c:choose>
                <c:when test="${param.TC != null}"><p>你已經登出</p></c:when>
                <c:otherwise><p>You have logged out.</p></c:otherwise>
            </c:choose>             
        </c:if>
        <c:choose>
            <c:when test="${param.TC != null}"><h2>學生支援登入</h2></c:when>
            <c:otherwise><h2>Student Support Login</h2></c:otherwise>
        </c:choose>      
        <form action="login" method="POST">
            <label for="username">
                <c:choose>
                    <c:when test="${param.TC != null}">用戶名稱:</c:when>
                    <c:otherwise>Username:</c:otherwise>
                </c:choose>
            </label><br/>
            <input type="text" id="username" name="username" required="required"/><br/><br/>
            <label for="password">
                <c:choose>
                    <c:when test="${param.TC != null}">密碼:</c:when>
                    <c:otherwise>Password:</c:otherwise>
                </c:choose>
            </label><br/>
            <input type="password" id="password" name="password" required="required"/><br/><br/>
            <input type="checkbox" id="remember-me" name="remember-me" />
            <label for="remember-me">
                <c:choose>
                    <c:when test="${param.TC != null}">保持登入</c:when>
                    <c:otherwise>Remember me</c:otherwise>
                </c:choose>
            </label><br/><br/>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <c:choose>
                <c:when test="${param.TC != null}"><input type="submit" value="登入"/></c:when>
                <c:otherwise><input type="submit" value="Log In"/></c:otherwise>
            </c:choose>
        </form>
            <br/>
        <c:choose>
            <c:when test="${param.TC != null}"><a href="<c:url value="/lecture/list/tc" />">返回課程列表</a></c:when>
            <c:otherwise><a href="<c:url value="/lecture/list" />">Return to list lectures</a></c:otherwise>
        </c:choose>
    </body>
</html>

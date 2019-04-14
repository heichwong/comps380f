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
<br /><br />
<a href="<c:url value="/lecture/list/tc" />">返回課程列表</a>
<h2>用戶</h2>
<a href="<c:url value="/user/create/tc" />">建立 / 編輯用戶</a><br /><br />
<c:choose>
    <c:when test="${fn:length(lectureUsers) == 0}">
        <i>系統沒有用戶</i>
    </c:when>
    <c:otherwise>
    <table>
        <tr>
            <th>用戶名稱</th><th>密碼</th><th>權限</th><th>執行</th>
        </tr>
        <c:forEach items="${lectureUsers}" var="user">
        <tr>
            <td>${user.username}</td><td>${user.password}</td>
            <td>
                <c:forEach items="${user.roles}" var="role" varStatus="status">
                    <c:if test="${!status.first}">, </c:if>
                    ${role.role}
                </c:forEach>
            </td>
            <td>
            [<a href="<c:url value="/user/delete/${user.username}/tc" />">刪除</a>]
            </td>
        </tr>
        </c:forEach>
    </table>
    </c:otherwise>
</c:choose>
</body>
</html>

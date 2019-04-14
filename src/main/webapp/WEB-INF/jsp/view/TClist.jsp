<!DOCTYPE html>
<html>
    <head>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <title>學生支援</title>
    </head>
    <body>
        <security:authorize access="!isAuthenticated()">
            <a href="<c:url value="/login?TC"/>">登入</a>
            <a href="<c:url value="/register/TCcreate"/>">註冊</a>
        </security:authorize>
        <security:authorize access="isAuthenticated()">
            <c:url var="logoutUrl" value="/logout?TC"/>
            <form action="${logoutUrl}" method="post">
                <input type="submit" value="登出" />
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
        </security:authorize>
            <a href="<c:url value="/lecture/list"/>">English Interface</a>
        <h2>課程</h2>
        <security:authorize access="hasRole('ADMIN')">    
            <a href="<c:url value="/user/list/tc" />">管理用戶帳號</a><br /><br />
            <a href="<c:url value="/lecture/create/tc" />">新增課程</a><br /><br />
        </security:authorize>
        <c:choose>
            <c:when test="${fn:length(lectureDatabase) == 0}">
                <i>系統沒有課程</i>
            </c:when>
            <c:otherwise>
                <c:forEach items="${lectureDatabase}" var="lecture">
                    課堂 ${lecture.id}:
                    <a href="<c:url value="/lecture/view/${lecture.id}/tc" />">
                        <c:out value="${lecture.subject}" /></a>
                    (製作者: <c:out value="${lecture.studentName}" />)
                    <security:authorize access="isAuthenticated() and (hasRole('ADMIN') or
                                        principal.username=='${lecture.studentName}')">
                        [<a href="<c:url value="/lecture/edit/${lecture.id}/tc" />">編輯</a>]
                    </security:authorize>
                    <security:authorize access="isAuthenticated() and (hasRole('ADMIN'))">            
                        [<a href="<c:url value="/lecture/delete/${lecture.id}/tc" />">刪除</a>]
                    </security:authorize>
                    <br /><br />
                </c:forEach>
            </c:otherwise>
        </c:choose>
        <h2>問卷調查</h2>
        <security:authorize access="isAuthenticated() and hasRole('ADMIN')">
            <a href="<c:url value ="/lecture/poll/list/addPoll/tc"/>">建立問卷調查</a><br/><br/>
        </security:authorize>
        <c:choose>
            <c:when test="${fn:length(pollDatabase) == 0}">
                <i>系統沒有問卷調查</i>
            </c:when>
            <c:otherwise>
                <ul>
                    <c:forEach items="${pollDatabase}" var="poll">
                        <li>
                            問題 #${poll.poll_id}:
                            <a href="<c:url value="/lecture/poll/${poll.poll_id}/tc" />">
                                <c:out value="${poll.question}" /></a>
                                <security:authorize access="hasRole('ADMIN')">            
                                [<a href="<c:url value="/lecture/poll/delete/${poll.poll_id}/tc" />">刪除</a>]
                            </security:authorize>
                        </li>
                    </c:forEach>
                </ul>
            </c:otherwise>
        </c:choose>
        <br>
    </body>
</html>

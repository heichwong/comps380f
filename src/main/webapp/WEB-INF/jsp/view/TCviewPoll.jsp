<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <title>問卷調查</title>
    </head>
    <body>
        <security:authorize access="!isAuthenticated()">
            <a href="<c:url value="/tc/login"/>">登入</a>
        </security:authorize>
        <security:authorize access="isAuthenticated()">
            <c:url var="logoutUrl" value="/logout"/>
            <form action="${logoutUrl}" method="post">
                <input type="submit" value="登出"/>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
        </security:authorize>
        <br>
        <p>現時有 ${pollAllCount} 票.</p>
        <c:set var = "Ivoted" value = "${Ivote}"/>
        <c:choose>
            <c:when test="${Ivoted==null}"><p>你沒有投票</p></c:when>
            <c:otherwise> <p>你投票給 ${Ivote}.</p></c:otherwise>
        </c:choose>
        <form:form method="POST" modelAttribute="ansPollForm">
            <form:radiobutton path="response" value="${pollDatabase.response1}"/>&nbsp;${pollDatabase.response1} &nbsp;&nbsp;${pollCount1} vote
            <br>
            <form:radiobutton path="response" value="${pollDatabase.response2}"/>&nbsp;${pollDatabase.response2} &nbsp;&nbsp;${pollCount2} vote
            <br>
            <form:radiobutton path="response" value="${pollDatabase.response3}"/>&nbsp;${pollDatabase.response3} &nbsp;&nbsp;${pollCount3} vote
            <br>
            <form:radiobutton path="response" value="${pollDatabase.response4}"/>&nbsp;${pollDatabase.response4} &nbsp;&nbsp;${pollCount4} vote
            <br><br>
            <form:hidden path="username" value="${principal.username}"/>
            <input type="submit" value="提交"/>
        </form:form>
        <br/>
        <br/>
        <a href="<c:url value="/lecture/pollcomment/${poll_id}/tc"/>">留下評論</a><br/>
        
        <table border="0">
                <thead>
                    <tr>
                        <th scope="col">用戶名稱</th>
                        <th>&nbsp;&nbsp;&nbsp;</th>
                        <th scope="col">評論</th>
                    </tr>
                </thead>

                <c:choose>
                    <c:when test="${fn:length(pollCommentDatabase) == 0}">
                        <tbody>
                            <tr>
                                <td colspan="3"><i>沒有評論</i></td>
                            </tr>
                        </tbody>
                    </c:when>
                    <c:otherwise>
                        <tbody>
                            <c:forEach items="${pollCommentDatabase}" var="entry">
                                <tr>
                                    <td><c:out value="${entry.username}" /></td>
                                    <td>&nbsp;&nbsp;&nbsp;</td>
                                    <td><c:out value="${entry.comment}" />
                                        <security:authorize access="hasRole('ADMIN')">
                                            [<a href="<c:url value="/lecture/poll/deleteComment/${poll_id}/${entry.id}/tc" />">刪除</a>]
                                        </security:authorize></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </c:otherwise>
                </c:choose>

            </table><br>

        <a href="<c:url value="/lecture/list/tc" />">返回課程列表</a>
    </body>
</html>
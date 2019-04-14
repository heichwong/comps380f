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

        <h2>Lecture #${lecture.id}: <c:out value="${lecture.subject}" /></h2>
        <security:authorize access="hasRole('ADMIN') or principal.username=='${lecture.studentName}'">            
            [<a href="<c:url value="/lecture/edit/${lecture.id}/tc" />">編輯</a>]
        </security:authorize>
        <security:authorize access="hasRole('ADMIN')">            
            [<a href="<c:url value="/lecture/delete/${lecture.id}/tc" />">刪除</a>]
        </security:authorize>
        <br /><br />
        <i>建立者 - <c:out value="${lecture.studentName}" /></i><br /><br />
        <c:out value="${lecture.body}" /><br /><br />
        <c:if test="${fn:length(lecture.attachments) > 0}">
            教材:
            <c:forEach items="${lecture.attachments}" var="attachment"
                       varStatus="status">
                <c:if test="${!status.first}">, </c:if>
                <a href="<c:url value="/lecture/${lecture.id}/attachment/${attachment.name}/tc" />">
                    <c:out value="${attachment.name}" /></a>
            </c:forEach><br /><br />
        </c:if>
            
        <table border="0">
            <tr>
                <th>用戶名稱</th>
                <th>&nbsp;&nbsp;&nbsp;</th>
                <th>評論</th>
            </tr>

            <c:choose>
                <c:when test="${fn:length(commentDatabase) == 0}">
                    <tr>
                        <td colspan="2"><i>沒有評論</i></td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <c:forEach items="${commentDatabase}" var="entry">
                        <tr>
                            <td><c:out value="${entry.username}" /></td>
                            <td>&nbsp;&nbsp;&nbsp;</td>
                            <td><c:out value="${entry.comment}" /></td>
                            <security:authorize access="hasRole('ADMIN')">            
                                <td>[<a href="<c:url value="deleteComment/${lectureId}/${entry.id}/tc"/>">刪除</a>]</td>
                            </security:authorize>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>

        </table><br>

        <a href="<c:url value="/lecture/comment/${lecture.id}/tc" />">留下評論</a><br/><br/>
        <a href="<c:url value="/lecture/list/tc" />">返回課程列表</a>
    </body>
</html>

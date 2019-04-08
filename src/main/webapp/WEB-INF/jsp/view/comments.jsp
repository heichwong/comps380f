<!DOCTYPE html>
<html>
<head>
    <title>Student Support</title>
</head>
<body>
<c:url var="logoutUrl" value="/logout"/>
<form action="${logoutUrl}" method="post">
    <input type="submit" value="Log out" />
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>

<h2>Comment(s) of <c:out value="${lecture.id}" /></h2>

        <c:choose>
            <c:when test="${fn:length(commentsDatabase) == 0}">
                <i>There are no comment on this lecture.</i>
            </c:when>
            <c:otherwise>
                Lecture ${lecture.id}:<br />
                <c:forEach items="${commentsDatabase}" var="comment">
                    
                    <br /><br />
                </c:forEach>
            </c:otherwise>
        </c:choose>

<form:form method="POST" enctype="multipart/form-data"
           modelAttribute="comments">
    <form:label path="comment">Comment</form:label><br/>
    <form:textarea path="comment" rows="5" cols="30" /><br/><br/>
    <br /><br />
    <input type="submit" value="Submit Comment"/>
</form:form>
</body>
</html>

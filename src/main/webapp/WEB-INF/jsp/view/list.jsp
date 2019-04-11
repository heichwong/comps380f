<!DOCTYPE html>
<html>
    <head>
        <title>Student Support</title>
    </head>
    <body>
        <security:authorize access="!isAuthenticated()">
            <a href="<c:url value="/login"/>">Login</a>
        </security:authorize>
        <security:authorize access="isAuthenticated()">
            <c:url var="logoutUrl" value="/logout"/>
        <form action="${logoutUrl}" method="post">
            <input type="submit" value="Log out" />
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        </security:authorize>

        <h2>Lectures</h2>
        <security:authorize access="hasRole('ADMIN')">    
            <a href="<c:url value="/user" />">Manage User Accounts</a><br /><br />
            <a href="<c:url value="/lecture/create" />">Create a Lecture</a><br /><br />
        </security:authorize>
        <c:choose>
            <c:when test="${fn:length(lectureDatabase) == 0}">
                <i>There are no lectures in the system.</i>
            </c:when>
            <c:otherwise>
                <c:forEach items="${lectureDatabase}" var="lecture">
                    Lecture ${lecture.id}:
                    <a href="<c:url value="/lecture/view/${lecture.id}" />">
                        <c:out value="${lecture.subject}" /></a>
                    (creater: <c:out value="${lecture.studentName}" />)
                    <security:authorize access="isAuthenticated() and (hasRole('ADMIN') or
                                        principal.username=='${lecture.studentName}')">
                        [<a href="<c:url value="/lecture/edit/${lecture.id}" />">Edit</a>]
                    </security:authorize>
                    <security:authorize access="isAuthenticated() and (hasRole('ADMIN'))">            
                        [<a href="<c:url value="/lecture/delete/${lecture.id}" />">Delete</a>]
                    </security:authorize>
                    <br /><br />
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </body>
</html>

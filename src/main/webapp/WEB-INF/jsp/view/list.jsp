<!DOCTYPE html>
<html>
    <head>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <title>Student Support</title>
    </head>
    <body>
        <security:authorize access="!isAuthenticated()">
            <a href="<c:url value="/login"/>">Login</a>
            <a href="<c:url value="/register/create"/>">Sign Up</a>
        </security:authorize>
        <security:authorize access="isAuthenticated()">
            <c:url var="logoutUrl" value="/logout"/>
            <form action="${logoutUrl}" method="post">
                <input type="submit" value="Log out" />
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
        </security:authorize>
<a href="<c:url value="/lecture/list/tc"/>">中文介面</a>
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
        <h2>Pollings</h2>
        <security:authorize access="isAuthenticated() and hasRole('ADMIN')">
            <a href="<c:url value ="/lecture/poll/list/addPoll"/>">Create a Poll</a><br/><br/>
        </security:authorize>
        <c:choose>
            <c:when test="${fn:length(pollDatabase) == 0}">
                <i>There are no poll in the system.</i>
            </c:when>
            <c:otherwise>
                <ul>
                    <c:forEach items="${pollDatabase}" var="poll">
                        <li>
                            Question #${poll.poll_id}:
                            <a href="<c:url value="/lecture/poll/${poll.poll_id}" />">
                                <c:out value="${poll.question}" /></a>
                                <security:authorize access="hasRole('ADMIN')">            
                                [<a href="<c:url value="/lecture/poll/delete/${poll.poll_id}" />">Delete</a>]
                            </security:authorize>
                        </li>
                    </c:forEach>
                </ul>
            </c:otherwise>
        </c:choose>
        <br>
    </body>
</html>

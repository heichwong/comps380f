<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Poll Page</title>
    </head>
    <body>
                    <security:authorize access="hasRole('ADMIN')">
                            <a href="<c:url value="/lecture/poll/list/addPoll" />">Add Poll</a>
                    </security:authorize>
               
                    <security:authorize access="!isAuthenticated()">
                        <a href="<c:url value="/login"/>">Login</a>
                    </security:authorize>
                    <security:authorize access="isAuthenticated()">
                        <c:url var="logoutUrl" value="/logout"/>
                        <form action="${logoutUrl}" method="post">
                            <input type="submit" value="Log out"/>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        </form>
                    </security:authorize>

        <div>
            <c:choose>
                <c:when test="${fn:length(pollDatabase) == 0}">
                    <i>There are no poll in the system.</i>
                </c:when>
                <c:otherwise>
                    <ul>
                        <c:forEach items="${pollDatabase}" var="poll">
                            <li>
                                Question #${poll.poll_id}:
                                <a href="<c:url value="${poll.poll_id}" />">
                                    <c:out value="${poll.question}" /></a>
                                    <security:authorize access="hasRole('ADMIN')">            
                                    [<a class="text-danger" href="<c:url value="/lecture/poll/delete/${poll.poll_id}" />">Delete</a>]
                                </security:authorize>
                            </li>
                        </c:forEach>
                    </ul>
                </c:otherwise>
            </c:choose>
            <br>
            <a href="<c:url value="/lecture" />">Return to list lectures</a>
        </div>
    </body>
</html>
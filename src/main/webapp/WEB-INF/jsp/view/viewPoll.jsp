<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <title>Poll Page</title>
    </head>
    <body>
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
        <br>
        <p>There are ${pollAllCount} votes.</p>
        <c:set var = "Ivoted" value = "${Ivote}"/>
        <c:choose>
            <c:when test="${Ivoted==null}"><p>You haven't vote.</p></c:when>
            <c:otherwise> <p>You voted to ${Ivote}.</p></c:otherwise>
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
            <input type="submit" value="Submit"/>
        </form:form>
        <br/>
        <br/>
        <a href="<c:url value="/lecture/pollcomment/${poll_id}"/>">Leave a Comment</a><br/>
        <table border="0">
            <thead>
                <tr>
                    <th>User</th>
                    <th>&nbsp;&nbsp;&nbsp;</th>
                    <th>Comment</th>
                </tr>
            </thead>

            <c:choose>
                <c:when test="${fn:length(pollCommentDatabase) == 0}">
                    <tbody>
                        <tr>
                            <td colspan="3"><i>There are no comments.</i></td>
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
                                        [<a href="<c:url value="deleteComment/${poll_id}/${entry.id}" />">Delete</a>]
                                    </security:authorize></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </c:otherwise>
            </c:choose>

        </table><br>
        <a href="<c:url value="/lecture/list" />">Return to list lectures</a>
    </body>
</html>
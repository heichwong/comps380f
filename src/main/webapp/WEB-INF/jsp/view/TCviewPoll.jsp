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
        <br>
        <a href="<c:url value="/lecture/list" />">Return to poll page</a>
    </body>
</html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <title>新增問卷調查</title>
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
            <h1>建立問卷調查</h1>
            <form:form method="POST" modelAttribute="pollForm">
                    <form:label path="question">問題:</form:label><br/>
                    <form:textarea path="question" rows="2" cols="50" required="required"/><br/><br/>
                    <form:label path="response1">選擇1:</form:label><br/>
                    <form:textarea path="response1" rows="2" cols="50" required="required"/><br/><br/>
                    <form:label path="response2">選擇2:</form:label><br/>
                    <form:textarea path="response2" rows="2" cols="50" required="required"/><br/><br/>
                    <form:label path="response3">選擇3:</form:label><br/>
                    <form:textarea path="response3" rows="2" cols="50" required="required"/><br/><br/>
                    <form:label path="response4">選擇4:</form:label><br/>
                    <form:textarea path="response4" rows="2" cols="50" required="required"/><br/>
                <input type="submit" value="提交"/>
            </form:form>
                <br/>
            <form action="<c:url value="/lecture/list/tc" />" method="GET">
                <input type="submit" value="取消"/>
            </form>
    </body>
</html>
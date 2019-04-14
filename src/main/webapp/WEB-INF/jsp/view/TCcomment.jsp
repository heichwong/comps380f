<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>學生支援</title>
    </head>
    <body>
        <h1>在${lecture.subject}留言</h1>
        <form:form method="POST" modelAttribute="commentForm">
            <form:label path="comment">留下評論:</form:label><br />
            <form:textarea type="text" path="comment" rows="5" cols="30" required="required"/>
            <form:hidden path="username" value="${principal.username}"/>
            <form:hidden path="lecture_id" value="${lecture.id}"/><br /><br />
            <input type="submit" value="評論"/>
        </form:form>
    </body>
</html>

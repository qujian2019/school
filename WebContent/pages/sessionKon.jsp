<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
		<meta http-equiv="Pragma",content="no-cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="renderer" content="webkit" />
		<meta http-equiv="X-UA-Compatible" content="chrome=1,IE=Edge" />
		<meta name="viewport" content="width=device-width,initial-scale=1.0">
        <title>JSP Page</title>
    </head>
    <body>
    	<%HttpSession session = request.getSession(); session.invalidate();%>
 	</body>
</html>
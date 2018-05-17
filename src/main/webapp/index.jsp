<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--<html>--%>
<%--<head>--%>
<%--<title>gaga</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--${textA}--%>
<%--${textB}--%>
<%--</body>--%>
<%--</html>--%>

<html>
<head>
    <title>Simple web app</title>
    <script type="text/javascript">
        function doIt(method) {

            var url = "simpleServlet?value=" +  document.getElementById(method.toLowerCase()).value;

            if (window.XMLHttpRequest) {
                request = new XMLHttpRequest();
            } else if (window.ActiveXObject) {
                request = new ActiveXObject("Microsoft.XMLHTTP");
            }
            try {
                request.onreadystatechange = sendInfo;
                request.open(method, url, true);
                request.send();
            } catch (e) {
                alert("Unable to connect server");
            }
            sendInfo();
        }

        function sendInfo() {
            if (request.readyState == 4) {
                document.location.href = "index.jsp";
            }
        }
    </script>
</head>
<body>

<p>
    <label>Get element by index: </label>
    <input type="text" name="username" id="get">
    <button type="button" onclick="doIt('GET')">GET</button>
</p>
<p>
    <label>Add new element: </label>
    <input type="text" name="username" id="post">
    <button type="button" onclick="doIt('POST')">POST</button>
</p>
<p>
    <label>Update first element: </label>
    <input type="text" name="username" id="put">
    <button type="button" onclick="doIt('PUT')">PUT</button>
</p>
<p>
    <label>Remove element by index: </label>
    <input type="text" name="username" id="delete">
    <button type="button" onclick="doIt('DELETE')">DELETE</button>
</p>
<h4>RESULT: </h4>
<p>${sessionScope.INFO}</p>
<h4>Inner state:</h4>
<c:if test="${not empty sessionScope.state}">
    <c:set var="counter" value="${0}" />
        <c:forEach items="${sessionScope.state}" var="item">
            ${counter} : ${item} <br/>
            <c:set var="counter" value="${counter+1}" />
        </c:forEach>
</c:if>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
<%
    Cookie[] cookies = request.getCookies();

    for(int i = 0; i < cookies.length; i++) {
        if(cookies[i].getName().equals("amountOfJSPViews")){
            cookies[i].setValue(String.valueOf(Integer.parseInt(cookies[i].getValue()) + 1));
            response.addCookie(cookies[i]);
            break;
        }
        if(i == cookies.length-1){
            Cookie cookie = new Cookie("amountOfJSPViews", "1");
            cookie.setMaxAge(60 * 60);
            response.addCookie(cookie);
        }
    }
%>
<fmt:setBundle basename="data" />
<p>
    <label><fmt:message key="get"/></label>
    <input type="text" name="username" id="get">
    <button type="button" onclick="doIt('GET')">GET</button>
</p>
<p>
    <label><fmt:message key="post"/></label>
    <input type="text" name="username" id="post">
    <button type="button" onclick="doIt('POST')">POST</button>
</p>
<p>
    <label><fmt:message key="put"/></label>
    <input type="text" name="username" id="put">
    <button type="button" onclick="doIt('PUT')">PUT</button>
</p>
<p>
    <label><fmt:message key="delete"/></label>
    <input type="text" name="username" id="delete">
    <button type="button" onclick="doIt('DELETE')">DELETE</button>
</p>
<h4>Amount of JSP views : </h4>
${cookie.get("amountOfJSPViews").value}
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
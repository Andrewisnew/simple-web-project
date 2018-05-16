<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            var url = "simpleServlet";
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
    <label>GET</label>
    <input type="text" name="username" id="get">
    <button type="button" onclick="doIt('GET')">GET</button>
</p>
<p>
    <label>POST</label>
    <input type="text" name="username" id="post">
    <button type="button" onclick="doIt('POST')">POST</button>
</p>
<p>
    <label>PUT</label>
    <input type="text" name="username" id="put">
    <button type="button" onclick="doIt('PUT')">PUT</button>
</p>
<p>
    <label>DELETE</label>
    <input type="text" name="username" id="delete">
    <button type="button" onclick="doIt('DELETE')">DELETE</button>
</p>

<p>${sessionScope.log}</p>
</body>
</html>
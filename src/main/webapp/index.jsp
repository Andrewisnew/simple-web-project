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
    <title>AJAX REQUEST IN JSP</title>
    <script type="text/javascript">
        // function loadAjax() {
        //     var username = document.getElementById("username").value;
        //     var email = document.getElementById("email").value;
        //     var tel = document.getElementById("tel").value;
        //     var division = document.getElementById("division").value;
        //     var url = "s?username=" + username + "&email=" + email + "&division=" + division + "&tel=" + tel;
        //     if (window.XMLHttpRequest) {
        //         request = new XMLHttpRequest();
        //     } else if (window.ActiveXObject) {
        //         request = new ActiveXObject("Microsoft.XMLHTTP");
        //     }
        //     try {
        //         request.onreadystatechange = sendInfo;
        //         request.open("POST", url, true);
        //         request.send();
        //     } catch (e) {
        //         alert("Unable to connect server");
        //     }
        // }
        function doGet() {
            var url = "s";
            if (window.XMLHttpRequest) {
                request = new XMLHttpRequest();
            } else if (window.ActiveXObject) {
                request = new ActiveXObject("Microsoft.XMLHTTP");
            }
            try {
                request.onreadystatechange = sendInfo;
                request.open("GET", url, true);
                request.send();
            } catch (e) {
                alert("Unable to connect server");
            }
        }
        function doPost() {
            var url = "s";

            if (window.XMLHttpRequest) {
                request = new XMLHttpRequest();
            } else if (window.ActiveXObject) {
                request = new ActiveXObject("Microsoft.XMLHTTP");
            }
            try {
                request.onreadystatechange = sendInfo;
                request.open("POST", url, true);
                request.send();
            } catch (e) {
                alert("Unable to connect server");
            }
        }
        function doPut() {
            var url = "s";

            if (window.XMLHttpRequest) {
                request = new XMLHttpRequest();
            } else if (window.ActiveXObject) {
                request = new ActiveXObject("Microsoft.XMLHTTP");
            }
            try {
                request.onreadystatechange = sendInfo;
                request.open("PUT", url, true);
                request.send();
            } catch (e) {
                alert("Unable to connect server");
            }
        }
        function doDelete() {
            var url = "s";
            if (window.XMLHttpRequest) {
                request = new XMLHttpRequest();
            } else if (window.ActiveXObject) {
                request = new ActiveXObject("Microsoft.XMLHTTP");
            }
            try {
                request.onreadystatechange = sendInfo;
                request.open("DELETE", url, true);
                request.send();
            } catch (e) {
                alert("Unable to connect server");
                alert(e.toString())
            }
        }
        function sendInfo() {
            var p = document.getElementById("print");
            // if(request.readyState ==1){
            //     var text = request.responseText;
            //     p.innerHTML="Please Wait.....";
            //     console.log("1");
            // }
            //
            // if(request.readyState ==2){
            //     var text = request.responseText;
            //     console.log("2");
            //
            // }
            // if(request.readyState ==3){
            //     var text = request.responseText;
            //     console.log("3");
            //
            // }
            if (request.readyState == 4) {
                var text = request.responseText;
                p.innerHTML = " Request Processed  " + text;
            }
        }
    </script>
</head>
<body>
<form>
    <%--<p><label>YOUR NAME</label>--%>
        <%--<input type="text" name="username" id="username" required="required"></p>--%>
    <%--<p><label>YOUR EMAIL</label>--%>
        <%--<input type="email" name="email" id="email" required="required"></p>--%>
    <%--<p><label>YOUR PHONE</label>--%>
        <%--<input type="tel" name="tel" id="tel" required="required"></p>--%>
    <%--<p><label>YOUR DIVISION</label>--%>
        <%--<select name="division" required="required" id="division">--%>
            <%--<option value="">Select</option>--%>
            <%--<option value="East">East</option>--%>
            <%--<option value="West">West</option>--%>
            <%--<option value="North">North</option>--%>
            <%--<option value="South">South</option>--%>
        <%--</select></p>--%>
    <%--<button type="button" onclick="loadAjax()">REGISTER</button>--%>

    <p>
        <label>GET</label>
        <input type="text" name="username" id="get">
        <button type="button" onclick="doGet()">GET</button>
    </p>
    <p>
        <label>POST</label>
        <input type="text" name="username" id="post">
        <button type="button" onclick="doPost()">POST</button>
    </p>
    <p>
        <label>PUT</label>
        <input type="text" name="username" id="put">
        <button type="button" onclick="doPut()">PUT</button>
    </p>
    <p>
        <label>DELETE</label>
        <input type="text" name="username" id="delete">
        <button type="button" onclick="doDelete()">DELETE</button>
    </p>

</form>
<%--<p id="print"></p>--%>
</body>
</html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  
        if (null == session.getAttribute("name")){
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- Bootstrap -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
      crossorigin="anonymous"
    ></script>

    <!-- Dojo CDN Script -->
    <script
      data-dojo-Config="parseOnLoad: true"
      src="https://ajax.googleapis.com/ajax/libs/dojo/1.14.1/dojo/dojo.js"
    ></script>

    <style></style>

    <title>Licenses</title>
  </head>

  <body>
    <nav class="ps-4 navbar navbar-expand-lg" style="background-color: #e3f2fd">
      <div class="container-fluid">
      	<a class="navbar-brand" href="../index.html"><img src="../image/logo_ds.svg" alt="DataServe logo" width="125" height="60" /></a>
      	<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"><span class="navbar-toggler-icon"></span></button>
      	<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
      		<div class="navbar-nav">
              <a class="nav-link" href="../index.html">Records</a>
              <a class="nav-link active" href="index.jsp">User</a>
              <a class="nav-link" href="../admin/index.jsp">Admin</a>
      		</div>
      	</div>
      </div>
	</nav>
    
    <form id="form" method="post" class="mt-5">
      <div class="mb-4 row">
      	<div class="col-sm-5"></div>
      	<div class="col-sm-2 position-relative email">
          <input type="email" name="email" class="form-control" placeholder="Email" required>
      	</div>
      	<div class="col-sm-5"></div>
      </div>
      <div class="row">
      	<div class="col-sm-5"></div>
      	<div class="col-sm-2 position-relative password">
          <input type="password" id="showPassword" name="showPassword" class="form-control" placeholder="Password" required>
      	</div>
      	<div class="col-sm-5"></div>
      </div>
      <div class="col-auto text-center">
      	<button type="submit" name="submit" class="btn btn-primary m-4">Log In</button>
      </div>
          
            <input type="hidden" id="password" name="password">
	</form>
    
    <script>
      require([
        "dojo/dom",
        "dojo/on",
        "dojo/request",
        "dojo/dom-form",
        "dojo/domReady!"
      ], function (dom, on, request, domForm) {
        var form = dom.byId("form");
        var showPassword = dom.byId("showPassword");
        var password = dom.byId("password");
        
        function utf8_to_b64(str) {
            return window.btoa(unescape(encodeURIComponent(str)));
        }

        function b64_to_utf8(str) {
            return decodeURIComponent(escape(window.atob(str)));
        }
        
        on(form, "submit", function(evt){
          evt.stopPropagation();
          evt.preventDefault();
          password.setAttribute("value", utf8_to_b64(showPassword.value));
          request.post("login.jsp",{
        	data: domForm.toObject(form)
          }).response.then(
        	function(response) {
              if (Number(response.data) === 0) {
                password.setAttribute("value", "");
                alert("Wrong Email or password!");
              } else if (Number(response.data) === 1){
                window.location.replace("index.jsp");
              }
        	},
        	function(error) {
              console.log("error: " + error);
        	});
        });
      });
    </script>
  </body>
</html>
<%
    } else {
        response.sendRedirect("index.jsp");
    }
%>
<%@page import="javaPack.LicensesInfo"%>
<%@page import="javaPack.DBConnection"%>
<%@page import="javaPack.userInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  
        if (null != session.getAttribute("admin") || null != request.getParameter("id")){
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
    <nav class="navbar navbar-expand-lg" style="background-color: #e3f2fd">
      <div class="container-fluid">
        <a class="navbar-brand" href="../index.html"><img src="../image/logo_ds.svg" alt="DataServe logo" width="125" height="60" /></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
          <div class="navbar-nav">
            <a class="nav-link" href="index.jsp">Home</a>
            <a class="nav-link" href="add.jsp">Add new user</a>
            <a class="nav-link" href="logout.jsp">Logout</a>
          </div>
        </div>
      </div>
    </nav>    

    <!-- Striped table -->
    <form id="form" method="post">
          
        <div class="mx-5 my-3 row">
          <div class="col-sm-3"></div>
          <div class="col-sm-3 position-relative">
            <input type="text" id="name" name="name" value="" class="form-control" placeholder="User name" required>
          </div>
              
          <div class="col-sm-3 position-relative">
            <input type="email" id="email" name="email" value="" class="form-control" placeholder="User email" required>
          </div>
          <div class="col-sm-3"></div>

        </div>
          
        <div class="mx-5 my-3 row">
          <div class="col-sm-3"></div>
          <div class="col-sm-3 position-relative">
            <input type="password" id="password" name="password" value="" class="form-control" placeholder="User password">
          </div>
          <div class="col-sm-3">
            <div class="input-group" id="show_hide_password">
              <select class="form-select text-center" id="status" name="status">
                  <option id="selected" selected value=""></option>
                  <option value="active">Activate</option>
                  <option value="inactive">Deactivate</option>
              </select>
            </div>
          </div>
          <div class="col-sm-3"></div>
        </div>

        <div class="col-auto text-center">
          <button type="submit" name="submit" class="btn btn-primary m-4">Update</button>
        </div>
        
        <input type="hidden" id="oldEmail" name="oldEmail">
    </form>

    <script>  
      require([
        "dojo",
        "dojo/dom",
        "dojo/on",
        "dojo/request",
        "dojo/dom-construct",
        "dojo/dom-form",
        "dojo/domReady!",
      ], function (dojo, dom, on, request, domConstruct, domForm) {
          var form = dom.byId("form");
          var name = dom.byId("name");
          var email = dom.byId("email");
          var oldEmail = dom.byId("oldEmail");
          var password = dom.byId("password");
          var status = dom.byId("status");
          var selected = dom.byId("selected");
          var oldPass;
          
          // filing data
          dojo.ready(function () {
          request.post("getUser.jsp",{
            data: {id: window.location.search.substring(10)}
          }).response.then(
            function(response) {
              var data = JSON.parse(response.data);
              name.setAttribute("value", data.name);
              email.setAttribute("value", data.email);
              oldEmail.setAttribute("value", data.email);
              selected.setAttribute("value", data.status);
              status.innerHTML = "Current status: " + data.status;
              oldPass = data.password;
              
              }
            },
            function(error) {
              console.log("error: " + error);
            });
            
           on(form, "submit", function(evt){
                evt.stopPropagation();
                evt.preventDefault();
                if (password.value === "") {
                    password.setAttribute("value", oldPass);
                }
                request.post("edit.jsp",{
                    data: domForm.toObject(form)
                }).response.then(
                    function(response) {
                        document.location.href = "index.html";
                    },
                    function(error) {
                        console.log("error: " + error);
                });
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
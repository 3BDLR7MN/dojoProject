<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  
        if (null != session.getAttribute("name")){
%>
<!DOCTYPE html>
<html id="html">
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
        <span class="navbar-text">Welcome <%=session.getAttribute("name")%></span>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
          <div class="navbar-nav">
            <a class="nav-link" href="logout.jsp">Logout</a>
          </div>
          <div class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" id="myInput" placeholder="Search" aria-label="Search">
          </div>
        </div>
      </div>
    </nav>

    <!-- container body -->
    <div class="my-5 container">
      <form method="post" id="myForm">
        <div class="mb-3">
          <div class="d-flex justify-content-between">
            <label for="customerName" class="col-form-label">DataServe Customer Name:</label>
            <label for="customerName" class="col-form-label">:اسم العميل لدى داتاسيرف</label>
          </div>
          <input type="text" class="form-control text-center" id="customerName" name="customerName" placeholder="e.g. Ministry of Energy" required/>
        </div>

        <div class="mb-3">
          <div class="d-flex justify-content-between">
            <label for="customerNumber" class="col-form-label">DataServe Customer Number:</label>
            <label for="customerNumber" class="col-form-label">:رقم العميل لدى داتاسيرف</label>
          </div>
          <input type="number" class="form-control text-center" id="customerNumber" name="customerNumber" placeholder="e.g. 123" required/>
        </div>

        <div class="mb-3">
          <div class="d-flex justify-content-between">
            <label for="siteNumber" class="col-form-label">DataServe Site Number:</label>
            <label for="siteNumber" class="col-form-label">:رقم موقع داتاسيرف</label>
          </div>
          <input type="text" class="form-control text-center" id="siteNumber" name="siteNumber" placeholder="e.g. 1-00-259-5116-00 Code ID 00001" required/>
        </div>

        <div class="mb-3">
          <div class="d-flex justify-content-between">
            <label for="projectName" class="col-form-label">Project Name as per RFP:</label>
            <label for="projectName" class="col-form-label">:اسم المشروع</label>
          </div>
          <input type="text" class="form-control text-center" id="projectName" name="projectName" placeholder="e.g. مشروع تطوير نظام الاتصالات الادارية ومركز حفظ الوثائق والمحفوظات" required/>
        </div>

        <div class="mb-3">
          <div class="d-flex justify-content-between">
            <label for="christeningNumber" class="col-form-label">Christening Number:</label>
            <label for="christeningNumber" class="col-form-label">:رقم التعميد</label>
          </div>
          <input type="text" class="form-control text-center" id="christeningNumber" name="christeningNumber" pattern="^[0-9/]+$" placeholder="e.g. 1442/24/100" required/>
        </div>

        <div class="mb-3">
          <div class="d-flex justify-content-between">
            <label for="christeningDate" class="col-form-label">Christening Date:</label>
            <label for="christeningDate" class="col-form-label">:تاريخ التعميد</label>
          </div>
          <input type="date" class="form-control text-center" id="christeningDate" name="christeningDate" required/>
        </div>

        <div class="mb-3">
          <div class="d-flex justify-content-between">
            <label for="poNumber" class="col-form-label">Customer P.O Reference Number:</label>
            <label for="poNumber" class="col-form-label">:رقم العقد</label>
          </div>
          <input type="number" class="form-control text-center" id="poNumber" name="poNumber" required/>
        </div>

        <div class="mb-3">
          <div class="d-flex justify-content-between">
            <label for="poDate" class="col-form-label">P.O Date:</label>
            <label for="poDate" class="col-form-label">:تاريخ العقد</label>
          </div>
          <input type="date" class="form-control text-center" id="poDate" name="poDate" required/>
        </div>

        <div class="mb-3">
          <div class="d-flex justify-content-between">
            <label for="customerContact" class="col-form-label">Customer Contact:</label>
            <label for="customerContact" class="col-form-label">:رقم التواصل بالعميل</label>
          </div>
          <input type="text" class="form-control text-center" id="customerContact" name="customerContact" pattern="^[0-9+]+$" placeholder="e.g. +966 55 5500550" required/>
        </div>

        <div class="mb-3">
          <div class="d-flex justify-content-between">
            <label for="address" class="col-form-label">Address:</label>
            <label for="address" class="col-form-label">:عنوان العميل</label>
          </div>
          <input type="text" class="form-control text-center" id="address" name="address" placeholder="e.g. Digital city - PJRP+JR, An Nakheel, Ad Diriyah SA, Riyadh 11564" required/>
        </div>

        <div id="rowBody">
          <div class="mb-3 row" id="row1">
            <div class="col-sm-3">      
              <div class="d-flex justify-content-between">
                <label for="quantity1" class="col-form-label">Quantity:</label>
                <label for="quantity1" class="col-form-label">:الكمية</label>
              </div>
              <input type="text" class="form-control text-center" id="quantity1" name="quantity1" pattern="^[0-9#]+$" placeholder="e.g. 1500" required/>
            </div>

            <div class="col-sm-3">      
              <div class="d-flex justify-content-between">
                <label for="kind1" class="col-form-label">Type:</label>
                <label for="kind1" class="col-form-label">:النوع</label>
              </div>
              <input type="text" class="form-control text-center" id="kind1" name="kind1" placeholder="e.g. مستخدم/موظف" required/>
            </div>

            <div class="col-sm-3">      
              <div class="d-flex justify-content-between">
                <label for="description1" class="col-form-label">Description:</label>
                <label for="description1" class="col-form-label">:الوصف</label>
              </div>
              <input type="text" class="form-control text-center" id="description1" name="description1" placeholder="e.g Perpetual license" required/>
            </div>

            <div class="col-sm-3">      
              <div class="d-flex justify-content-between">
                <label for="partNumber1" class="col-form-label">Part Number:</label>
                <label for="partNumber1" class="col-form-label">:الرقم</label>
              </div>
              <input type="text" class="form-control text-center" id="partNumber1" name="partNumber1" placeholder="e.g. DS-Sy001" required/>
            </div>
          </div>
        </div>

        <div class="col-auto text-center">
          <button type="button" id="dltRowBtn" class="btn btn-danger m-4">Delete Row</button>
          <button type="button" id="addRowBtn" class="btn btn-primary m-4">Add Row</button>
        </div>

        <input type="hidden" id="counter" name="counter" value="1" />
        <input type="hidden" id="newRecord" name="newRecord" value="0" />

        <div class="col-auto d-flex justify-content-between">
          <div>
            <button type="button" id="cancelBtn" class="btn btn-secondary m-4" >Cancel</button>
          </div>
          <div>
            <button type="button" id="dltRecordBtn" class="btn btn-danger m-4">Delete Record</button>
            <button type="submit" class="btn btn-success m-4">Update Record</button>
          </div>
        </div>
      </form>
    </div>

    <script>
      var cnt = 1;
      
      require([
        "dojo",
        "dojo/dom",
        "dojo/on",
        "dojo/request",
        "dojo/dom-construct",
        "dojo/dom-form",
        "dojo/domReady!"
      ], function (dojo, dom, on, request, domConstruct, domForm) {
        var html = dom.byId("html");
        var form = dom.byId("myForm");
        var rowBody = dom.byId("rowBody");
        var addRowBtn = dom.byId("addRowBtn");
        var dltRowBtn = dom.byId("dltRowBtn");
        var dltRecordBtn = dom.byId("dltRecordBtn");
        var cancelBtn = dom.byId("cancelBtn");
        
        var customerName = dom.byId("customerName");
        var customerNumber = dom.byId("customerNumber");
        var siteNumber = dom.byId("siteNumber");
        var projectName = dom.byId("projectName");
        var christeningNumber = dom.byId("christeningNumber");
        var christeningDate = dom.byId("christeningDate");
        var poNumber = dom.byId("poNumber");
        var poDate = dom.byId("poDate");
        var customerContact = dom.byId("customerContact");
        var address = dom.byId("address");
        var quantity1 = dom.byId("quantity1");
        var kind1 = dom.byId("kind1");
        var description1 = dom.byId("description1");
        var partNumber1 = dom.byId("partNumber1");
        var counter = dom.byId("counter");
        
        poNumber.setAttribute('disabled', '');
        
        // data collector
        dojo.ready(function () {
          request.post("edit.jsp",{
            data: {poNumber: window.location.search.substring(10)}
          }).response.then(
            function(response) {
              var data = JSON.parse(response.data);
              customerName.setAttribute("value", data.customerName);
              customerNumber.setAttribute("value", data.customerNumber);
              siteNumber.setAttribute("value", data.siteNumber);
              projectName.setAttribute("value", data.projectName);
              christeningNumber.setAttribute("value", data.christeningNumber);
              christeningDate.setAttribute("value", data.christeningDate);
              poNumber.setAttribute("value", data.poNumber);
              poDate.setAttribute("value", data.poDate);
              customerContact.setAttribute("value", data.customerContact);
              address.setAttribute("value", data.address);
              var quantity = data.quantity.split("#");
              var kind = data.kind.split("#");
              var description = data.description.split("#");
              var partNumber = data.partNumber.split("#");
              quantity1.setAttribute("value", quantity[0]);
              kind1.setAttribute("value", kind[0]);
              description1.setAttribute("value", description[0]);
              partNumber1.setAttribute("value", partNumber[0]);
              counter.setAttribute("value", data.counter);
              cnt = data.counter;


              for (var i = 2; i <= counter.value; i++){
                var row = domConstruct.toDom(
                  `<div class="mb-3 row" id="row`+i+`">
                    <div class="col-sm-3">      
                      <input type="text" class="form-control text-center" id="quantity`+i+`" name="quantity`+i+`" value="` + Number(quantity[i-1]) +`" pattern="^[0-9#]+$" required/>
                    </div>

                    <div class="col-sm-3">      
                      <input type="text" class="form-control text-center" id="kind`+i+`" name="kind`+i+`" value="`+kind[i-1]+`" required/>
                    </div>

                    <div class="col-sm-3">      
                      <input type="text" class="form-control text-center" id="description`+i+`" name="description`+i+`" value="`+description[i-1]+`" required/>
                    </div>

                    <div class="col-sm-3">      
                      <input type="text" class="form-control text-center" id="partNumber`+i+`" name="partNumber`+i+`" value="`+partNumber[i-1]+`" required/>
                    </div>
                  </div>`
                );

                domConstruct.place(row, rowBody, "last");
              }
            },
            function(error) {
              console.log("error: " + error);
            });
        });
        
        // rows builder
        on(addRowBtn, "click", function(){
          counter.value = ++cnt;
          var row = domConstruct.toDom(
            `<div class="mb-3 row" id="row`+cnt+`">
              <div class="col-sm-3">      
                <input type="text" class="form-control text-center" id="quantity`+cnt+`" name="quantity`+cnt+`" pattern="^[0-9*#+]+$" required/>
              </div>

              <div class="col-sm-3">      
                <input type="text" class="form-control text-center" id="kind`+cnt+`" name="kind`+cnt+`" required/>
              </div>

              <div class="col-sm-3">      
                <input type="text" class="form-control text-center" id="description`+cnt+`" name="description`+cnt+`" required/>
              </div>

              <div class="col-sm-3">      
                <input type="text" class="form-control text-center" id="partNumber`+cnt+`" name="partNumber`+cnt+`" required/>
              </div>
            </div>`
          );
          domConstruct.place(row, rowBody, "last");
          
          // this code will keep the scroll bar down when new row is added
          html.scrollTop = html.scrollHeight - html.clientHeight;
        });
        
        // rows destroyer
        on(dltRowBtn, "click", function() {
          if (cnt > 1) {
            domConstruct.destroy(dom.byId("row" + cnt--));
            counter.value = cnt;
          }
        });
        
        // form submitter
        on(form, "submit", function(evt) {
          evt.stopPropagation();
          evt.preventDefault();
          poNumber.removeAttribute('disabled');
          for (var i = 2; i <= cnt; i++) {
            dom.byId("quantity1").value += "#" + dom.byId("quantity"+i).value;
            dom.byId("kind1").value += "#" + dom.byId("kind"+i).value;
            dom.byId("description1").value += "#" + dom.byId("description"+i).value;
            dom.byId("partNumber1").value += "#" + dom.byId("partNumber"+i).value;
          }
          request.post("add.jsp",{
        	data: domForm.toObject(form)
          }).response.then(
        	function(response) {
              document.location.href = "index.jsp";
        	},
        	function(error) {
              console.log("error: " + error);
        	});
        });
        
        // record deleter
        on(dltRecordBtn, "click", function(){
          request.post("delete.jsp",{
            data: {poNumber: window.location.search.substring(10)}
          }).response.then(
            function(response) {
              document.location.href = "index.jsp";
            },
            function(error) {
              console.log("error: " + error);
            });
        });
        
        // cancel btn
        on(cancelBtn, "click", function(){
          document.location.href = "index.jsp";
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
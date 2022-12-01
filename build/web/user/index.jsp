<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  
        if (null != session.getAttribute("name")){
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
        <a class="navbar-brand" href="../visitor/index.html"><img src="../image/logo_ds.svg" alt="DataServe logo" width="125" height="60" /></a>
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
    
    <!-- Button trigger modal -->
    <div class="mt-5 text-center">
      <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">Add New Record</button>
    </div>
    

    <!-- Striped table -->
    <div class="container mt-3">
      <table id="myTable" class="table table-striped text-center">
        <thead>
          <tr>
            <th scope="col">P.O Number</th>
            <th scope="col">Project Name</th>
            <th class="skip-filter" scope="col">Edit</th>
            <th class="skip-filter" scope="col">Print</th>
          </tr>
        </thead>
        <tbody id="tbody"></tbody>
      </table>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-xl">
        <div class="modal-content">
          
          <!-- Modal header -->
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel">New Record</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>

          <!-- Modal body -->
          <div class="modal-body">
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
                <input type="number" class="form-control text-center" id="poNumber" name="poNumber" placeholder="e.g. 201101446687" required/>
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
              <input type="hidden" id="newRecord" name="newRecord" value="1" />
              
            </form>
          </div>

          <!-- Modal footer -->
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="submit" form="myForm" class="btn btn-success">Save Record</button>
          </div>
        </div>
      </div>
    </div>

    <script>
      var editIcon = `<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16"><path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/><path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/></svg>`
      var printIcon = `<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-printer" viewBox="0 0 16 16"><path d="M2.5 8a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1z"/><path d="M5 1a2 2 0 0 0-2 2v2H2a2 2 0 0 0-2 2v3a2 2 0 0 0 2 2h1v1a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2v-1h1a2 2 0 0 0 2-2V7a2 2 0 0 0-2-2h-1V3a2 2 0 0 0-2-2H5zM4 3a1 1 0 0 1 1-1h6a1 1 0 0 1 1 1v2H4V3zm1 5a2 2 0 0 0-2 2v1H2a1 1 0 0 1-1-1V7a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1h-1v-1a2 2 0 0 0-2-2H5zm7 2v3a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1v-3a1 1 0 0 1 1-1h6a1 1 0 0 1 1 1z"/></svg>`
      var cnt = 1;
      
      require([
        "dojo",
        "dojo/dom",
        "dojo/on",
        "dojo/request",
        "dojo/dom-construct",
        "dojo/dom-form",
        "dojo/domReady!",
      ], function (dojo, dom, on, request, domConstruct, domForm) {
        var modal = dom.byId("exampleModal");
        var tbody = dom.byId("tbody");
        var form = dom.byId("myForm");
        var rowBody = dom.byId("rowBody");
        var addRowBtn = dom.byId("addRowBtn");
        var dltRowBtn = dom.byId("dltRowBtn");
        var counter = dom.byId("counter");
        
        // striped table builder
        dojo.ready(function () {
          request.post("view.jsp", { handleAs: "json" }).response.then(
            function (response) {
              console.log(response.data)
              var dataStore = response.data;
              for (obj of dataStore) {
                var row = domConstruct.toDom(
                  `<tr>
                    <td>`+obj.poNumber+`</td>
                    <td>`+obj.projectName+`</td>
                    <td><a href="form.jsp?poNumber=`+obj.poNumber+`">`+editIcon+`</a></td>
                    <td><a href="print.html?poNumber=`+obj.poNumber+`" target="_blank">`+printIcon+`</a></td>
                  </tr>`
                );
                domConstruct.place(row, tbody, "last");
              }
            },
            function (error) {
              console.log("error: " + error);
            }
          );
        });
        
        // rows builder
        on(addRowBtn, "click", function(){
          counter.value = ++cnt;
          var row = domConstruct.toDom(
            `<div class="mb-3 row" id="row`+cnt+`">
              <div class="col-sm-3">      
                <input type="text" class="form-control text-center" id="quantity`+cnt+`" name="quantity`+cnt+`" pattern="^[0-9#]+$" required/>
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
          )
          domConstruct.place(row, rowBody, "last");
          
          // this code will keep the scroll bar down when new row is added
          modal.scrollTop = modal.scrollHeight - modal.clientHeight;
        })
        
        // rows destroyer
        on(dltRowBtn, "click", function() {
          if (cnt > 1) {
            domConstruct.destroy(dom.byId("row" + cnt--));
          }
        })
        
        // form submitter
        on(form, "submit", function(evt) {
          evt.stopPropagation();
          evt.preventDefault();
          for (var i = 2; i <= cnt; i++) {
            dom.byId("quantity1").value += "#" + dom.byId("quantity"+i).value;
            dom.byId("kind1").value += "#" + dom.byId("kind"+i).value;
            dom.byId("description1").value += "#" + dom.byId("description"+i).value;
            dom.byId("partNumber1").value += "#" + dom.byId("partNumber"+i).value;
          }
          request.post("add.jsp",{
        	data: domForm.toObject(form),
          }).response.then(
        	function(response) {
              if (Number(response.data) === 0) {
                alert("This record already exists!");
              } else if (Number(response.data) === 1){
                for (var i = cnt; i > 1; i--) {
                  domConstruct.destroy(dom.byId("row"+i));
                }
                cnt = 1;
                counter.value = cnt;
                form.reset();
                location.reload();
              }
        	},
        	function(error) {
              console.log("error: " + error);
        	});
        })
      });
    </script>
    
    <!-- search algorithm -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="ddtf.js"></script>
    <script>
      $('#myTable').ddTableFilter();
    </script>
    <script>
      $(document).ready(function(){
        $("#myInput").on("keyup", function() {
          var value = $(this).val().toLowerCase();
          $("#tbody tr").filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
          });
        });
      });
    </script>
  </body>
</html>
<%
    } else {
        response.sendRedirect("loginPage.jsp");
    }
%>
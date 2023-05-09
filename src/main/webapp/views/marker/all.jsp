<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  <%-- //jstl을 쓰겠다는 뜻!!
c 로 쓰겠다는것, 그래서 밑에 c:out  으로 쓸 수 있음--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Begin Page Content -->
<div class="container-fluid">
  <style>
    .small_img{
      width: 50px;
    }
  </style>
  <script>
    let marker_search = {
      init:function (){
        $('#search_btn').click(function (){
          $('#search_form').attr({
            method:'get',
            action:'/marker/search'
          });
          $('#search_form').submit();
        });
      }
    };
    $(function (){
      marker_search.init();
    })
  </script>

  <!-- Page Heading -->
  <h1 class="h3 mb-2 text-gray-800">Maker all</h1>


  <!-- DataTales Example -->
  <div class="card shadow mb-4">
    <div class="card-header py-3">
      <h6 class="m-0 font-weight-bold text-primary">Marker all</h6>
      <form id="search_form" class="form-inline well">
        <div class="form-group">
          <label class="control-label col-sm-4" for="loc">loc:</label>
          <div class="col-sm-4">
            <select class="form-control" id="loc" name="loc">
                <option value="">지역</option>
                <option value="s"<c:if test="${ms.loc=='s'}">selected</c:if>>서울</option>
                <option value="b"<c:if test="${ms.loc=='b'}">selected</c:if>>부산</option>
                <option value="j"<c:if test="${ms.loc=='j'}">selected</c:if>>제주</option>
            </select>
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-2" for="title">title:</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" placeholder="title 입력" id="title" name="title">
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-offset-2 col-sm-10">
            <button id="search_btn" type="button" class="btn btn-info">Register</button>
          </div>
        </div>
      </form>


    </div>
    <div class="card-body">
      <div class="table-responsive">
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
          <thead>
          <tr>
            <th>id</th>
            <th>title</th>
            <th>target</th>
            <th>lat</th>
            <th>lng</th>
            <th>img</th>
            <th>loc</th>
          </tr>
          </thead>

          <tbody>
          <c:forEach var="obj" items="${mlist}">

            <tr>
              <td><a href="/marker/detail?id=${obj.id}">${obj.id}</a></td>
              <td>${obj.title}</td>
              <td><a href="${obj.target}">${obj.target}</a></td>
              <td>${obj.lat}</td>
              <td>${obj.lng}</td>
              <td><a href="#"  data-toggle="modal" data-target="#target${obj.id}"><img class="small_img" src="/uimg/${obj.img}"></a></td>
              <td>${obj.loc}</td>
            </tr>

            <!-- Modal -->
            <div id="target${obj.id}" class="modal fade" role="dialog">
              <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                  <div class="modal-header">
                    <h4 class="modal-title">Detail image</h4>
                  </div>
                  <div class="modal-body">
                    <p>${obj.title}</p>
                    <img  src="/uimg/${obj.img}">
                  </div>
                  <div class="modal-footer">
                    <a href="/marker/detail?id=${obj.id}" class="btn btn-info" role="button">Link Button</a>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                  </div>
                </div>

              </div>
            </div>
            <!-- Modal end -->
          </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </div>

</div>
<!-- /.container-fluid -->
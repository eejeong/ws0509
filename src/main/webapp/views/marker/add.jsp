<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
  let marker_add = {
    init : function () {
      $('#register_btn').click(function () {
        marker_add.send();
      });
    },
    send : function () {
      $('#register_form').attr({
        method:'post',
        action:'/marker/addimpl',
        enctype: 'multipart/form-data'
      });
      $('#register_form').submit();
    }
  };
  $(function () {
    marker_add.init();
  });
</script>

<!-- Begin Page Content -->
<div class="container-fluid">

  <!-- Page Heading -->
  <h1 class="h3 mb-2 text-gray-800">Marker Add</h1>
  <!-- DataTales Form -->
  <div class="card shadow mb-4">
    <div class="card-header py-3">
      <h6 class="m-0 font-weight-bold text-primary">Marker Add</h6>
    </div>
    <div class="card-body">
      <form id="register_form" class="form-horizontal well">
        <div class="form-group">
          <label class="control-label col-sm-2" for="title">TITLE :</label>
          <div class="col-sm-10">
            <input type="text" name="title" class="form-control" id="title" placeholder="Enter Title">
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-2" for="target">TARGET :</label>
          <div class="col-sm-10">
            <input type="text" name="target" class="form-control" id="target" placeholder="Enter target">
          </div>
        </div>
        <%-- 이미지 한번에 업로드 할 수 있다.--%>
        <div class="form-group">
          <label class="control-label col-sm-2" for="lat">LAT :</label>
          <div class="col-sm-10">
            <input type="number" name="lat" class="form-control" id="lat" placeholder="Input LAT">
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-2" for="lng">LNG :</label>
          <div class="col-sm-10">
            <input type="number" name="lng" class="form-control" id="lng" placeholder="Input LNG">
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-2" for="imgfile">IMG :</label>
          <div class="col-sm-10">
            <input type="file" name="imgfile" class="form-control" id="imgfile" placeholder="Input IMG">
          </div>
        </div>
        <div class="form-group">
          <label for="loc">Select LOC</label>
          <select class="form-control" id="loc" name="loc">
            <option>S</option>
            <option>B</option>
            <option>J</option>
          </select>
        </div>
        <div class="form-group">
          <div class="col-sm-offset-2 col-sm-10">
            <button id="register_btn" type="button" class="btn btn-info">Register</button>
          </div>
        </div>
      </form>
    </div>
  </div>

</div>
<!-- /.container-fluid -->
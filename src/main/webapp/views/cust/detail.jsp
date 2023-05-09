<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
  let cust_detail = {
    init:function(){
      $('#update_btn').click(function(){
        cust_detail.send();
      });
      $('#delete_btn').click(function(){
        var c = confirm("삭제하시겠습니까?");
        if(c == true){
          location.href="/cust/deleteimpl?id=${custdetail.id}";
        }
      });
    },
    send:function(){
      $('#detail_form').attr({
        method:'post',
        action:'/cust/updateimpl'
      });
      $('#detail_form').submit();
    }
  };

  $(function(){
    cust_detail.init();
  });
</script>

<div class="container-fluid">

  <!-- Page Heading -->
  <h1 class="h3 mb-2 text-gray-800">Cust Detail</h1>

  <!-- DataTales Example -->
  <div class="card shadow mb-4">
    <div class="card-header py-3">
      <h6 class="m-0 font-weight-bold text-primary">Cust datail</h6>
    </div>
    <div class="card-body">
      <div id="container">
        <form id="detail_form" class="form-horizontal well">
          <div class="form-group">
            <label class="control-label col-sm-2" for="id">ID:</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" placeholder="id 입력" id="id" name="id" value="${custdetail.id}" readonly>
            </div>
            <div class="col-sm-10">
              <span id="check_id" class="bg-danger"></span>
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-sm-2" for="pwd">Password:</label>
            <div class="col-sm-10">
              <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-sm-2" for="pwd">이름:</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="name" placeholder="Enter name" name="name" value="${custdetail.name}">
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <button id="update_btn" type="button" class="btn btn-info">Update</button>
              <button id="delete_btn" type="button" class="btn btn-info">Delete</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
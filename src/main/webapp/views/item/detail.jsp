<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
  let item_detail = {
    init:function (){
      $('#register_btn').click(function (){
        item_detail.send();
      });
      $('#delete_btn').click(function(){
        var c = confirm("삭제하시겠습니까?");
        if(c == true){
          location.href="/item/deleteimpl?id=${gitem.id}";
        };
      });
    },
    send:function (){
      $('#detail_form').attr({
        action:'/item/updateimpl',
        method:'post',
        enctype:'multipart/form-data'
      });
      $('#detail_form').submit();
    }
  };

  $(function (){
    item_detail.init();
  })
</script>

<div class="container-fluid">

  <!-- Page Heading -->
  <h1 class="h3 mb-2 text-gray-800">Item Detail</h1>

  <!-- DataTales Example -->
  <div class="card shadow mb-4">
    <div class="card-header py-3">
      <h6 class="m-0 font-weight-bold text-primary">${gitem.name}</h6>
    </div>
    <div class="card-body">
      <div id="container">
        <form id="detail_form" class="form-horizontal well">
          <input type="hidden" name="id" value="${gitem.id}">
          <input type="hidden" name="imgname" value="${gitem.imgname}">

          <div class="form-group">
            <div class="col-sm-10">
              <img src="/uimg/${gitem.imgname}">
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-sm-2" for="name">NAME:</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="name" placeholder="Enter name" name="name" value="${gitem.name}">
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-sm-2" for="price">PRICE:</label>
            <div class="col-sm-10">
              <input type="number" class="form-control" placeholder="Enter Price" id="price" name="price" value="${gitem.price}">
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-sm-2" for="img">Image:</label>
            <div class="col-sm-10">
              <input type="file" class="form-control" id="img" placeholder="Enter image" name="img">
            </div>
          </div>

          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <button id="register_btn" type="button" class="btn btn-info">Update</button>
              <button id="delete_btn" type="button" class="btn btn-info">Delete</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
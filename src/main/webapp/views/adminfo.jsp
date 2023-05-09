\<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let adminfo_form = {
        init:function(){
            $('#adminfo_btn').click(function(){
                adminfo_form.send();
            });
        },
        send:function(){
            var id = $('#id').val();
            var pwd = $('#pwd').val();
            var lev = $('#lev').val();
            if(id.length <= 3){
                $('#check_id').text("ID는 4자리 이상이어야 합니다.");
                $('#id').focus();
                return;
            }
            if(pwd == ''){
                $('#pwd').focus();
                return;
            }
            if(lev == ''){
                $('#lev').focus();
                return;
            }

            $('#adminfo_form').attr({
                'action':'/adminfoimpl',
                'method':'post'
            });
            $('#adminfo_form').submit();
        }
    };

    $(function(){
        adminfo_form.init();
    });

</script>

<div class="col-sm-8 text-center">
    <div class="container">
        <div class="col-sm-6 text-center">
            <h1>Adm Info Page</h1>
            <br/>
            <form id="adminfo_form" class="form-horizontal well">
                <div class="form-group">
                    <label class="control-label col-sm-2" for="id">ID:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" value="${adminfo.id}" id="id" name="id" readonly>
                    </div>
                    <div class="col-sm-10">
                        <span id="check_id" class="bg-danger"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="pwd">Password:</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="pwd" name="pwd">
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-2" for="pwd">lev:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="lev" name="lev" value="${adminfo.lev}">
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button id="adminfo_btn" type="button" class="btn btn-default">Update</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    let register_form = {
        init:function(){
            $('#register_btn').addClass('disabled');

            $('#register_btn').click(function(){
                register_form.send();
            });
            $('#lev').keyup(function (){
                var id = $('#id').val();
                var pwd = $('#pwd').val();
                var lev = $('#lev').val();
                if(id != '' && pwd != '' && lev !=''){
                    $('#register_btn').removeClass('disabled');
                }
            });
            $('#id').keyup(function (){
                var txt_id = $(this).val();
                if(txt_id.length <= 3){
                    return;
                }
                $.ajax({
                    url:'/checkid',
                    data:{'id':txt_id},
                    success:function (result){
                        if(result == 0){
                            $('#check_id').text('사용 가능한 ID 입니다.');
                            $('#pwd').focus();
                        } else {
                            $('#check_id').text('사용 불가능합니다.');
                        }
                    }
                });
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

            $('#register_form').attr({
                'action':'/registerimpl',
                'method':'post'
            });
            $('#register_form').submit();
        }
    };

    $(function(){
        register_form.init();
    });

</script>

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">REGISTER</h1>
    <div class="container">
        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                            </div>
                            <form id="register_form" class="user">
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="id" name="id"
                                           placeholder="ID를 입력하세요">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="pwd" name="pwd"
                                           placeholder="비밀번호를 입력하세요">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="lev" name="lev"
                                           placeholder="level을 입력하세요">
                                </div>
                                <button id="register_btn" type="button" class="btn btn-primary btn-user btn-block">Register</button>
                                <hr>
                            </form>
                            <hr>
                            <div class="text-center">
                                <a class="small" href="forgot-password.html">Forgot Password?</a>
                            </div>
                            <div class="text-center">
                                <a class="small" href="login.html">Already have an account? Login!</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</div>
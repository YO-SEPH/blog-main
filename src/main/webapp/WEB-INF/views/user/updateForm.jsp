<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../layout/header.jsp" %>

<div class="container">

    <form id="submitForm" class="was-validated">
        <input type="hidden" id="id" value="${principal.user.id}" />
        <div class="form-group">
            <label for="username">Username</label>
            <input type="text" value="${principal.user.username}" class="form-control" id="username" readonly>
        </div>

        <div class="form-group ">
            <label for="password">Password</label>
            <input type="password" class="form-control" id="password" required>
             <div class="invalid-feedback">바꾸실 비밀번호를 입력해주세요 :) </div>
        </div>

        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" value="${principal.user.email}" class="form-control" id="email" required>
            <div class="invalid-feedback">이메일을 입력해주세요. :) </div>
        </div>

        </br>
            <button type ="button" class="btn btn-primary btn-block" id="submit">회원수정하기</button>
            <button type="button" class="btn btn-danger btn-block" onclick="history.back()" >돌아가기</button>
        </div>

    </form>

</div>

<script src="/js/update.js"></script>
<style>
  .container {
    width: 500px;
    margin: 0 auto;
  }
  label {
    size: 20px;
  }
</style>
<%@ include file="../layout/footer.jsp"%>
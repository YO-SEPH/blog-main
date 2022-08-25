<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../layout/header.jsp" %>
    <!-- / (슬러쉬) 를 붙이면 몿찾는다-->

    <div class="container">
        <form class="was-validated" id="submitForm"  novalidate >

        <div class="col-md-12">
            <label for="username" class="form-label">username:</label>
                <input type="text" class="form-control" id="username" name="username" value="" required>
                <div class="invalid-feedback">이름은 2자 이상 8자 이하로 설정해주시기 바랍니다  :)</div>
        </div>

        <div class="col-md-12">
            <label for="email" class="form-label">email address:</label>
            <input type="email" class="form-control" id="email"  name="email" value="" required>
            <div class="invalid-feedback">이메일 형식을 지켜주시기 바랍니다. :) ex) xxxx@xxxx.xxx</div>
        </div>


        <div class="col-md-12">
            <label for="password" class="form-label">password:</label>
            <input type="password" class="form-control" id="password"  name="password" value="" required>
            <div class="invalid-feedback">특수 문자, 숫자, 대문자, 소문자 가능 :)</div>
        </div>


        <div class="col-12">
            </br>
            <button id="submit" type="button" class="btn btn-primary btn-block">회원가입</button>
            <button type="button" class="btn btn-danger btn-block" onclick="history.back()" >돌아가기</button>
        </div>

      </form>

    </div>
    <script src="/js/user.js"></script>

    <%@ include file="../layout/footer.jsp" %>

<style>
  .container {
    width: 500px;
    margin: 0 auto;
  }
</style>

<!--placeholder="" 인풋 안에 넣으면 글씨나옴 -->
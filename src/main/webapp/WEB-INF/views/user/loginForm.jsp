<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


  <%@ include file="../layout/header.jsp" %>
    <!-- / (슬러쉬) 를 붙이면 몿찾는다-->

    <div class="container">
      <form action="/auth/loginProc" method="post">
        <div class="form-group">
          <label for="username">username:</label>
          <input type="text" class="form-control" id="username" placeholder="Enter username" name="username" required>
        </div>

        <div class="form-group">
          <label for="password">password:</label>
          <input type="password" class="form-control" id="password" placeholder="Enter password" name="password" required>
        </div>

        <button id="btn-login" class="btn btn-primary">로그인</button>
      </form>
    </div>

    <%@ include file="../layout/footer.jsp" %>










    
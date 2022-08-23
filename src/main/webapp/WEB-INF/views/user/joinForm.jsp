<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../layout/header.jsp" %>
    <!-- / (슬러쉬) 를 붙이면 몿찾는다-->

    <div class="container">
      <form class="row g-3 needs-validation" id="submitForm" novalidate >

        <div class="col-md-7">
          <label for="username" class="form-label">username:</label>
          <input type="text" class="form-control" id="username" placeholder="Enter username" name="username" value="" required>
          </br>
          <button type="button" id="idChk" class="btn btn-success">Check</button>
        </div>

        <div class="col-md-7">
          <label for="email" class="form-label">email address:</label>
          <input type="email" class="form-control" id="email" placeholder="Enter email" name="email" value="" required>
        </div>

        <div class="col-md-7">
          <label for="password" class="form-label">password:</label>
          <input type="password" class="form-control" id="password" placeholder="Enter password" name="password" value="" required>
        </div>

        <div class="col-12">
        </br>
            <button id="submit" type="button" class="btn btn-primary">회원가입</button>
        </div>

      </form>
    </div>
    <script src="/js/user.js"></script>

    <%@ include file="../layout/footer.jsp" %>

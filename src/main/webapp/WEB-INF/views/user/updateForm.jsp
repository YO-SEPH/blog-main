<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../layout/header.jsp" %>

<div class="container">

    <form id="submitForm">
        <input type="hidden" id="id" value="${principal.user.id}" />
        <div class="form-group">
            <label for="username">Username</label>
            <input type="text" value="${principal.user.username}" class="form-control" placeholder="Enter username" id="username" readonly>
        </div>

        <div class="form-group ">
            <label for="password">Password</label>
            <input type="password" class="form-control" placeholder="Enter password" id="password" value="••••" required>
            <div class="valid-feedback">Valid.</div>
            <div class="invalid-feedback">Please fill out this field.</div>
        </div>
        <div class="valid-feedback">Valid.</div>
        <div class="invalid-feedback">Please fill out this field.</div>

        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" value="${principal.user.email}" class="form-control" placeholder="Enter email" id="email" required>
        </div>

        </br>
            <button type="button" class="btn btn-secondary" onclick="history.back()" >돌아가기</button>
            <button type ="button" class="btn btn-primary" id="submit">회원수정하기</button>
        </div>

    </form>

</div>

<script src="/js/update.js"></script>
</script>
<%@ include file="../layout/footer.jsp"%>
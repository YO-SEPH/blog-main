<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "sec" uri = "http://www.springframework.org/security/tags" %>

<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="principal"/>
</sec:authorize>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>게시판</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/custom.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"
            integrity="sha512-rstIgDs0xPgmG6RX1Aba4KV5cWJbAMcvRCVmglpam9SoHZiUCyQVDdH2LPlxoHtrv17XWblE/V/PP+Tr04hbtA=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer">
    </script>
    
</head>
<body>

    <nav class="navbar navbar-expand-md bg-dark navbar-dark">
        <a class="navbar-brand" href="/">게시판&#128525;</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="collapsibleNavbar">
            <c:choose>
                <c:when test= "${empty principal}" >
                    <ul class="navbar-nav">
                        <li class="nav-item"><a class="nav-link" href="/auth/loginForm">로그인</a></li>
                        <li class="nav-item"><a class="nav-link" href="/auth/joinForm">회원가입</a></li>
                    </ul>
                </c:when>

                <c:otherwise>
                    <ul class="navbar-nav">
                        <li class="nav-item"><a class="nav-link" href="/board/saveForm">글 작성</a></li>
                        <li class="nav-item"><a class="nav-link" href="/user/updateForm">회원정보</a></li>
                        <li class="nav-item">
                            <a class="nav-link" href="/logout" id ="logout" onclick="alert('로그아웃 되었습니다')">로그아웃</a>
                        </li>
                    </ul>
                </c:otherwise>

            </c:choose>

        </div>
    </nav>
    <br />
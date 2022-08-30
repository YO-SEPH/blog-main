<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


  <%@ include file="../layout/header.jsp" %>
    <!-- / (슬러쉬) 를 붙이면 몿찾는다-->

    
    <div class="container">
      <form action="/auth/loginProc" method="post" id="submitForm">
        <div class="form-group">
          <label for="username">username:</label>
          <input type="text" class="form-control" id="username" name="username" required>

        </div>

        <div class="form-group">
          <label for="password">password:</label>
          <input type="password" class="form-control" id="password" name="password" required>
          <div class="invalid-feedback">비밀번호를 입력해주세요 :)</div>
        </div>

        <button id="submit" class="btn btn-primary btn-block">로그인</button>
        <button type="button" class="btn btn-danger btn-block" onclick="history.back()">돌아가기</button>

      </form>
    </div>

    <%@ include file="../layout/footer.jsp" %>
      <script>
        //var formVailid = {

        //  rules: {
        //    username: {
        //      required: true,
        //    },
        //    password: {
        //      required: true
        //    },
        //  },
        //  messages: {
        //    username: {
        //      required: "아이디를 입력해주세요",
        //    },
        //    password: {
        //      required: "비밀번호를 입력해주세요"
        //    }
        //  }
        //}

        //$('#submit').click(function (e) {
        //  e.preventDefault()
        //  $("#submitForm").validate(formVailid);
        //  if (!$("#submitForm").valid()) {
        //    return false;
          
        //  }
        //});
        

      </script>


      <style>
        .container {
          width: 500px;
          margin: 0 auto;
        }

        /* input 태그에 클래스가 error 인 요소 */
        input.error {
          border: 1px solid red;
        }

        /* label 태그에 클래스가 error 인 요소 */
        label.error {
          color: red;
          font-size: 13px;
        }
      </style>

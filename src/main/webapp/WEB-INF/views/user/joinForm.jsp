<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <%@ include file="../layout/header.jsp" %>
        <!-- / (슬러쉬) 를 붙이면 몿찾는다-->

        <div class="container">
            <form id="submitForm" novalidate>

                <div class="col-md-12">
                    <label for="username" class="form-label">username</label>
                    <input type="text" class="form-control" id="username" name="username" value="" required>
                    <button type="button" onclick="checkId()" class="btn btn-danger">중복체크</button>
                    <d id="idAvailable" class="valid-feedback" style="display: none;"></d>
                    <d id="idNotAvailable" class="invalid-feedback" style="display: none;"></d>
                    <p id="demo"></p>
                </div>

                <div class="col-md-12">
                    <label for="email" class="form-label">email</label>
                    <input type="email" class="form-control" id="email" name="email" value="" required>

                </div>


                <div class="col-md-12">
                    <label for="password" class="form-label">password</label>
                    <input type="password" class="form-control" id="password" name="password" value="" required>

                </div>

                <div class="col-12">
                    </br>
                    <button id="submit" type="button" class="btn btn-primary btn-block">회원가입</button>
                    <button type="button" class="btn btn-danger btn-block" onclick="history.back()">돌아가기</button>
                </div>
           </form>

        </div>
        <script src="/js/user.js"></script>
        <script>

            //function checkId() {
            //    var id = $('#username').val(); //id값이 "id"인 입력란의 값을 저장
            //    $.ajax({
            //        url: '/idCheck', //Controller에서 요청 받을 주소
            //        type: 'post', //POST 방식으로 전달
            //        data: { id: id },
            //        success: function (cnt) { //컨트롤러에서 넘어온 cnt값을 받는다 
            //            if (cnt == 0) { //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
            //                $('.id_ok').css("display", "inline-block");
            //                $('.id_already').css("display", "none");
            //            } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
            //                $('.id_already').css("display", "inline-block");
            //                $('.id_ok').css("display", "none");
            //                alert("아이디를 다시 입력해주세요");
            //                $('#id').val('');
            //            }
            //        },
            //        error: function () {
            //            alert("에러입니다");
            //        }
            //    });
            //}
            /**실패작*/
            function checkId() {
                $.ajax({
                    url: '/id/check',
                    type: 'GET',
                    contentType: 'application/json',
                    data: {
                        username: $("#username").val()
                    },
                    success: function(result) {
                        $('#idNotAvailable').hide();
                        $('#idAvailable').show().text("사용가능한 아이디 입니다.").append($('<br />'));
                    },
                    error: function(error) {
                        $('#idAvailable').hide();
                        $('#idNotAvailable').show().text('이미 사용중인 아이디 입니다.').append($('<br />'));
                    }
                })
            }
        </script>


        <%@ include file="../layout/footer.jsp" %>

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

                .id_ok {
                    color: #008000;
                    display: none;
                }

                .id_already {
                    color: #6A82FB;
                    display: none;
                }
            </style>
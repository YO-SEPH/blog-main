<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <%@ include file="../layout/header.jsp" %>
        <!-- / (슬러쉬) 를 붙이면 몿찾는다-->

        <div class="container">
            <form id="submitForm" novalidate>

                <div class="col-md-12">
                    <label for="username" class="form-label">username</label>
                    <input type="text" class="form-control" id="username" name="username" value="" required>
                    <button type="button"  onclick="checkId()" class="btn btn-danger">중복체크</button>
                    <span class="id_ok">사용 가능한 아이디입니다.</span>
                    <span class="id_already">누군가 이 아이디를 사용하고 있어요.</span>
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
            //function myFunction() {
            //    var x = document.getElementById("username").value;
            //    document.getElementById("demo").innerHTML = "You wrote: " + x;
            //}

            function checkId(){
        var id = $('#username').val(); //id값이 "id"인 입력란의 값을 저장
        $.ajax({
            url:'/idCheck', //Controller에서 요청 받을 주소
            type:'post', //POST 방식으로 전달
            data:{id : id},
            success:function(data){ //컨트롤러에서 넘어온 cnt값을 받는다 
                if(data == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
              console.log('success');
                } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
                    $('.id_already').css("display","inline-block");
                    $('.id_ok').css("display", "none");
                    alert(data);
                    $('#username').val('');
                }
            },
            error:function(){
                alert("에러입니다");
            }
        });
        };            
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
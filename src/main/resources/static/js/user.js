let index = {
    init: function () {
        $("#btn-save").on("click", ()=>{ // function(){} 대신 ()=>{} 를 쓴 이유 : this를 바인딩하기 위해서
            this.save();
        });
        $("#btn-update").on("click", ()=>{ // function(){} 대신 ()=>{} 를 쓴 이유 : this를 바인딩하기 위해서
            this.update();
        });
//         $("#btn-login").on("click", ()=> { //function() {} , () =>{} 를 사용한 이유는 this를 바인딩하기 위해서!!
//             this.login();
//         });
    },
    save: function () {

        // Example starter JavaScript for disabling form submissions if there are invalid fields
        (function () {
            'use strict'

            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.querySelectorAll('.needs-validation')

            // Loop over them and prevent submission
            Array.prototype.slice.call(forms)
                .forEach(function (form) {
                    form.addEventListener('submit', function (event) {
                        if (!form.checkValidity()) {
                            event.preventDefault()
                            event.stopPropagation()
                        }
                        if(form.checkValidity()) {
                            let data = {
                                username: $('#username').val(),
                                email: $('#email').val(),
                                password: $('#password').val()
                            }
                            $.ajax({
                                type: "POST",
                                url: "/auth/joinProc",
                                data: JSON.stringify(data),
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (resp) {

                                    if (resp.status == 500) {
                                        alert("아이디가 중복되었습니다.");
                                    } else {
                                        alert(status)
                                        alert("회원가입이 완료되었습니다.");
                                        location.href = "/";
                                    }
                                },
                                error: function (error) {
                                    alert("회원가입에 실패하였습니다.");
                                }
                            });
                        }
                        form.classList.add('was-validated')
                    }, false)
                })
        })()
    },

        //alert("user의 save함수 호출됨"); //확인창을 뜨게 하는 메소드
//        let data={
//            username: $("#username").val(),
//            password: $("#password").val(),
//            email: $("#email").val(),
//        };

//         if(data.username == '' || data.email == '' || data.password == '') {
//          alert("빈칸을 채워주세요");
//            return
//         }

//        // console.log(data);
//            // ajax 호출시 default가 비동기 호출
//            // ajax 통신을 이용해서 3개의 데이터를 json으로 변경하여 insert요청
//            // ajax 가 통신을 성공하고 서버가 json을 리턴해주면 자동으로 자바 오브젝트로 변환해준다.
            $.ajax({
                // 회원가입 수행 요청
                type: "POST",
                url: "/auth/joinProc",
                data: JSON.stringify(data), // http body 데이터
                contentType: "application/json; charset=utf-8", // body 데이터가 어떤 타입인지 (MIME)
                dataType: "json", // 요청을 서버로 해서 응답이 왔을 때 기본적으로 모든 것이 String(문자열), 만약 생긴게 json이라면 javascript 오브젝트로 변경
                success: function(resp)  {

                    if(resp.status == 500) {
                        alert("아이디가 중복되었습니다.");
                    } else {
                        alert(status)
                        alert("회원가입이 완료되었습니다.");
                        location.href="/";
                    }
                },
                error: function(error) {
                    alert("회원가입에 실패하였습니다.");
                }
                });
                // 결과가 정상이면 done 실행
//            }).done((resp) => {
//             alert("ok");
//            }).fail((error) => {
//                // 실패하면 fail 실행
//                alert("회원가입에 실패하였습니다");
//                alert(JSON.stringify(error));
//            });
            },
         update: function () {
             let data = {
                id: $("#id").val(),
                 username: $("#username").val(),
                 password: $("#password").val(),
                 email: $("#email").val()
             };
             if(data.password == '' || data.email == '') {
                  alert("빈칸을 채워주세요");
                  return
             }
             $.ajax({
                 type: "PUT",
                 url: "/user",
                 data: JSON.stringify(data), // http body 데이터
                 contentType: "application/json; charset=utf-8", // body 데이터가 어떤 타입인지 (MIME)
                 dataType: "json", // 요청을 서버로 해서 응답이 왔을 때 기본적으로 모든 것이 String(문자열), 만약 생긴게 json이라면 javascript 오브젝트로 변경
                 success: function(resp) {
                     alert("회원수정이 완료되었습니다.");
                     location.href="/";
                 },
                 error: function(error) {
                    alert("회원수정에 실패하였습니다.");
                 }
//             }).done(function (resp) {
//                //  결과가 정상이면 done 실행
//                if(resp.password === null) {
//                    alert("회원수정이 실패하였습니다.");
//                    location.href="/";
//                } else {
//                 alert("회원수정이 완료되었습니다.");
//                }
//                 //console.log(resp);
//                 location.href = "/";
//             }).fail(function (error) {
//                 // 실패하면 fail 실행
//                 alert("회원수정이 실패하였습니다.");
//                 alert(JSON.stringify(error));
//             });
         });
        }
        }
index.init();

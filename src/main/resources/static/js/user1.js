
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
    save:function() {
        let data = {
                    username: $('#username').val(),
                    email: $('#email').val(),
                    password: $('#password').val()
        }

            $.ajax({
                // 회원가입 수행 요청
                type: "POST",
                url: "/auth/joinProc",
                data: JSON.stringify(data), // http body 데이터
                contentType: "application/json; charset=utf-8", // body 데이터가 어떤 타입인지 (MIME)
                dataType: "json", // 요청을 서버로 해서 응답이 왔을 때 기본적으로 모든 것이 String(문자열), 만약 생긴게 json이라면 javascript 오브젝트로 변경
                success: function(resp)  {
                    if(resp == "Failed") {
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

                            form.classList.add('was-validated')
                          }, false)
                        })
                    }
                    else if (resp == 'success') {
                        alert("회원가입 성공");
                    }
                }
                });

},
}
index.init();

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

},
index.init();

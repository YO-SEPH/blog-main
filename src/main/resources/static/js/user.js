
var formVailid = {

    rules : {
    username : {
        required : true,
    },
    password : {
        required : true
    },
    email : {
        required : true
    }
    },
     messages: {
         username: {
             required: "아이디를 입력해주세요",
        },
        email: {
            required: "이메일을 입력해주세요.",
            email: "이메일 형식을 확인하세요."
        },
        password: {
            required: "비밀번호를 입력해주세요"
        }
    }
}

    $('#submit').click(function(e){
    e.preventDefault()
        $("#submitForm").validate(formVailid);
        if(!$("#submitForm").valid()) {
            return false;
        }
          let data={
                username: $("#username").val(),
                password: $("#password").val(),
                email: $("#email").val()
          };
        $.ajax({
            // 회원가입 수행 요청
            type: "POST",
            url: "/auth/joinProc",
            data: JSON.stringify(data), // http body 데이터
            contentType: "application/json; charset=utf-8", // body 데이터가 어떤 타입인지 (MIME)
            dataType: "json" // 요청을 서버로 해서 응답이 왔을 때 기본적으로 모든 것이 String(문자열), 만약 생긴게 json이라면 javascript 오브젝트로 변경
        }).done((resp) => {
            alert("회원가입 완료하였습니다.");
            location.href = "/";
        }).fail((err) => {
            alert(err);
        });
    })

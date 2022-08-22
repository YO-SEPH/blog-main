
var formVailid = {

    rules : {
    username : {
        required : true
    },
    password : {
        required : true
    },
    email : {
        required : true
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
            alert("success");
            location.href = "/";
        }).fail((err) => {
            alert(err);
        });
    })

//         update: function () {
//             let data = {
//                id: $("#id").val(),
//                 username: $("#username").val(),
//                 password: $("#password").val(),
//                 email: $("#email").val()
//             };
//
//             $.ajax({
//                 type: "PUT",
//                 url: "/user",
//                 data: JSON.stringify(data), // http body 데이터
//                 contentType: "application/json; charset=utf-8", // body 데이터가 어떤 타입인지 (MIME)
//                 dataType: "json" // 요청을 서버로 해서 응답이 왔을 때 기본적으로 모든 것이 String(문자열), 만약 생긴게 json이라면 javascript 오브젝트로 변경
//             }).done(function (resp) {
//                //  결과가 정상이면 done 실행
//                if(resp.password === null) {
//                    alert("회원수정이 실패하였습니다.");
//                    location.href="/"
//                } else {
//                 alert("회원수정이 완료되었습니다.");
//                }
//                 //console.log(resp);
//                 location.href = "/";
//             }).fail(function (error) {
//                 // 실패하면 fail 실행
//                 alert("회원수정이 실패하였습니다.");
////                 alert(JSON.stringify(error));
////             });
////         },
//        }
//index.init();
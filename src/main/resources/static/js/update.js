var formVailid = {

    rules : {

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
           let data = {
                  id: $("#id").val(),
                   username: $("#username").val(),
                   password: $("#password").val(),
                   email: $("#email").val()
               };
        $.ajax({
            // 회원가입 수행 요청
              type: "PUT",
              url: "/user",
              data: JSON.stringify(data), // http body 데이터
              contentType: "application/json; charset=utf-8", // body 데이터가 어떤 타입인지 (MIME)
              dataType: "json" // 요청을 서버로 해서 응답이 왔을 때 기본적으로 모든 것이 String(문자열), 만약 생긴게 json이라면 javascript 오브젝트로 변경
        }).done((resp) => {
            alert("회원수정 완료하였습니다.");
            location.href = "/user/updateForm";
        }).fail((err) => {
            alert(err);
        });
    })

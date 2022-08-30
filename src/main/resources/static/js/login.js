
var formVailid = {

    rules : {
    username : {
        required : true,
    },
    password : {
        required : true
    },
    },
     messages: {
         username: {
             required: "아이디를 입력해주세요",
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
    })

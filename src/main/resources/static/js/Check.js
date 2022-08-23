let index = {
    init: function () {
        $("#idChk").on("click", ()=>{
            this.check();
        });
    },

    let data= {
        username: $("#username").val()
    };

    check: function() {
        if(${principal.user.username} == data.username) {
            alert("아이디가 중복되었습니다.")
        } else {
            alert("가입가능한 아이디 입니다.")
        }
    }
    }
    index.init();
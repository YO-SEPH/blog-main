let index = {
    init: function () {
        $("#btn-save").on("click", ()=>{
            this.save();
        });
        $("#btn-delete").on("click", ()=>{
            this.deleteById();
        });
        $("#btn-update").on("click", ()=>{
                    this.update();
        });
        $("#btn-reply-save").on("click", ()=>{
                    this.replySave();
        });
//        $("#btn-reply-delete").on("click", ()=>{
//                    this.replyDelete();
//        });

    },

    save: function () {
        let data = {
            title: $("#title").val(),
            content: $("#content").val()
        };

        $.ajax({
            type: "POST",
            url: "/api/board",
            data: JSON.stringify(data),
            contentType: "application/json; charset=utf-8",
            dataType: "json"
        }).done(function (resp) {
            // 결과가 정상이면 done 실행
            alert("업로드 하였습니다");
            location.href = "/";
        }).fail(function (error) {
            // 실패하면 fail 실행
            alert("업로드에 실패하였습니다");
            alert(JSON.stringify(error));
        });
    },

    deleteById: function () {
        var id = $("#id").text();

        $.ajax({
            type: "DELETE",
            url: "/api/board/"+id,
            dataType: "json"
        }).done(function (resp) {
            // 결과가 정상이면 done 실행
            alert("삭제하였습니다");
            location.href = "/";
        }).fail(function (error) {
            // 실패하면 fail 실행
            alert("삭제에 실패하였습니다");
            alert(JSON.stringify(error));
        });
    },


    // 위에 세이브랑 겹쳐서 안됨 나중에 다시 하자
    update: function () {
        let id = $("#id").val();

        let data = {
            title: $("#title").val(),
            content: $("#content").val()
        };

        $.ajax({
            type: "PUT",
            url: "/api/board/"+id,
            data: JSON.stringify(data),
            contentType: "application/json; charset=utf-8",
            dataType: "json"
        }).done(function (resp) {
            // 결과가 정상이면 done 실행
            alert("글수정이 완료되었습니다.");
            location.href = "/";
        }).fail(function (error) {
            // 실패하면 fail 실행
            alert("글수정을 실패하였습니다.");
            alert(JSON.stringify(error));
        });
    },

    replySave: function () {
            let data = {
                content: $("#reply-content").val()
            };
            let boardId = $("#boardId").val()

            $.ajax({
                type: "POST",
                url: `/api/board/${boardId}/reply`,
                data: JSON.stringify(data),
                contentType: "application/json; charset=utf-8",
                dataType: "json"
            }).done(function (resp) {
                // 결과가 정상이면 done 실행
                alert("댓글작성이 완료되었습니다.");
                location.href = `/board/${boardId}`;
            }).fail(function (error) {
                // 실패하면 fail 실행
                alert("댓글작성이 실패하였습니다.");
                alert(JSON.stringify(error));
            });
        },

        replyDelete: function (boardId, userId) {
                $.ajax({
                    type: "DELETE",
                    url: '/api/board/${boardId}/reply/${replyId}',
                    dataType: "json"
                }).done(function (resp) {
                    // 결과가 정상이면 done 실행
                    alert("삭제하였습니다");
                    location.href = `/board/${boardId}`;
                }).fail(function (error) {
                    // 실패하면 fail 실행
                    alert("삭제에 실패하였습니다");
                    alert(JSON.stringify(error));
                });
            },
        }
index.init();
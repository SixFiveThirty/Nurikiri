$("#btn-update").on("click", ()=>{
            this.update();
    });
    
update: function () {
        let data = {
            username: $("#username").val(),
            password: $("#password").val(),
            name: $("#name").val(),
            jumin: $("#jumin").val(),
            email: $("#email").val(),
            phone1: $("#phone1").val(),
            phone2: $("#phone2").val(),
            phone3: $("#phone3").val()
        };

        $.ajax({
            type: "PUT",
            url: "/profile",
            data: JSON.stringify(data),
            contentType: "application/json; charset=utf-8",
            dataType: "json"
        }).done(function (resp) {
            // 결과가 정상이면 done 실행
            alert("회원수정이 완료되었습니다.");
            //console.log(resp);
            location.href = "/profile";
        }).fail(function (error) {
            // 실패하면 fail 실행
            alert("회원수정이 실패하였습니다.");
            alert(JSON.stringify(error));
        });
    }
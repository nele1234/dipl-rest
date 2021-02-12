$('#loginButton').click(function () {
    var emailLog = $('#emailLogin').val();
    var passLog = $('#passwordLogin').val();

    function validateEmail($emailSign) {
        var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
        return emailReg.test($emailSign);
    }

    if (emailLog == "") {
        alert("Please enter your email address")
    } else if (!validateEmail(emailLog)) {
        alert("Please enter a valid email address")
    } else if (passLog == "") {
        alert("Please enter your password")
    } else {
        $.ajax({
            url: "flight master/flight-master/login?emailLog=" + emailLog + "&passLog=" + passLog,
            success: function (data) {
                if (data.indexOf('logged') > -1) {
                    alert("Logged in successfully.")
                } else if (data.indexOf('password') > -1) {
                    alert("Password is incorrect.")
                } else if (data.indexOf('email') > -1) {
                    alert("Email doesn't exists.")
                } else {
                    alert("Email doesn't exists.")
                }
            },
            error: function (data, err) {
                alert("Error occurred, please try again later.")
            }
        })
    }

});
$('#registerButton').click(function () {
    var firstName = $('#firstName').val()
    var lastName = $('#lastName').val()
    var emailReg = $('#emailRegister').val();
    var passReg = $('#passwordRegister').val();

    function validateEmail($emailSign) {
        var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
        return emailReg.test($emailSign);
    }

    if (firstName == "") {
        alert("Please enter your name")
    } else if (lastName == "") {
        alert("Please enter your surname")
    } else if (emailReg == "") {
        alert("Please enter your email address")
    } else if (!validateEmail(emailReg)) {
        alert("Please enter a valid email address")
    } else if (passReg == "") {
        alert("Please creat a password")
    } else {
        $.ajax({
            url: "flight master/flight-master/register?firstName=" + firstName + "&lastName=" + lastName + "&emailReg=" + emailReg + "&passReg=" + passReg,
            dataType: 'text',
            success: function (data) {
                if (data.indexOf('registered') > -1) {
                    alert("Account created successfully.")
                } else {
                    alert("Email already exists.")
                }
            },
            error: function (data, err) {
                alert("Error occurred, please try again later.")
            }
        })
    }

});
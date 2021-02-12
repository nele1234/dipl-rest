$('#feedbackButton').click(function () {
    var feedback = $('#feedback').val();

   
    if (feedback == "") {
        alert("Please enter your feedback")
    } else {
        $.ajax({
            url: "flight master/flight-master/feedbackSend?feedback=" + feedback,
            success: function (data) {
                if (data.indexOf('feedback') > -1) {
                    alert("Thank you.")
                } else {
                    alert("There is an error, plesae try again.")
                }
            },
            error: function (data, err) {
                alert("Error occurred, please try again later.")
            }
        });
    }

});
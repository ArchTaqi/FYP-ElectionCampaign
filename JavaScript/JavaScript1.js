function myFunction()
         {
    setInterval(function () { document.getElementById('<%=LblError1.ClientID%>').style.display = 'none'; }, 5000);
         
}

$(document).ready(function () {Z 
    myFunction();
});

$(window).load(function () {
    myFunction();
});

$(function () {
    $('#TxtNotification').keypress(function (e) {
        var txt = $(this).val();
        if (txt.length > 200) {
            e.preventDefault();
        }
    });
});
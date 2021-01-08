//var jsId = document.cookie.match(/JSESSIONID=[^;]+/);
//    if(jsId !== null) {
//        if (jsId instanceof Array)
//            jsId = jsId[0].substring(11);
//        else
//            jsId = jsId.substring(11);
//    }
//     console.log("session ID  " + jsId);
//     
//      var sessionID = '<%= session.getAttribute( "sessionID" ) %>';
//        alert(sessionID );
//
if (!sessionStorage.getItem('logged')) {
    console.log("sessionStorage.getItem('logged')");
//     window.location.replace = "https://www.literatureirelandgrantapplication.com/ILGAS/Logout";

//     var url = "https://www.literatureirelandgrantapplication.com/ILGAS/Logout";
//     $(location).attr('href',url);

    var xmlhttp;
//                        var uname = document.getElementById("uname").value;
    var urls = "https://www.literatureirelandgrantapplication.com/Logout";
    console.log("redirect xmlhttp " + urls);
    if (window.XMLHttpRequest)
    {
        xmlhttp = new XMLHttpRequest();
    } else
    {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function ()
    {
        if (xmlhttp.readyState === 4)
        {
//                                document.getElementById("error").innerHTML = xmlhttp.responseText;
            console.log("error" + xmlhttp.responseText);
        }
    };
    xmlhttp.open("post", urls, true);
    xmlhttp.send();
//     document.location.href = 'killSession.jsp';
//    $.post("Logout", $("#loginform").serialize(), function (data) {
////        alert(data);
//        return false;
//    });
} else {
    console.log("sessionStorage.getItem(NONE)");
}
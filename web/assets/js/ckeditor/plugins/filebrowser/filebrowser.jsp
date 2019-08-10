<%-- 
    Document   : filebrowser
    Created on : 17-May-2019, 00:54:24
    Author     : markus
https://stackoverflow.com/questions/1498628/how-can-you-integrate-a-custom-file-browser-uploader-with-ckeditor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>


        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>        
        <script src="https://cdn.ckeditor.com/4.5.11/full/ckeditor.js"></script>
    </head>
    <body>
        <script>


            function getUrlParam(paramName) {
                 console.log('filebrowser returnFileUrl getUrlParam ' + paramName);
                var reParam = new RegExp('(?:[\?&]|&)' + paramName + '=([^&]+)', 'i');
                var match = window.location.search.match(reParam);
                 console.log('filebrowser returnFileUrl match ' + match);
                return (match && match.length > 1) ? match[1] : null;
            }

            function returnFileUrl() {
                var funcNum = "";
                funcNum = getUrlParam('CKEditorFuncNum');
                 console.log('filebrowser returnFileUrl funcNum: ' + funcNum);
                //var fileUrl = 'https://patiliyo.com/wp-content/uploads/2017/07/ruyada-kedi-gormek.jpg';
//                var fileUrl = './assets/uploads/' + $(this).attr('title');
// var fileUrl = './assets/uploads/Animated-Flag-Ireland.gif';
               var fileUrl = './assets/uploads/template.html';
                window.opener.CKEDITOR.tools.callFunction(funcNum, fileUrl);
                window.close();
            }


            //when this window opens it will load all the images which you send from the FileBrowser Servlet. 
            getImages();
            function getImages() {
//                $.get("../FileBrowser", function (responseJson) {
                $.get("../FileBrowser", function (responseJson) {
                    console.log("filebrowser getImages  responseJson  " + responseJson);
                    //do something with responseJson (like create <img> tags and update the src attributes) 
                });
            }

            //you call this function and pass 'fileUrl' when user clicks on an image that you loaded into this window from a servlet
            returnFileUrl();
        </script>
    </body>

</html>

<%-- 
    Document   : browseFile
    Created on : 15-May-2019, 07:09:54
    Author     : markus
--%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MGR File Browser</title>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>        
        <script src="https://cdn.ckeditor.com/4.5.11/full/ckeditor.js"></script>

        <script type="text/javascript">
            function getUrlParam(paramName) {
                console.log('browseFile returnFileUrl getUrlParam ' + paramName);
                var reParam = new RegExp('(?:[\?&]|&)' + paramName + '=([^&]+)', 'i');
                var match = window.location.search.match(reParam);
                console.log('filebrowser returnFileUrl match ' + match);
                return (match && match.length > 1) ? match[1] : null;
            }
        </script>

        <script type="text/javascript">
            $(document).ready(function () {
//                $('#fileExplorer').on('click', 'img', function () {
                $('#fileExplorer').on('click', '#fileList li a', function () {
                    var funcNum = getUrlParam('CKEditorFuncNum');
                    console.log('browseFile returnFileUrl funcNum: ' + funcNum);
                    var fileUrl = './assets/uploads/' + $(this).text();
                    alert("fileUrl " + fileUrl);
                    console.log("fileUrl " + fileUrl);
                    window.opener.CKEDITOR.tools.callFunction(funcNum, fileUrl);
                    console.log("funcNum " + funcNum + " fileUrl  " + fileUrl);
                    window.close();
                }).hover(function () {
                    $(this).css('cursor', 'pointer');
                });


                function returnFileUrl() {
                    var funcNum = "";
                    funcNum = getUrlParam('CKEditorFuncNum');
                    console.log('browseFile returnFileUrl funcNum: ' + funcNum);
                    //var fileUrl = 'https://patiliyo.com/wp-content/uploads/2017/07/ruyada-kedi-gormek.jpg';
//                var fileUrl = './assets/uploads/' + $(this).attr('title');
// var fileUrl = './assets/uploads/Animated-Flag-Ireland.gif';
                    var fileUrl = './assets/uploads/template.html';
                    window.opener.CKEDITOR.tools.callFunction(funcNum, fileUrl);
                    window.close();
                }
                ;
            });
        </script>

        <style>
            body {
                font-family: 'Segoe UI', Verdana, Helvetica, sans-serif;
                font-size: 80%;
            }
            #form {
                width: 600px;
            }
            #folderExplorer {
                float: left;
                width: 100px;
            }
            #fileExplorer {
                float: left;
                width: 680px;
                border-left: 1px solid #dff0ff;
            }
            .thumbnail {
                float: left;
                margin: 3px;

            }
            ul {
                list-style-type: none;
                margin: 0;
                padding: 0;
            }
            li {
                padding: 0;
            }

        </style>

    </head>
    <body>
        <h1>Hello browseFile.jsp my World!</h1>

        <div id="fileExplorer">         
            <c:forEach var="file" items="${files}">
                <div>
                    <ul id ='fileList'>
                    <!--<a href="${pageContext.request.contextPath}/assets/uploads/${file.name }"  title="${file.name}" > ${file.name }    </a>-->
                    <!--<a href="#"  title="${file.name}" > ${file.name }    </a>-->
                        <li><a href="#">${file.name}</a></li>
                    </ul>
                </div>

            </c:forEach>
        </div>
    </body>
</html>

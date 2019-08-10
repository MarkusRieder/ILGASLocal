<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@ page session="true"%>--%>
<!DOCTYPE html>
<html style="height: 100%" >
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Translation Grant Application System</title>

        <!--JQuery-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

        <!-- Bootstrap -->

        <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

        <!--DataTables-->

        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.1.1/css/responsive.dataTables.min.css">
        <link rel="stylesheet" type="text/css" href="https:////cdn.datatables.net/buttons/1.5.2/css/buttons.dataTables.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/plug-ins/1.10.15/integration/font-awesome/dataTables.fontAwesome.css">


        <link rel="stylesheet" type="text/css" href="css/layout.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" type="text/css" href="css/datepicker.css">
        <link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.1/css/bootstrap-datepicker.css" />

        <link rel="stylesheet" href="css/lesshat.css" />
        <link rel="stylesheet" type="text/css" href="css/lightbox.min.css">
        <link rel="stylesheet" href="css/jquery.dataTables.yadcf.css" />
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/css/bootstrap-dialog.min.css">

        <link rel="stylesheet" type="text/css" href="css/query-builder.default.min.css" />

        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>        
        <script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>


        <script type="text/javascript"   src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.js"></script>  

        <script type="text/javascript"   src="https://cdn.datatables.net/responsive/2.1.1/js/dataTables.responsive.min.js"></script>       
        <!--<script type="text/javascript"   src="https://cdn.datatables.net/buttons/1.3.1/js/dataTables.buttons.min.js"></script>-->
        <script src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
        <script type="text/javascript"   src="//cdn.datatables.net/plug-ins/1.10.12/sorting/datetime-moment.js"></script>
        <script type="text/javascript"   src="//cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
        <script type="text/javascript"   src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/pdfmake.min.js"></script>
        <script type="text/javascript"   src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/vfs_fonts.js"></script>
        <script type="text/javascript"   src="//cdn.datatables.net/buttons/1.3.1/js/buttons.html5.min.js "></script>
        <script type="text/javascript"   src="//cdn.datatables.net/plug-ins/1.10.15/dataRender/datetime.js"></script>
        <script type="text/javascript"   src="js/bootstrap-datepicker.js"></script>
        <script type="text/javascript"   src="js/jquery-ui.js"></script>
        <script type="text/javascript"   src="js/lightbox.min.js"></script>
        <script type="text/javascript"   src="js/query-builder.standalone.min.js"></script>
        <!--<script src="https://cdn.jsdelivr.net/npm/jQuery-QueryBuilder@2.5.2/dist/js/query-builder.min.js"></script>-->
        <!--<script type="text/javascript"   src="js/jQuery.extendext.js"></script>-->
        <script type="text/javascript"   src="js/jquery.dataTables.yadcf.js"></script>
        <!--<script type="text/javascript"   src="js/widgEditor.js"></script>-->
        <script src="//ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/js/bootstrap-dialog.min.js"></script>
        <link href="https://cdn.webdatarocks.com/latest/webdatarocks.min.css" rel="stylesheet"/>
        <script src="https://cdn.webdatarocks.com/latest/webdatarocks.toolbar.min.js"></script>
        <script src="https://cdn.webdatarocks.com/latest/webdatarocks.js"></script>

        <script>
            window.onload = function () {
//                  https://robertnyman.com/2010/12/16/utilizing-the-html5-file-api-to-choose-upload-preview-and-see-progress-for-multiple-files/
                (function () {
                    var filesUpload = document.getElementById("files-upload"),
                            dropArea = document.getElementById("drop-area"),
                            fileList = document.getElementById("file-list");

                    function uploadFile(file) {
                        var li = document.createElement("li"),
                                div = document.createElement("div"),
                                img,
                                progressBarContainer = document.createElement("div"),
                                progressBar = document.createElement("div"),
                                reader,
                                xhr,
                                fileInfo;

                        li.appendChild(div);

                        progressBarContainer.className = "progress-bar-container";
                        progressBar.className = "progress-bar";
                        progressBarContainer.appendChild(progressBar);
                        li.appendChild(progressBarContainer);

                        /*
                         If the file is an image and the web browser supports FileReader,
                         present a preview in the file list
                         */
                        if (typeof FileReader !== "undefined" && (/image/i).test(file.type)) {
                            img = document.createElement("img");
                            li.appendChild(img);
                            reader = new FileReader();
                            reader.onload = (function (theImg) {
                                return function (evt) {
                                    theImg.src = evt.target.result;
                                };
                            }(img));
                            reader.readAsDataURL(file);
                        }

                        // Uploading - for Firefox, Google Chrome and Safari
                        xhr = new XMLHttpRequest();

                        // Update progress bar
                        xhr.upload.addEventListener("progress", function (evt) {
                            if (evt.lengthComputable) {
                                progressBar.style.width = (evt.loaded / evt.total) * 100 + "%";
                            } else {
                                // No data to calculate on
                            }
                        }, false);

                        // File uploaded
                        xhr.addEventListener("load", function () {
                            progressBarContainer.className += " uploaded";
                            progressBar.innerHTML = "Uploaded!";
                        }, false);

                        xhr.open("post", "upload/upload.php", true);

                        // Set appropriate headers
                        xhr.setRequestHeader("Content-Type", "multipart/form-data");
                        xhr.setRequestHeader("X-File-Name", file.name);
                        xhr.setRequestHeader("X-File-Size", file.size);
                        xhr.setRequestHeader("X-File-Type", file.type);

                        // Send the file (doh)
                        xhr.send(file);

                        // Present file info and append it to the list of files
                        fileInfo = "<div><strong>Name:</strong> " + file.name + "</div>";
                        fileInfo += "<div><strong>Size:</strong> " + parseInt(file.size / 1024, 10) + " kb</div>";
                        fileInfo += "<div><strong>Type:</strong> " + file.type + "</div>";
                        div.innerHTML = fileInfo;

                        fileList.appendChild(li);
                    }

                    function traverseFiles(files) {
                        if (typeof files !== "undefined") {
                            for (var i = 0, l = files.length; i < l; i++) {
                                uploadFile(files[i]);
                            }
                        } else {
                            fileList.innerHTML = "No support for the File API in this web browser";
                        }
                    }

                    filesUpload.addEventListener("change", function () {
                        traverseFiles(this.files);
                    }, false);

                    dropArea.addEventListener("dragleave", function (evt) {
                        var target = evt.target;

                        if (target && target === dropArea) {
                            this.className = "";
                        }
                        evt.preventDefault();
                        evt.stopPropagation();
                    }, false);

                    dropArea.addEventListener("dragenter", function (evt) {
                        this.className = "over";
                        evt.preventDefault();
                        evt.stopPropagation();
                    }, false);

                    dropArea.addEventListener("dragover", function (evt) {
                        evt.preventDefault();
                        evt.stopPropagation();
                    }, false);

                    dropArea.addEventListener("drop", function (evt) {
                        traverseFiles(evt.dataTransfer.files);
                        this.className = "";
                        evt.preventDefault();
                        evt.stopPropagation();
                    }, false);
                })();
            };
        </script>
    </head>
    <body>
        <div class="container">

            <h3>Choose file(s)</h3>
            <p>
                <input id="files-upload" type="file" multiple>
            </p>
            <p id="drop-area">
                <span class="drop-instructions">or drag and drop files here</span>
                <span class="drop-over">Drop files here!</span>
            </p>
            <ul id="file-list">
                <li class="no-items">(no files uploaded yet)</li>
            </ul>
        </div>
    </body>
</html>

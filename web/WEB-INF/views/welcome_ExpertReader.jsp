<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html style="height: 100%" >
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">-->

        <title>Translation Grant Application System</title>


        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
        <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>-->

        <!-- Bootstrap -->


        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/layout.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.css">
        <link rel="stylesheet" type="text/css" href="css/datepicker.css">
        <link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" type="text/css" href="css/dataTables.bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/jquery.dataTables.css">
        <link rel="stylesheet" type="text/css" href="css/responsive.dataTables.min.css">
        <link rel="stylesheet" type="text/css" href="css/irishLiterature.css">



        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>
        <script src="js/bootstrap-datepicker.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script src="js/jquery.dataTables.js"></script>
        <script src="js/dataTables.bootstrap.js"></script>
        <script src="js/dataTables.responsive.min.js"></script>
        <script src="js/dataTables.bootstrap.min.js"></script>
        <script src="https://cdn.datatables.net/responsive/2.1.1/js/responsive.bootstrap.min.js"></script>

        <script type="text/javascript"  src="js/pdf.js"></script>
        <script type="text/javascript"  src="js/pdf.worker.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-filestyle/2.1.0/bootstrap-filestyle.min.js"></script>


        <style>
            .form-horizontal .control-label {
                margin-bottom: 5px;
            }
            .form-horizontal .form-group {
                margin-bottom: 5px;
                margin-left:0px;
                margin-right:0px;
            }
            body {
                background: #d9d1d1;
            }

            .panel-body {
                margin-top: 5px;
                box-shadow: 0 0 10px black;
                padding:0 15px 0 15px;
                background: #d9d1d1;
            }
        </style>
        <style>
            .btn-file {
                position: relative;
                overflow: hidden;
            }
            .btn-file input[type=file] {
                position: absolute;
                top: 0;
                right: 0;
                min-width: 100%;
                min-height: 100%;
                font-size: 100px;
                text-align: right;
                filter: alpha(opacity=0);
                opacity: 0;
                outline: none;
                background: white;
                cursor: inherit;
                display: block;
            }

            .panel {
                background-color: #d9d1d1 ;
                margin-top: 50px;
                box-shadow: 0 0 30px  #b6a6a6;    
                padding:0 15px 0 15px;
            }
            .panel-horizontal {
                background-color: #d9d1d1;
                border: 1px solid #ddd;
                border-radius: 4px;
            }
            .panel-horizontal > .panel-body {
                background-color: #d9d1d1;
                border-radius: 0 4px 4px 0;
                border-left: 1px solid #ddd;
            }

            .longLabel{
                display: inline-table;
                line-height: initial;
            }

            .form-input {
                height: 50px;
                font-size: 16px;    
            }

            .form-btn {
                line-height: 50px;
                font-size: 16px;
            }
            .icon-input-btn{
                display: inline-block;
                position: relative;
            }
            .icon-input-btn input[type="submit"]{
                padding-left: 2em;
            }
            .icon-input-btn .glyphicon{
                display: inline-block;
                position: absolute;
                left: 0.65em;
                top: 30%;
            }
            .dataTables_filter {
                display: none;
            } 

            select.input-sm {
                height: 33px;
            }
        </style>

        <!-- the following functions will copy
 the selected file name (for upload) to the label input-->
        <script>
            $(function () {
                $('div.expertReaderReport').on('change', ':file', function () {
                    var input = $(this),
                            numFiles = input.get(0).files ? input.get(0).files.length : 1,
                            label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
                    input.trigger('fileselect', [numFiles, label]);
                    //                  var label_translatorid2 = "label_translator" + id2;
                    document.getElementById("label_expertReaderReport").value = label;
                });
            });
            $(function () {
                $(document).on('change', 'div.translatorcv :file', function () {
                    var id = parseInt(this.id.replace("translator_cv", ""));
                    var input = $(this),
                            numFiles = input.get(0).files ? input.get(0).files.length : 1,
                            label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
                    input.trigger('fileselect', [numFiles, label]);
                    var label_translatorid = "label_translator" + id;
                    document.getElementById(label_translatorid).value = label;
                });
            });
        </script>



        <script type="text/javascript">
            var cntr = 0;
            $(document).ready(function () {
                var userID = ${userID};
                var newURL = "./ExpertReadingListDataServlet?userID=" + userID;

                var table = $("#readingList").DataTable({

                    "bProcessing": true,
                    "bServerSide": true,
                    "sAjaxSource": newURL,
                    "columns": [
                        {
                            "targets": 0,
                            "class": "details-control",
                            "orderable": false,
                            "data": null,
                            "defaultContent": ""
                        },
                        {"data": "referenceNumber",
                            "render": function (data) {
                                console.log("referenceNumber  " + data);
                                return data;
                            }},
                        {"data": "sampleSentOut",
                            "render": function (data) {
                                console.log("sampleSentOut  " + data);
                                return data;
                            }},
                        {"data": "authorName",
                            "render": function (data) {
                                console.log("Author  " + data);
                                return data;
                            }},
                        {"data": "bookTitle",
                            "render": function (data) {
                                console.log("Title  " + data);
                                return data;
                            }}

                    ]

                });


                //https://stackoverflow.com/questions/20293680/how-to-empty-div-before-append                    
//                $('#readerListModal').empty(); // empty the div before fetching and adding new data

                $('#readingList tbody').on('click', 'tr td.details-control', function (e) {
                    e.preventDefault();

                    var tr = $(this).closest('tr');
                    var row = table.row(tr);
                    var rowdata = table.row(tr).data();

                    console.log("referenceNumber  " + rowdata.referenceNumber);
                    document.getElementById("referenceNumber").value = rowdata.referenceNumber;
                    var fullName = "${name}";
                    document.getElementById("expertReaderName").value = fullName;
                    $("#readerListModal").modal("show");

                });
            });
        </script>

    </head>

    <body style="height: 100%">
        <div class="alert alert-danger" role="alert" id="errorField" style="display:none">
            <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
            <span class="sr-only">Error:</span>
            <span class="message"></span>
        </div>
        <div class="alert alert-success" role="alert" id="successField" style="display:none">
            <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
            <span class="sr-only">Success:</span>
            <span class="message"></span>
        </div>
        <div id="shadowholder">

            <div class="shadowtop"> </div>

            <div id="container">

                <div id="topspacer"> </div>

                <div id="topbar">

                    <div class="animateddiv">
                        <a><img src="images/flashtext-animated2.gif" height="80" alt="Promoting Irish Literature Abroad" /></a>
                    </div>
                    <a class="logo"><span class="hidden">Literature Ireland</span></a>

                </div> <!--  End of topbar div -->

                <!--container for welcome/logout-->
                <div class="container-fluid" style="margin-bottom: 20px; width: 100%">
                    <div class="pull-right">
                        <h6> <small>Welcome <strong>${name}</strong> - <strong>not ${name}</strong>? <a href="${pageContext.request.contextPath}/Logout">Click here to log out </a></small></h6>
                    </div>
                </div> <!--container for welcome/logout-->

                <h1 align="center"  style="margin-top: 20px; margin-bottom: 10px" >Expert Reader Report Submit Page</h1>

                <div class="container-fluid" style="margin-bottom: 20px; width: 100%">

                    <!--                    <div class="container-fluid" style="margin-top: 40px; margin-bottom: 60px">-->

                    <div class="table-responsive">
                        <table id="readingList" class="table display table-striped table-bordered  dt-responsive " width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th class="details-control"></th>   
                                    <th class="all">Reference<br/>  No</th>
                                    <th class="all">Date sample<br/> sent out</th>       
                                    <th class="all">Author</th>                                    
                                    <th class="all">Title</th>                            
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th class="details-control"></th>   
                                    <th class="all">Reference<br/>  No</th>
                                    <th class="all">Date sample<br/> sent out</th>       
                                    <th class="all">Author</th>                                    
                                    <th class="all">Title</th>            
                                </tr>
                            </tfoot>
                            <tbody>
                                <!-- Main Grid -->  
                            </tbody>
                        </table>
                    </div>                   
                </div> <!-- container-fluid -->  


                <div class="modal autoModal readerList" id="readerListModal"  tabindex="-1" role="dialog" aria-labelledby="readerListModal"  style="background-color: #c3bcbc" data-modal-index="1">
                    <div class="modal-dialog readerList" style="align-content: center">
                        <div class="modal-content readerList" style="background-color: #d9d1d1;">

                            <div class="modal-header" style="background-color: #c3bcbc">
                                <button type="button" class="close" data-dismiss="modal"    aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="readerListModalLabel">Expert Reader Report Submit Page</h4>
                            </div>

                            <form  method="POST" id="applicationForm" name="applicationForm" action="${pageContext.request.contextPath}/ExpertReaderServlet" enctype="multipart/form-data">


                                <input type="hidden" value="" name="expertReaderName" id="expertReaderName" /> 
                                <div class="modal-body readerList" style="background-color: #d9d1d1">

                                    <div class="panel panel-default">
                                        <div class="panel-body">

                                            <!--  Reference Number  -->
                                            <div class="row" style="margin-top: 40px;margin-left: 10px"> 
                                                <div class="col-md-8">
                                                    Reference Number:
                                                    <br/>
                                                    <input type="text" value="Reference Number" name="referenceNumber" id="referenceNumber" readonly /> 
                                                </div>
                                                <div class="col-md-3">        
                                                    Submission Date:
                                                    <input type="text" class="form-control" id="date" value="" name="date" readonly> 
                                                </div>
                                            </div> <!-- row -->

                                            <!--  Upload your report  -->
                                            <div class="row" style="margin-top: 60px;margin-left: 10px">                                      
                                                <!--<div class="row">-->
                                                <div class="col-xs-10 col-md-6">
                                                    <div class="form-group">
                                                        <label>
                                                            Upload your report
                                                            <span id="clearExpertReaderReport" class="btn btn-default btn-xs">
                                                                Clear the file name
                                                            </span>
                                                        </label>
                                                        <input type="file"  name="expertReaderReport" id="expertReaderReport" class="form-input">
                                                        <!--Destination:-->
                                                        <input type="hidden" id="expertReaderReport_upload" value="expertReaderReport_upload" name="destination" />                                          
                                                    </div> 
                                                    <script>
                                                        $('#expertReaderReport').filestyle({
                                                            text: 'Select file ',
                                                            buttonName: 'btn-info',
                                                            btnClass: "btn-primary",
                                                            htmlIcon: '<span class="glyphicon glyphicon-folder-open"> &nbsp</span>',
                                                            buttonBefore: 'true',
                                                            placeholder: "No file selected"
                                                        });
                                                        $('#clearExpertReaderReport').click(function () {
                                                            $('#expertReaderReport').filestyle('clear');
                                                        });
                                                    </script>
                                                </div> 
                                            </div> <!-- row -->

                                            <!--  Upload your invoice  -->
                                            <div class="row" style="margin-top: 20px;margin-left: 10px">
                                                <div class="col-xs-10 col-md-6">
                                                    <div class="form-group">
                                                        <label>
                                                            Upload your invoice
                                                            <span id="clearExpertReaderInvoice" class="btn btn-default btn-xs">
                                                                Clear the file name
                                                            </span>
                                                        </label>
                                                        <input type="file"  name="expertReaderInvoice" id="expertReaderInvoice" class="form-input">
                                                        <!--Destination:-->
                                                        <input type="hidden" id="expertReaderInvoice_upload" value="expertReaderInvoice_upload" name="destination" />                                          
                                                    </div>
                                                    <script>
                                                        $('#expertReaderInvoice').filestyle({
                                                            text: ' Select file ',
                                                            buttonName: 'btn-info',
                                                            btnClass: "btn-primary",
                                                            htmlIcon: '<span class="glyphicon glyphicon-folder-open"> &nbsp</span>',
                                                            buttonBefore: 'true',
                                                            placeholder: "No file selected"
                                                        });
                                                        $('#clearExpertReaderInvoice').click(function () {
                                                            $('#expertReaderInvoice').filestyle('clear');
                                                        });
                                                    </script>
                                                </div> 
                                            </div> <!-- row -->

                                            <!--  Summary of report  -->
                                            <div class="row">  
                                                <div class="col-md-12" style="margin-top: 50px;margin-left: 10px">
                                                    <div class="form-group">
                                                        <textarea class="form-control" placeholder="Summary of report" id="reportSummary" name="reportSummary" style="width: 580px; height: 430px;"></textarea>
                                                    </div>
                                                </div>

                                                <div class="col-md-6"></div>
                                            </div>

                                            <!--  Submit form  -->
                                            <div class="col-md-9"  style="margin-top: 20px;margin-bottom: 30px" >
                                                <div class="input-group input-group-lg">
                                                    <button type="submit"                                                                                                                                          
                                                            class="btn btn-success"
                                                            title="Click to submit the documents"
                                                            style="margin-bottom: 10px"
                                                            >
                                                        Submit
                                                        <span class="glyphicon glyphicon-import"></span>
                                                    </button>
                                                </div><!-- input-group -->
                                            </div>  <!-- col-md-9 -->
                                            <script>
                                                n = new Date();
                                                y = n.getFullYear();
                                                m = n.getMonth() + 1;
                                                d = n.getDate();
                                                $("#date").attr("value", d + "/" + m + "/" + y);
                                            </script>

                                        </div> <!--panel-body-->      
                                    </div>  <!--panel--> 

                                </div>
                            </form> 
                            <!--modal-footer--> 
                            <div class="modal-footer readerListModal"  style="background-color: #c3bcbc">                                
                                <!--<button type="button" class="btn btn-default" data-dismiss="modal" onclick="backToTranslators();">Done</button>-->          
                            </div> <!--modal footer -->

                        </div> <!--modal content-->          
                    </div> <!--modal dialog-->
                </div> <!--modal fade-->





                <!--Script to call Logout.java-->
                <script type="text/javascript">
                    $('a#logout').click(function () {
                        $.post('/Logout');
                        window.location.href = "../login.jsp";
                    });
                </script>

                <!--footer start-->

                <div id="base">  

                        <div class="basetext">  
                            <h2>Literature Ireland</h2>
                            <a data-toggle="tooltip" data-placement="top" title="Contact Details" >
                                <i  onclick="contactUsModal();">Contact Details</i>
                            </a> &nbsp;|&nbsp; 
                            <a data-toggle="tooltip" data-placement="top" title="Legal Note" >
                                <i  onclick="showLegalNoteModal();">Legal Note</i></a>

                        </div><!-- end of BaseText div -->  

                    <div class="baselogo-1 hidden-phone"><a href="http://www.cultureireland.gov.ie" target="_blank"><span class="hidden">Culture Ireland</span></a></div>
                    <div class="baselogo-2 hidden-phone"><a href="http://www.artscouncil.ie" target="_blank"><span class="hidden">The Arts Council</span></a></div>
                    <!--<div class="baselogo-4 hidden-phone"><a href="http://www.ahg.gov.ie/en/" target="_blank"><span class="hidden">Dept of Tourism</span></a></div>-->

                    <div class="mobile-baselogos visible-phone"> 
                        <a href="http://www.cultureireland.gov.ie" target="_blank"><span class="hidden">Culture Ireland</span></a>
                        <a href="http://www.artscouncil.ie" target="_blank"><span class="hidden">The Arts Council</span></a>
<!--                        <a href="http://www.ahg.gov.ie/en/" target="_blank"><span class="hidden">Dept of Tourism</span></a>-->
                    </div>

                </div><!-- end of Base div -->

            </div><!-- end of container div -->
            <div class="shadowbase"> </div>
        </div><!-- end of Shadowholder container div -->


        <div id="credit"> <a><img src="images/paw.gif" alt="The Cat" height="30" /></a>
            &copy; 2017-2019 mgr Software
        </div>
 <!--contactUsModal-->
        <div class="modal fade" id="contactUsModal" tabindex="-1" role="dialog" aria-labelledby="contactUsModalLabel"  data-modal-index="3">

            <div class="modal-admin" role="document">

                <div class="modal-content">

                    <div class="modal-header"  style="background-color: #d9d1d1;">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h1 class="modal-title" id="contactUsModalLabel"   style="background-color: #d9d1d1;">Contact Us</h1>
                    </div>

                    <div class="modal-body" style="background-color: #d9d1d1">

                        <div class="container-fluid">         
                            <div id="contentarea">
                                <div class="textpadding">
                                    <div class="typography">
                                        <p><strong>Director</strong>   Sinéad Mac Aodha</p>
                                        <p>sinead@literatureireland.com </p>
                                        <p> </p>
                                        <p><strong>Deputy Director   </strong>Rita McCann </p>
                                        <p>rita@literatureireland.com</p>
                                        <p> </p>
                                        <p><strong>Administrator</strong>   Andrew Deering</p>
                                        <p>andrew@literatureireland.com</p>
                                        <p> </p>
                                        <p><strong style="white-space: pre;"><br/></strong></p>
                                        <p><strong><span style="text-decoration: underline;">PLEASE NOTE OUR NEW ADDRESS: </span></strong></p>
                                        <p>Literature Ireland</p>
                                        <p>Trinity Centre for Literary and Cultural Translation</p>
                                        <p>36 Fenian Street</p>
                                        <p>Trinity College Dublin</p>
                                        <p>Dublin D02 CH22</p>
                                        <p>Ireland</p>
                                        <p><strong>Telephone: +353 (0)1 896 4184</strong></p>
                                        <p><span style="white-space: pre;"><strong>Email: info@literatureireland.com</strong></span></p>
                                        <p> </p>
                                        <p> </p>
                                        <p> </p>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div><!-- modal body -->

                    <div class="modal-footer"  style="background-color: #c3bcbc;">                                            
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div><!-- modal-footer -->

                </div><!-- modal-content -->
            </div><!-- modal-dialog -->
        </div><!-- modal -->

        <!--showLegalNoteModal-->
        <div class="modal fade" id="showLegalNoteModal" tabindex="-1" role="dialog" aria-labelledby="showLegalNoteModallLabel"  data-modal-index="3">

            <div class="modal-admin" role="document">

                <div class="modal-content">

                    <div class="modal-header"   style="background-color: #d9d1d1;">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h1 class="modal-title" id="showLegalNoteModallLabel" style="background-color: #d9d1d1;">Legal Note</h1>
                    </div>

                    <div class="modal-body" style="background-color: #d9d1d1">

                        <div class="container-fluid">
                            <div id="contentarea">
                                <div class="textpadding">
                                    <div class="typography">
                                        <h4>Company Registration</h4>
                                        <p>Literature Ireland is registered in Dublin, Ireland, at the following address: </p>
                                        <p>Trinity Centre for Literary Translation, 36 Fenian Street, Trinity College Dublin, Dublin 2.</p>
                                        <p>Registered company number: 212420</p>
                                        <p> </p>
                                        <h4><span style="color: #3b3b3b;">Disclaimer</span></h4>
                                        <p>Literature Ireland offers the material on this website, in good faith, for the information of visitors to the site, but disclaims any responsibility for error, omission or inaccuracy, and for the consequences of pursuing any link from these pages to another site.</p>
                                        <p> </p>
                                        <h4>Copyright</h4>
                                        <p>The copyright in all material on this website is owned by Literature Ireland, or is reproduced with the permission (if required) of the copyright owner. The material may be retrieved and downloaded for personal use, but may not otherwise be reproduced or made available in any manner or form, and may not be modified or altered in any way, without the permission of Literature Ireland.</p>
                                        <p> </p>
                                        <h4>Privacy</h4>
                                        <p>All documentation submitted to Literature Ireland will be treated with the utmost discretion. If you have any concerns in relation to privacy, please contact Literature Ireland at info@literatureireland.com.</p>
                                    </div><!-- end of typography div -->
                                </div><!-- end of text padding div -->
                            </div><!-- end of contentarea div -->
                        </div>
                    </div><!-- modal body -->
                    <div class="modal-footer"  style="background-color: #c3bcbc;">                                            
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div><!-- modal-footer -->

                </div><!-- modal-content -->
            </div><!-- modal-dialog -->
        </div><!-- modal -->


        <script>
            function  contactUsModal() {
                $("#contactUsModal").modal("show");
            }
            function  showLegalNoteModal() {
                $("#showLegalNoteModal").modal("show");
            }
        </script>
    </body>
</html>
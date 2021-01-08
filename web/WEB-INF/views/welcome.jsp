<%-- 
    Document   : tabTesting
    Created on : 19-Mar-2017, 11:27:58
    Author     : markus
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html style="height: 100%" >
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Translation Grant Application System</title>

        <!-- Bootstrap -->


        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/layout.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" type="text/css" href="css/datepicker.css" />
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/jquery-ui.css">

        <!--<script src="js/jquery-3.2.0.js"></script>-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>
        <script src="js/bootstrap-datepicker.js"></script>
        <script src="js/jquery-ui.js"></script>


        <!--calculate fees-->
        <script>
            function getNumberPages()
            {
                //Assume form with id="theform"
                var theForm = document.forms["feeCalculationForm"];
                //Get a reference to the TextBox
                var numberPages = theForm.elements["numberPages"];
                var noPages = 0;
                //If the textbox is not blank
                if (numberPages.value !== "")
                {
                    noPages = parseFloat(numberPages.value);
                }
                return noPages;
            }

            function getFeePerPage()
            {
                //Assume form with id="theform"
                var theForm = document.forms["feeCalculationForm"];
                //Get a reference to the TextBox
                var feePerPage = theForm.elements["feePerPage"];
                var amountPage = 10;
                //If the textbox is not blank
                if (feePerPage.value !== "")
                {
                    amountPage = parseFloat(feePerPage.value);
                }
                return amountPage;
            }

            function getTotal()
            {
                var feeTotal = getNumberPages() * getFeePerPage();
                document.getElementById("fee").value = feeTotal.toFixed(2).replace(/./g, function (c, i, a) {
                    return i && c !== "." && ((a.length - i) % 3 === 0) ? ',' + c : c;
                });
            }
        </script>

        <!--nav tabs-->
        <style>
            body {
                margin: 5px;
                background-color: #d9d1d1;
            }

            /* Tab Navigation */
            .nav-tabs {
                margin: 0;
                padding: 0;
                border: 0;    
            }
            .nav-tabs > li > a {
                background: #DADADA;
                border-radius: 0;
                box-shadow: inset 0 -8px 7px -9px rgba(0,0,0,.4),-2px -2px 5px -2px rgba(0,0,0,.4);
            }
            .nav-tabs > li.active > a,
            .nav-tabs > li.active > a:hover {
                background: #F5F5F5;
                box-shadow: inset 0 0 0 0 rgba(0,0,0,.4),-2px -3px 5px -2px rgba(0,0,0,.4);
            }
            a, u {
                text-decoration: none;
            }
            /* Tab Content */
            .tab-pane {
                background: #F5F5F5;
                box-shadow: 0 0 4px rgba(0,0,0,.4);
                border-radius: 0;
                text-align: center;
                padding: 10px;
            }
        </style>

        <!-- Load mobile menu -->
        <!--<script type="text/javascript" src="js/jquery.mobile-menu.js"></script>-->

        <!--phonenav-->
        <!--        <script type="text/javascript">
                    $(function () {
                        $("body").mobile_menu({
                            menu: "#phonenav"
                        });
                    });
                </script>-->

        <!--icon exclamation-->
        <style>
            .icon-exclamation {
                color: #ff0000;

                ul {
                    margin: 0;
                }
                ul.dashed {
                    list-style-type: none;
                }
                ul.dashed > li {
                    text-indent: -5px;
                }
                ul.dashed > li:before {
                    content: "-";
                    text-indent: -5px;
                }
            }
        </style>

        <!--Checkboxes with tick mark-->
        <style>
            .checkbox label:after, 
            .radio label:after {
                content: '';
                display: table;
                clear: both;
            }

            .checkbox .cr,
            .radio .cr {
                position: relative;
                display: inline-block;
                border: 1px solid #a9a9a9;
                border-radius: .25em;
                width: 1.3em;
                height: 1.3em;
                float: left;
                margin-right: .5em;
            }

            .radio .cr {
                border-radius: 50%;
            }

            .checkbox .cr .cr-icon,
            .radio .cr .cr-icon {
                position: absolute;
                font-size: .8em;
                line-height: 0;
                top: 50%;
                left: 20%;
            }

            .radio .cr .cr-icon {
                margin-left: 0.04em;
            }

            .checkbox label input[type="checkbox"],
            .radio label input[type="radio"] {
                display: none;
            }

            .checkbox label input[type="checkbox"] + .cr > .cr-icon,
            .radio label input[type="radio"] + .cr > .cr-icon {
                transform: scale(3) rotateZ(-20deg);
                opacity: 0;
                transition: all .3s ease-in;
            }

            .checkbox label input[type="checkbox"]:checked + .cr > .cr-icon,
            .radio label input[type="radio"]:checked + .cr > .cr-icon {
                transform: scale(1) rotateZ(0deg);
                opacity: 1;
            }

            .checkbox label input[type="checkbox"]:disabled + .cr,
            .radio label input[type="radio"]:disabled + .cr {
                opacity: .5;
            }

        </style>

        <!--nav tabs--> 
        <script type="text/javascript">
            $(function () {
                $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {
                    var tab = $(e.target.attributes.href.value);
                    $(tab).load(tab.data('url'));
                });

                $('.nav-tabs a:first').each(function () {
                    $(this.attributes.href.value).load($(this.attributes.href.value).data('url'));
                });
            });
        </script> 

        <!--autocomplete-->
        <script>
            $(function () {

                $('#tags').keypress(function () {
                    $.ajax({
                        url: "Auto",
                        type: "POST",
                        data: '',
                        success: function (data) {
                            $("#tags").autocomplete({
                                source: data
                            });
                        }, error: function (data, status, er) {
                            console.log(data + "_" + status + "_" + er);
                        }

                    });

                });

            });
        </script>
    </head>

    <body style="height: 100%">
        <div id="shadowholder">
            <div class="shadowtop"> </div>
            <div id="container">
                <div id="topspacer"> </div>
                <div id="topbar">
                    <div class="animateddiv">
                        <a><img src="images/flashtext-animated2.gif" height="80" alt="Promoting Irish Literature Abroad" /></a>
                    </div>
                    <a class="logo"><span class="hidden">Literature Ireland</span></a>
                    <div class="pull-right">
                        <h6> <small>Welcome ${name} - not ${name}? <a href="${pageContext.request.contextPath}/Logout">Click here to log out </a></small></h6>
                    </div>
                </div> <!--  End of topbar div -->

                <h1>Welcome.jsp</h1>

                <div class="container" style="margin-bottom: 60px; width: 100%">

                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="active">
                            <a href="#home" role="tab" data-toggle="tab">
                                <i class="fa fa-home"></i> Home
                            </a>
                        </li>
                        <li><a href="#profile" role="tab" data-toggle="tab">
                                <i class="fa fa-user"></i> Profile
                            </a>
                        </li>
                        <li>
                            <a href="#messages" role="tab" data-toggle="tab">
                                <i class="fa fa-envelope"></i> Messages
                            </a>
                        </li>
                        <li>
                            <a href="#settings" role="tab" data-toggle="tab">
                                <i class="fa fa-cog"></i> Settings
                            </a>
                        </li>
                    </ul>

                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div class="tab-pane fade active in" id="home">
                            <h2>Home Content Goes Here</h2>
                            <!--<img src="http://lorempixel.com/400/400/cats/1" alt="Cats"/>-->
                        </div>
                        <div class="tab-pane fade" id="profile">
                            <h2>Profile Content Goes Here</h2>




                            <sql:query var="subjects" dataSource="jdbc/ILGAS">
                                SELECT Company_Number, Company FROM international_publishers
                                ORDER BY LEFT(Company, 3)
                            </sql:query>

                            <select name="subjects" id="subjects1">
                                <c:forEach var="row" items="${subjects.rows}">
                                    <option value=" ${row.Company_Number}">${row.Company}</option>
                                </c:forEach>
                            </select>
                            <c:set var="empId" value="${results}"/>
                            <br/>results <div id="results"></div>
                            <br/>

                            <script>
                                $("#subjects1").on("change", function () {
                                    var selected = $(this).val();
                                    $("#results").html("You selected: " + selected);
                                });

                            </script>


                            <!--<form method="POST">-->


                            <div class="ui-widget">
                                <label for="tags">Tags: </label>
                                <input  id="tags" name="tags" onblur="myonblurFunction()">
                            </div>


                            <!--</form>-->

                            <!--takes value from <div id="results"></div> and puts it 
                                into referenceNumber-->
                            <script>
                                function myonblurFunction() {
                                    var tags = document.getElementById('tags');
                                    var publisher = tags.value;
                                    document.getElementById('referenceNumber').value = tags.value;
                                }
                                ;
                            </script>

                            <sql:query var="company" dataSource="jdbc/ILGAS">
                                SELECT Company_Number, Company FROM international_publishers
                                WHERE Company_Number = ?
                                <sql:param value="${empId}" />
                            </sql:query>
                            <div class="ui-widget">
                                <label for="company">company </label>
                                <input  id="company" name="company">
                            </div>

                            <br/>
                            <label>
                                Enter name: 
                                <input id="name" />
                            </label>
                            <br />
                            <label>
                                Enter age: 
                                <input id="age" />
                            </label>
                            <br />
                            <label>
                                Enter location: 
                                <input id="location" />
                            </label>

                            <br />
                            <button id="test" onclick="myFunction()">Test</button>
                            <br/>     <input id="referenceNumber" />


                            <script>
                                function myFunction() {
                                    var button = document.getElementById('test');
                                    var d = new Date();
                                    var n = d.getFullYear();
                                    var name = document.getElementById('name');
                                    var age = document.getElementById('age');
                                    var location = document.getElementById('location');
                                    var str = 'Hello ' + name.value +
                                            ', you are ' + age.value +
                                            ' years old and from ' + location.value;
                                    alert(str);
                                    document.getElementById('referenceNumber').value = '-' + n;
                                }
                                ;
                            </script>



                        </div>
                        <div class="tab-pane fade" id="messages">
                            <h2>Messages Content Goes Here</h2>
                            <!--<img src="http://lorempixel.com/400/400/cats/3" alt="Cats"/>-->
                        </div>
                        <div class="tab-pane fade" id="settings">
                            <h2>Settings Content Goes Here</h2>
                            <!--<img src="http://lorempixel.com/400/400/cats/4" alt="Cats"/>-->
                        </div>
                    </div>
                </div> <!--container-->
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
        </div><!-- end of Shadow container div -->


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

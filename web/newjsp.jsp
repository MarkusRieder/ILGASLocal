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
            var rules_basic = {
                condition: 'AND',
                rules: [{
                        id: 'price',
                        operator: 'less',
                        value: 10.25
                    }, {
                        condition: 'OR',
                        rules: [{
                                id: 'category',
                                operator: 'equal',
                                value: 2
                            }, {
                                id: 'category',
                                operator: 'equal',
                                value: 1
                            }]
                    }]
            };

            $('#builder').queryBuilder({
                plugins: ['bt-tooltip-errors'],

                filters: [{
                        id: 'name',
                        label: 'Name',
                        type: 'string'
                    }, {
                        id: 'category',
                        label: 'Category',
                        type: 'integer',
                        input: 'select',
                        values: {
                            1: 'Books',
                            2: 'Movies',
                            3: 'Music',
                            4: 'Tools',
                            5: 'Goodies',
                            6: 'Clothes'
                        },
                        operators: ['equal', 'not_equal', 'in', 'not_in', 'is_null', 'is_not_null']
                    }, {
                        id: 'in_stock',
                        label: 'In stock',
                        type: 'integer',
                        input: 'radio',
                        values: {
                            1: 'Yes',
                            0: 'No'
                        },
                        operators: ['equal']
                    }, {
                        id: 'price',
                        label: 'Price',
                        type: 'double',
                        validation: {
                            min: 0,
                            step: 0.01
                        }
                    }, {
                        id: 'id',
                        label: 'Identifier',
                        type: 'string',
                        placeholder: '____-____-____',
                        operators: ['equal', 'not_equal'],
                        validation: {
                            format: /^.{4}-.{4}-.{4}$/
                        }
                    }],
                rules: rules_basic
            });
            /****************************************************************
             Triggers and Changers QueryBuilder
             *****************************************************************/

            $('#btn-get').on('click', function () {
                var result = $('#builder').queryBuilder('getRules');
                if (!$.isEmptyObject(result)) {
                    alert(JSON.stringify(result, null, 2));
                } else {
                    console.log("invalid object :");
                }
                console.log(result);
            });

            $('#btn-reset').on('click', function () {
                $('#builder').queryBuilder('reset');
            });

            $('#btn-set').on('click', function () {
                //$('#builder').queryBuilder('setRules', rules_basic);
                var result = $('#builder').queryBuilder('getRules');
                if (!$.isEmptyObject(result)) {
                    rules_basic = result;
                }
            });

            //When rules changed :
            $('#builder').on('getRules.queryBuilder.filter', function (e) {
                //$log.info(e.value);
            });
        </script>
    </head>
    <body>
        <div class="container">


            <div id="builder"></div>
            <button class="btn btn-success" id="btn-set">Set Rules</button>
            <button class="btn btn-primary" id="btn-get">Get Rules</button>
            <button class="btn btn-warning" id="btn-reset">Reset</button>
            
        </div>
<div id="wdr-component"></div>

<script>
var pivot = new WebDataRocks({
	container: "#wdr-component",
	toolbar: true,
	report: {
		dataSource: {
			filename: "../../PendingApplicationServlet"
		}
	}
});
</script>
    </body>
</html>

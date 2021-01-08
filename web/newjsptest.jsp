<%-- 
    Document   : newjsptest
    Created on : 19-Sep-2020, 12:28:31
    Author     : Markus Rieder
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link rel="icon" href="favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" /> 

        <script type="text/javascript" language="javascript" src="//code.jquery.com/jquery-1.12.4.js"></script>

        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/layout.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/datepicker.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" type="text/css" href="css/jquery.inputfile.css" />
        <link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/css/bootstrapValidator.min.css" />
        <link rel="stylesheet" type="text/css" href="css/newApplication.css">


        <script type="text/javascript"  src="https://cdnjs.cloudflare.com/ajax/libs/jquery-autocomplete/1.0.7/jquery.auto-complete.min.js"></script>
        <script type="text/javascript"  src="js/moment.js"></script>
        <script type="text/javascript"  src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.2.0/js/bootstrap.min.js" ></script>
        <script type="text/javascript"  src="js/bootstrap-datepicker.js"></script>
        <script type="text/javascript"  src="js/jquery-ui.js"></script>
        <script type="text/javascript"  src="js/pdf.js"></script>
        <script type="text/javascript"  src="js/pdf.worker.js"></script>
        <script type="text/javascript"  src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"></script>
        <script type="text/javascript"  src="js/xregexp-all.js"></script> 
        <script type="text/javascript"  src="js/newApplicationFormValidator.js"></script>

        <style>

        </style>
        <script>

            function generatedLabels() {
                $(document).on('change', ':file', function () {
//                    alert($(this));
                    var input = $(this),
                            numFiles = input.get(0).files ? input.get(0).files.length : 1,
                            label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
                    input.trigger('fileselect', [numFiles, label]);
                    var id = input[0].id;
                    var label_id = "label_" + id;
                    console.log("generatedLabels input ", input);
                    console.log("label_id              ", label_id);
                    document.getElementById(label_id).value = label;
                });


                $("#applicationForm").validate($(this));

            }
            $(document).on('change', '.file-upload', function () {
                alert(this.id);
            });
        </script>
    </head>
    <body>
        <form name="applicationForm" id="applicationForm">
            <div id="column1" class="container-fluid">

                <div  class="col-md-8" style="margin-bottom: 40px">
                    <div class="form-group has-feedback"> 
                        <label for="translator_cv1" class="control-label pull-left">Upload a copy of Rosie Hedger's CV:</label> 
                        <small class="pull-left" style="margin-bottom: 10px"> &nbsp; this should include a list of previous published literary translations</small>
                        <div class="input-group translatorcv pull-left has-feedback">
                            <label class="input-group-addon btn btn-default btn-file">
                                Select file 
                                <input type="file" 
                                       onchange="generatedLabels()" 
                                       class="form-input file-upload" 
                                       name="Translator_CV" 
                                       id="translator_cv1">
                                <span class="glyphicon glyphicon-folder-open"></span>
                            </label>
                            <input id="label_translator_cv1" class="pull-left">
                        </div>
                        <input type="hidden" id="translator_cv_upload1" value="Translator_CV" name="destination">
                    </div>
                    <label for="Translator_CV" class="validation_error_message help-block"></label> 
                </div>

                <div class="col-md-8">
                    <div class="form-group has-feedback">
                        <label for="originalSample" class="control-label pull-left required-field">Upload electronic copy of original work</label>
                        <div class="input-group originalSample pull-left">                                                                         
                            <label class="input-group-addon btn btn-default btn-file">
                                Select file 
                                <input type="file"  
                                       name="Original" 
                                       id="originalSample" 
                                       onchange="generatedLabels();"
                                       required
                                       class="form-input file-upload" 
                                       <span class="glyphicon glyphicon-folder-open"></span>
                            </label>
                            <input id="label_originalSample" class="pull-left">   

                        </div>
                        <input type="hidden" id="originalSample_upload" value="originalSample" name="destination" />                           
                    </div>
                    <label for="Original" class="validation_error_message help-block"></label>      
                </div>

                <div class="container wrapperContainer">


                    <div class="col-md-8" style="margin-bottom: 40px">
                        <div class="form-group has-feedback">

                            <label for="translator_cv"  class="control-label pull-left required-field">Upload a copy of ' + translatorArray[i] + '\'s CV:</label>
                            <small class="pull-left" style="margin-bottom: 10px"> &nbsp; &nbsp;   this should include a list of previous published literary translations</small>

                            <div class="input-group translatorcv pull-left">
                                <label class="input-group-addon btn btn-default btn-file">
                                    Select file <input type="file" required  onchange="generatedLabels();" class="form-input Translator_CV file-upload" name="Translator_CV" id="translator_cv">
                                    <span class="glyphicon glyphicon-folder-open"></span>
                                </label> ';
                                <input id="label_translator_cv" class="pull-left" value=""/> 
                            </div>  
                            <input type="hidden" value="Translator_CV" name="destination" id="translator_cv_upload"/>
                        </div>
                        <label for="Translator_CV" class="validation_error_message help-block"></label>
                    </div> 


                    <div class="col-md-8">
                        <div class="form-group has-feedback"> 
                            <label for="label_contract" class="control-label pull-left required-field" >Upload a copy of the contract with ' + translatorArray[i] + '</label>
                            <div class="input-group contract pull-left">
                                <label class="input-group-addon btn btn-default btn-file">
                                    Select file <input type="file" onchange="generatedLabels()" class="form-input Contract file-upload" name="Contract" id="contract" >
                                    <span class="glyphicon glyphicon-folder-open"></span>
                                </label>
                                <input id="label_contract" class="pull-left"/>
                            </div>
                            <input type="hidden" value="Contract" name="destination" id="contract_upload"/>
                        </div>
                        <label for="Contract" class="validation_error_message help-block"></label> 
                    </div>
                </div>

                <div class="container wrapperContainer">
                    <div class="col-md-8" style="margin-bottom: 40px">
                        <div class="form-group has-feedback has-error">
                            <label for="translator_cv1" class="control-label pull-left required-field">
                                Upload a copy of Rosie Hedger's CV:</label> 
                            <small class="pull-left" style="margin-bottom: 10px"> &nbsp; &nbsp;   this should include a list of previous published literary translations</small>
                            <div class="input-group translatorcv pull-left has-feedback">
                                <label class="input-group-addon btn btn-default btn-file"> 
                                    Select file 
                                    <input type="file" required="" onchange="generatedLabels();" class="form-input Translator_CV file-upload" name="Translator_CV1" id="translator_cv1" aria-describedby="translator_cv1-error" aria-invalid="true">
                                    <span class="glyphicon glyphicon-folder-open glyphicon-remove"></span>
                                </label> 
                                <input id="label_translator_cv1" class="pull-left" value="">  
                            </div>  
                            <input type="hidden" value="Translator_CV" name="destination" id="translator_cv_upload1">
                        </div>
                        <label for="Translator_CV1" class="validation_error_message help-block pull-left" style="color: rgb(169, 68, 79); font-weight: normal;">Incorect file name - please use only letters, numbers, '.', '-', '_' and space</label>
                    </div> 

                </div>

            </div> 
        </form>
        <hr/>

        <div class="row">


            <!--display-->
            <div class="pull-left col-sm-offset-1" style="margin-bottom: 20px;margin-top: 30px;">
                <div class="col-md-2">
                    <input id="appProofPaymentToTranslator"
                           type="hidden"                                                             
                           name="appProofPaymentToTranslator"                                
                           >
                </div>

                <label class="pull-left" id="label_proofPaymentToTranslator"></label>

                <a class="btn btn-info" role="button" id="proofPaymentToTranslator">
                    <span class="glyphicon glyphicon-file"></span>
                    Proof of payment <br/> to the translator</a>
            </div>


            <!--upload-->
            <div class="col-md-6 pull-right" style="margin-bottom: 40px;"> 
                <label  class="control-label pull-left">Literature Ireland Staff option</label>
                <label class="control-label pull-left">Upload / Replace Proof of payment  to the translator</label>
                <div  style="margin-bottom: 10px;"><strong class="pull-left"  id="uploadAgreement1"></strong></div> 
                <br/>
                <div class="input-group agreement_buttonText pull-left">
                    <a class="btn btn-success btn-file pull-left" role="button" id="agreement_link1" >
                        <span class="glyphicon glyphicon-file"></span>
                        Upload / Replace</a>
                </div> 
            </div> 





            <div class="pull-left" style="margin-bottom: 20px;margin-top: 30px;">  
                <div class="col-md-2">
                    <input id="appBankDetailsForm"                                
                           type="hidden"                                                            
                           name="appBankDetailsForm"                                
                           >
                </div>

                <label class="pull-left" id="label_bankDetailsForm"></label>

                <a class="btn btn-info" role="button" id="bankDetailsForm" >
                    <span class="glyphicon glyphicon-file"></span>
                    Completed bank <br/> details form</a>
            </div>

            <div class="pull-left" style="margin-bottom: 20px;margin-top: 30px;">  
                <div class="col-md-2">
                    <input id="appSignedLIContract"                                
                           type="hidden"                                                            
                           name="appSignedLIContract"                                
                           >
                </div>

                <label class="pull-left" id="label_signedLIContract"></label>

                <a class="btn btn-info" role="button" id="signedLIContract">
                    <span class="glyphicon glyphicon-file"></span>
                    Signed Literature <br/> Ireland contract</a>
            </div>

        </div> <!--row-->
    </body>
</html>

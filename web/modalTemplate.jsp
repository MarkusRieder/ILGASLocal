<%-- 
    Document   : modalTemplate
    Created on : 01-Jun-2019, 17:18:47
    Author     : Markus Rieder
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!--JQuery-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

        <!-- Bootstrap -->

        <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>    

        <style>
            pre span.line1 {color: red;}
            pre span.line2 {color: orange;}
            pre span.line3 {color: #dc9b18;}
            pre span.line4 {color: blue;}
            pre span.line5 {color: green;}
            pre span.line6 {color: #9718dc;}
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <!-- Trigger the modal with a button -->
            <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>

            <!-- Modal -->
            <div id="myModal" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Modal Header</h4>
                        </div><!-- modal-header -->
                        <div class="modal-body">
                            <p>Some text in the modal.</p>
                        </div><!-- modal-body -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div><!-- modal-footer -->
                    </div><!-- modal-content -->

                </div><!-- modal-dialog -->
            </div><!-- Modal -->
        </div>

        <div class="container-fluid">
            <h3>Example Explained</h3>

            <p><strong>The "Trigger" part:</strong></p>
            <p>To trigger the modal window, you need to use a button or a link.</p>
            <p>Then include the two data-* attributes: </p>
            <ul>
                <li><code class="w3-codespan">data-toggle="modal"</code> opens the modal window</li>
                <li><code class="w3-codespan">data-target="#myModal"</code> points to the id of the modal</li>
            </ul>

            <p><strong>The "Modal" part:</strong></p>

            <pre>  <strong> Modal structure:</strong>

           <span class="line1"> &lt;div id="myModal"&gt;</span>

               <span class="line2"> &lt;div modal-dialog"&gt; </span>

                    <span class="line3">&lt;div class="modal-content"&gt;</span>

                        <span class="line4">&lt;div class="modal-header"&gt;</span>                         
                            &lt;h4 class="modal-title"&gt;Modal Header&lt;/h4&gt;
                        <span class="line4">&lt;/div end modal-header&gt;</span>

                        <span class="line5">&lt;div class="modal-body"&gt;</span>

                        <span class="line5">&lt;/div end modal-body&gt;</span>

                        <span class="line6">&lt;div class="modal-footer"&gt;</span>                
                        <span class="line6">&lt;/div end modal-footer&gt;</span>  

                    <span class="line3">&lt;/div end modal-content&gt;</span>

               <span class="line2"> &lt;/div end modal-dialog&gt;</span>

          <span class="line1">  &lt;/div end Modal&gt;</span>
            </pre>
            <p>The parent <code class="w3-codespan">&lt;div&gt;</code> of the modal must have an ID that is the 
                same as the value of the data-target attribute used to trigger the modal ("myModal").</p>
            <p>The <code class="w3-codespan">.modal</code> class identifies the content of <code class="w3-codespan">&lt;div&gt;</code> as a modal and 
                brings focus to it.</p>
            <p>The <code class="w3-codespan">.fade</code> class adds a transition effect which fades the modal in 
                and out. Remove this class if you do not want this effect.</p>
            <p>The attribute <code class="w3-codespan">role="dialog"</code> improves accessibility for 
                people using screen readers.</p>
            <!-- <p><code class="w3-codespan">aria-labelledby</code> and <code class="w3-codespan">aria-hidden</code> are used for accessibility. </p>-->
            <p>The <code class="w3-codespan">.modal-dialog</code> class sets the proper width and margin of the 
                modal.</p>

            <p><strong>The "Modal content" part:</strong></p>
            <p>The <code class="w3-codespan">&lt;div&gt;</code> with <code class="w3-codespan">class="modal-content</code>" 
                styles the modal (border, background-color, etc.). Inside this <code class="w3-codespan">&lt;div&gt;</code>, 
                add 
                the modal's 
                header, body, and footer.</p>

            <p>The <code class="w3-codespan">.modal-header</code> class is used to define the style for the header of the 
                modal. The <code class="w3-codespan">&lt;button&gt;</code> inside the header has a <code class="w3-codespan">data-dismiss="modal"</code> attribute which 
                closes the modal if you click on it. The <code class="w3-codespan">.close</code> class styles the close button, 
                and the <code class="w3-codespan">.modal-title</code> class styles the header with a proper line-height.</p>
            <p>The <code class="w3-codespan">.modal-body</code> class is used to define the style for the body of 
                the modal. Add any HTML markup here; paragraphs, images, videos, etc.</p>
            <p>The <code class="w3-codespan">.modal-footer</code> class is used to define the style for the 
                footer of the modal. Note that this area is right aligned by default.</p>
            <hr>
            <h2>Modal Size</h2>
            <p>Change the size of the modal by adding the <code class="w3-codespan">.modal-sm</code> 
                class for 
                small modals or&nbsp; <code class="w3-codespan">.modal-lg</code> class for large modals.</p>
            <p>Add the size class to the <code class="w3-codespan">&lt;div&gt;</code> element with class <code class="w3-codespan">.modal-dialog</code>:</p>
        </div>
    </body>
</html>


function replaceEditor() {

    var editor = CKEDITOR.replace('editor1', {
        extraPlugins: 'allowsave',
        filebrowserBrowseUrl: 'product/browseFile.jsp',
        filebrowserWindowWidth: 800,
        filebrowserWindowHeight: 500,

        height: 500
    });
}

function getTemplate(template) {

    $.ajax({
        url: "templateHandler?action=openFile&filename=" + template,
        type: 'GET',
        dataType: 'text'
    }).then(function (data) {
//        var length = data.length - 2;
//        var datacut = data.slice(9, length);
        CKEDITOR.instances.editor1.setData(data);

    });
}

function selectTemplate() {

    $('#selectTemplate').fileTree({root: '/home/markus/uploads/', script: 'connectors/jqueryFileTree.jsp'}, function (file) {
        $('#fileName').val(file);
        getTemplate(file);
    });
}


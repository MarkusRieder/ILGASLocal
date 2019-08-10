function loadcssfile(filename, filetype) {
    if (filetype === "css") {
        var fileref = document.createElement("link");
        fileref.setAttribute("rel", "stylesheet");
        fileref.setAttribute("type", "text/css");
        fileref.setAttribute("href", filename);
    }
    if (typeof fileref !== "undefined")
        document.getElementsByTagName("head")[0].appendChild(fileref);
}

loadcssfile('css/bootstrap.css', 'css');
loadcssfile('https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css', 'css');
loadcssfile('https://cdn.datatables.net/responsive/2.1.1/css/responsive.dataTables.min.css', 'css');
loadcssfile('https://cdn.datatables.net/buttons/1.3.1/css/buttons.dataTables.min.css', 'css');
loadcssfile('https://cdn.datatables.net/plug-ins/1.10.15/integration/font-awesome/dataTables.fontAwesome.css', 'css');


loadcssfile('css/layout.css', 'css');
loadcssfile('css/font-awesome.css', 'css');
loadcssfile('css/bootstrap-theme.min.css', 'css');
loadcssfile('css/datepicker.css', 'css');
loadcssfile('css/jquery-ui.css', 'css');
loadcssfile('https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.1/css/bootstrap-datepicker.css', 'css');

loadcssfile('css/lesshat.css', 'css');
loadcssfile('css/newfile.css', 'css');
//loadcssfile('css/lightbox.min.css', 'css');
//loadcssfile('css/chosen.min.css', 'css');
loadcssfile('css/jquery.dataTables.yadcf.css', 'css');
loadcssfile('css/approvedwithdrawnrejected.css', 'css');
console.log("Stylesheets Loaded :)");
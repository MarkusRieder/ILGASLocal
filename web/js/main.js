requirejs.config({
    appDir: ".",
    baseUrl: "js",
    paths: {
        /* Load jquery from google cdn. On fail, load local file. */
        'jquery': ['//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min', 'js/jquery-min'],
        /* Load bootstrap from cdn. On fail, load local file. */
        'bootstrap': ['//netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min', 'js/bootstrap-min'],
        'moment': ['//cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min', 'js/moment'],
        'dataTables': ['https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min', 'js/datatables.min'],
        'responsive': ['https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min', 'dataTables.responsive.min'],
        'buttons': ['//cdn.datatables.net/buttons/1.3.1/js/dataTables.buttons.min', ''],
        'datetime-moment': ['//cdn.datatables.net/plug-ins/1.10.19/sorting/datetime-moment', ''],
        'jszip': ['//cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min', ''],
        'pdfmake': ['//cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/pdfmake.min', ''],
        'buttons.html5': ['//cdn.datatables.net/buttons/1.3.1/js/buttons.html5.min', ''],
        'datetime': ['//cdn.datatables.net/plug-ins/1.10.15/dataRender/datetime', ''],
        'datepicker': ['//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min', 'js/bootstrap-datepicker'],
        'jquery-ui': ['//code.jquery.com/ui/1.11.4/jquery-ui', 'js/jquery-ui'],
        'yadcf': ['//cdnjs.cloudflare.com/ajax/libs/yadcf/0.9.4/jquery.dataTables.yadcf.min', 'js/jquery.dataTables.yadcf']


    },
    shim: {
        /* Set bootstrap dependencies (just jQuery) */
        'bootstrap': ['jquery'],
        'dataTables': ['jquery'],
        'responsive': ['dataTables'],
        'buttons': ['dataTables'],
        'datetime-moment': ['dataTables'],
        'datetime': ['dataTables']
    },
    map: {
        '*': {
            'datatables.net': 'dataTables',
            'datatables.net-buttons': 'buttons',
            'datatables.net-moment': 'datetime-moment'
        }
    }
});

require(['jquery', 'bootstrap', 'moment', 'dataTables', 'responsive', 'buttons', 'datetime-moment', 'jszip', 'pdfmake', 'buttons.html5', 'datetime', 'datepicker', 'jquery-ui', 'yadcf'], function ($) {
    console.log("Scripts Loaded :)");


    return {};
});




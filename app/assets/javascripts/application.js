// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery3
//= require jquery-ui
//= require jquery_ujs
//= require jquery.mask
//= require chosen-jquery
//= require cocoon
//= require bootstrap-multiselect
//= require bootstrap-sprockets
//= require bootstrap3-typeahead
//= require bootstrap-datepicker/core
//= require bootstrap-datepicker/locales/bootstrap-datepicker.pt-BR
//= require moment
//= require moment/pt-br
//= require bootstrap-datetimepicker
//= require adminLTE/adminlte
//= require datatables
//= require Chart
//= require icheck
//= require daterangepicker
//= require fullcalendar

//= require_tree .

$(document).ready(function () {

    $('.chosen-select').chosen({
        allow_single_deselect: true,
        no_results_text: 'Nenhum resultado encontrado',
        width: '100%'
    });

    $('#datatable').dataTable({
        sPaginationType: "full_numbers",
        bJQueryUI: false,
        bProcessing: true
    });
    jQuery.extend(jQuery.fn.dataTableExt.oSort, {
        "date-br-pre": function (a) {
            if (a == null || a == "") {
                return 0;
            }
            var brDatea = a.split('/');
            return (brDatea[2] + brDatea[1] + brDatea[0]) * 1;
        },

        "date-br-asc": function (a, b) {
            return ((a < b) ? -1 : ((a > b) ? 1 : 0));
        },

        "date-br-desc": function (a, b) {
            return ((a < b) ? 1 : ((a > b) ? -1 : 0));
        }
    });

    $('#datatable-trashes').DataTable({
        sPaginationType: "full_numbers",
        columnDefs: [
            {
                orderable: false,
                className: 'select-checkbox',
                targets: 0
            },
            {
                type: 'date-br',
                targets: 1
            }
        ],
        select: {
            style: 'multi'
        },
        order: [1, 'asc']
    });

    //Date picker
    $('#datepicker').daterangepicker({
            singleDatePicker: true,
            showDropdowns: true
        },
        function (start, end, label) {
            //var years = moment().diff(start, 'years');
            //alert(start.format('DD-MM-YYYY'));
            $('#calendar_date').val(start.format('DD-MM-YYYY'));
        });
    //Date range picker
    $('#reservation').daterangepicker({
            locale: {
                format: 'DD-MM-YYYY'
            }
        },
        function (start, end, label) {
            //alert("A new date range was chosen: " + start.format('DD-MM-YYYY') + ' to ' + end.format('DD-MM-YYYY'));
            $('#calendar_inicio_semestre').val(start.format('DD-MM-YYYY'));
            $('#calendar_fim_semestre').val(end.format('DD-MM-YYYY'));
        });
    $('#save_date').click(function () {
        $('#calendar_date').val($('#datepicker').val());
        //alert($('#datepicker').val());
    });
    $('#save_date').click(function () {
        $('#calendar_inicio_semestre').val($('#reservation').val().split(' - ')[0]);
        $('#calendar_fim_semestre').val($('#reservation').val().split(' - ')[1]);
        //alert($('#reservation').val().split(' - ')[0]);
    });
    var x;
    var total_ids = '';
    $('#datatable-trashes tbody').on('click', 'tr', function () {
        if ($(this).hasClass('selected')) {
            $(this).removeClass('selected');
            x = $(this).find('input[id$=trash_id]').val();
            total_ids = total_ids.replace(x + '-', '');
            //alert(total_ids);
        }
        else {
            $(this).addClass('selected');
            x = $(this).find('input[id$=trash_id]').val();
            total_ids = total_ids.concat(x + '-');
            //alert(total_ids);
        }
    });

    $('#pub_trash_btn').click(function () {
        document.cookie = "ids=" + total_ids;
        alert(document.cookie)
    });

    //iCheck for checkbox and radio inputs
    $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
        checkboxClass: 'icheckbox_minimal-blue',
        radioClass: 'iradio_minimal-blue'
    });

    var date = new Date();
    var d = date.getDate(),
        m = date.getMonth(),
        y = date.getFullYear();
    $('#calendar').fullCalendar({
        ignoreTimezone: true,
        allDaySlot: true,
        allDayText: 'A qualquer hora',
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
        },
        buttonText: {
            today: 'Hoje',
            month: 'Mês',
            week: 'Semana',
            day: 'Dia'
        },eventRender: function(eventObj, elm) {
            elm.attr('style', 'cursor: pointer');
            elm.popover({
                title: "<strong>"+eventObj.title+"</strong>",
                placement: 'top',
                html: true,
                content: function() {
                    $("#popover-container .title").html(eventObj.title);
                    $("#popover-container .when").html(eventObj.quando);
                    $("#popover-container .user_room").html(eventObj.user_room);
                    $("#popover-container .url_swap_trash").attr('href', eventObj.url_swap_trash);
                    return $("#popover-container").html();
                },
                trigger: 'click'
            }).popover('show');
            $('body').on('click', function (e) {
                if (!elm.is(e.target) && elm.has(e.target).length === 0 && $('.popover').has(e.target).length === 0) $(elm).popover('hide');
            });

        },
        events: function(start, end, timezone, callback) {
            $.ajax({
                url: 'tarefas.json',
                dataType: 'json',
                data: {
                    // our hypothetical feed requires UNIX timestamps
                    start: start.unix(),
                    end: end.unix()
                },
                success: function(doc) {
                    var events = [];
                    $(doc).each(function() {
                        events.push({
                            title: $(this).attr('user'),
                            user_room: $(this).attr('user_room'),
                            allDay: true,
                            url_swap_trash: "/notifications/send/"+$(this).attr('id')+'/trash',
                            quando: $(this).attr('when'),
                            start: $(this).attr('when') // will be parsed
                        });
                    });
                    callback(events);
                }
            });
        }
    });

});

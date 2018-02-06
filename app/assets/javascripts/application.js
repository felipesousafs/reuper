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

//= require_tree .

$(document).ready(function() {

    $('.chosen-select').chosen({
        allow_single_deselect: true,
        no_results_text: 'Nenhum resultado encontrado',
        width: '100%'
    });

});
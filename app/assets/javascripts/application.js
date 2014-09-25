// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//=# require bootstrap/scrollspy
//=# require bootstrap/modal
//=# require bootstrap/dropdown
//= require_tree .

$(document).ready(function () {

    window.setTimeout(function() {
        $(".alert").fadeTo(1500, 0).slideUp(500, function(){
            $(this).remove();
        });
    }, 1500);
    $(".toggle_want").click(function() {
        $(this).attr('disabled', 'disabled');
    });

    $('.pagination-button').click(function(){
        document.location.href = this.href;
        event.preventDefault();
    });

    $("#cancel-filter").click(function() {
        document.location.href = window.location.origin;
    });

    $("#apply-filter").click(function() {
        var filter_params = '';
        $('.filter-subject input:checked').each( function()
        {
            if (filter_params.indexOf(this.attributes[1].value) == -1) {
                if (filter_params.length == 0) {
                    filter_params += '/?' + this.attributes[1].value + '=' + this.attributes[2].value;
                } else {
                    filter_params += '&' + this.attributes[1].value + '=' + this.attributes[2].value;
                }
            } else {
                filter_params += ',' + this.attributes[2].value;
            }
        });
        document.location.href = window.location.origin + filter_params;
    });

});

function adjustModalThumbnail() {
    $('#modal-injection li').removeClass('col-lg-3 col-md-4');
    $('#modal-injection li').addClass('col-lg-6 col-md-6');
    var text = $('#modal-injection li .user_modal_link')[0].text;
    $('#modal-injection li .user_modal_link').replaceWith(text);
};
$(document).on('click','.pagination-button',function(){
    document.location.href = this.href;
    event.preventDefault();
});

$(document).on('click',".toggle_want", function () {
    $(this).attr('disabled', 'disabled');
});

$(document).on('click',"#cancel-filter",function() {
    document.location.href = window.location.origin;
});

$(document).on('click',"#apply-filter",function() {
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
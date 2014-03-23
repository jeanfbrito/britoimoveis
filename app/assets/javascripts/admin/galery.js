function deactivate_all() {
    $('#sortable li').unbind('click');
    $( "#sortable" ).sortable({ disabled: true });
}

function select_cover(){
    deactivate_all();
    $('#sortable li').bind("click", function() {
        $('.ribbon-outer').remove();
        $(this).prepend('<div class="ribbon-outer"> <div class="ribbon-inner">Capa</div> </div>');
        return false;
    });
}

function select_delete(){
    deactivate_all();
    $('#sortable li').bind("click", function() {
        $(this).find('.fa-times-circle').toggle();
        return false;
    });
}

function resort_images() {
    deactivate_all();
    $( "#sortable" ).sortable({ 
        tolerance: "pointer",
        disabled: false,
        start: function(event, ui){
            $(ui.item).height($('#sortable li').height());
            $(ui.placeholder).height($('#sortable li').height());           
           }
    });
    $( "#sortable" ).disableSelection();
}

function select_website_images(){
    deactivate_all();
    $('#sortable li').bind("click", function() {
        $(this).find('.fa-globe').toggle();
        return false;
    });
}

function select_mobile_images(){
    deactivate_all();
    $('#sortable li').bind("click", function() {
        $(this).find('.fa-tablet').toggle();
        return false;
    });
}
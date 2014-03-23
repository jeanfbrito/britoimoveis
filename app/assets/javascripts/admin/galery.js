function deactivate_all() {
    $('#pictures li').unbind('click');
    $( "#pictures" ).sortable({ disabled: true });
}

function select_cover(){
    deactivate_all();
    $('#pictures li').bind("click", function() {
        $('.ribbon-outer').remove();
        $(this).prepend('<div class="ribbon-outer"> <div class="ribbon-inner">Capa</div> </div>');
        return false;
    });
}

function select_delete(){
    deactivate_all();
    $('#pictures li').bind("click", function() {
        $(this).find('.fa-times-circle').toggle();
        return false;
    });
}

function resort_images() {
    deactivate_all();
    $( "#pictures" ).sortable({ 
        tolerance: "pointer",
        disabled: false,
        update: function() {
          return $.post($(this).data('update-url'), $(this).sortable('serialize'));
        },
        start: function(event, ui){
            $(ui.item).height($('#pictures li').height());
            $(ui.placeholder).height($('#pictures li').height());           
           }
    });
    $( "#pictures" ).disableSelection();
}

function select_website_images(){
    deactivate_all();
    $('#pictures li').bind("click", function() {
        $(this).find('.fa-globe').toggle();
        return false;
    });
}

function select_mobile_images(){
    deactivate_all();
    $('#pictures li').bind("click", function() {
        $(this).find('.fa-tablet').toggle();
        return false;
    });
}
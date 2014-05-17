$(document).ready(function(){
  $( "#highlighted_properties" ).sortable({ 
        tolerance: "pointer",
        disabled: false,
        handle: '.handle',
        update: function() {
          return $.post($(this).data('update-url'), $(this).sortable('serialize'));
        },
        start: function(event, ui){
            $(ui.item).height($('#highlighted_properties li').height());
            $(ui.placeholder).height($('#highlighted_properties li').height());           
           }
    });
});
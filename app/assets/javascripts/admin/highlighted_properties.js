$(document).ready(function(){
  $( "#highlighted_properties" ).sortable({ 
        tolerance: "pointer",
        disabled: false,
        //handle: '.handle',
        cursor: 'move',
        update: function() {
          return $.post($(this).data('update-url'), $(this).sortable('serialize'));
        },
        start: function(event, ui){
            $(ui.item).height($('#highlighted_properties li').height());
            $(ui.placeholder).height($('#highlighted_properties li').height());           
           }
    });
    $('#highlighted_properties li a').on('ajax:success', function(event){
        $(this).closest('li').remove();
    })
  // $('.thumbnail').hover(function(){
  //   var del = $(this).find('.delete');
  //   console.log(del);
  //   del.show();
  //       },function(){
  //           $(this).find('.delete').animate({opacity:0},100)
  //       });
});
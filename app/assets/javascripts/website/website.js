$(document).ready(function(){
  $('#search_city_id').change(function() {
  var subcategory_url = "/cities/" + $(this).val() + "/districts.json";
  var subcategory_select = $('#search_district_id');
  console.log(subcategory_url);
  console.log(subcategory_select);

  $.ajax({
    url: subcategory_url,
    success: function(data) {
      console.log(data);
      var options = '';
      for (var i = 0; i < data.length; i++) {
        options += '<option value="' + data[i].id + '">' + data[i].name + '</option>';
      }     
      subcategory_select.html("<option selected=selected>Escolha o Bairro</option>" + options);
      console.log(options);
    }
  });
});
});
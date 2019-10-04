// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function(e){
  $('#add_me').click(function(e){
    e.preventDefault();
  });

  $('a[data-method="delete"]').click(function(e){
    e.preventDefault();
    var self = $(this);
    $('#confirm-delete').modal({keyboard:true,focus:true});
    //$('#confirm-delete-form').attr('action',self.attr('href'));
    $('#confirm-delete-button').click(function(e){
      $.ajax({
        url: self.attr('href') + '.json',
        type: 'DELETE',
        dataType: "JSON",
        success: function(result) {
          console.log("success");
          console.log(result);
          location.href = location.href;
        }, error: function(result, error, exception) {
          console.log(error);
          console.log(exception);
        }
      });
      e.preventDefault();
    })
  });
});

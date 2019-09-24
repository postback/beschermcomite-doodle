// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

document.observe("dom:loaded", function() {
  $('add_me').observe('click', function(event) {
    Event.stop(event);
    $('wrapper').setStyle({display: 'block'});
  });

  $('cancel').observe('click', function(event) {
      Event.stop(event);
    $('wrapper').setStyle({display: 'none'});
  });
});
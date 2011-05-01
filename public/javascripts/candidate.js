$(function() {
  var $form = $("#new_note");
  $form.simple_ajax_form({
    success: function(response) {
      $form.before(response);
      $form.find('textarea').val('');
    }
  });
});

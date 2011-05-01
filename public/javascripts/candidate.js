$(function() {
  $('form.edit_candidate').submit(function(e) {
    $.ajax({
      url: this.action,
      type: 'POST',
      data: $(this).serialize(),
      // success: function(response) { console.dir(response); }
      // console.dir output is better than console.log
      // make sure you don't leave a console.log or .dir in your code or it
      // will break certain browsers including selenium
      success: function(response) { $('form.edit_candidate').prepend($(response).find('article:last')); }
    });
    $('input[type=text], textarea').val('');
    return false;
  });
});

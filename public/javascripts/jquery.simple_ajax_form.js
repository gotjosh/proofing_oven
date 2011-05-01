(function($) {
  $.fn.extend({
    simple_ajax_form: function(options) {
      this.submit(function() {
        var settings = $.extend({
          success: function(response) {}
        }, options);

        var $form = $(this);
        $.ajax({
          type: "POST",
          url: this.action,
          data: $form.serialize(),
          success: settings.success
        });
        return false;
      });
    }
  });
})(jQuery);

$(function() {
  (function($container) {
    var $form = $container.find("form");

    $container.find(".category_tree a").live("click", function() {
      var $bucket = $("<div />").load($(this).attr("href"), function() {
        $container.find(".category_tree").next("form").remove().end().after($bucket.html());
      });
      return false;
    });

    $form.find("a.cancel").live('click', function() {
      $(this).closest("form").remove();
      return false;
    });
  })($("#categories_form"));
});

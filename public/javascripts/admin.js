$(function() {
  try { Typekit.load(); }
  catch (e) {}

  (function($categories) {
    $categories.delegate(":checkbox", "change", function() {
      var $e = $(this),
          $sub = $e.closest("li").children(".sub");
      if ($sub.length) {
        $sub.toggle();
      }
      if ($e.not(":checked")) {
        $sub.find(":checkbox").attr("checked", false).end().find(".sub").hide();
      }
    });

    bindNewCategoryLinks($categories);
  })($(".categories"));
});

function bindNewCategoryLinks($categories, createElement) {
  $categories.delegate("a.new", "click", function() {
    var submitNewCategory = function() {
      if ($text.val()) {
        if (typeof createElement === "function") {
          createElement().appendTo($ul);
        }
        else {
          $("<input />", {
            type: "checkbox",
            value: $text.val()
          }).prependTo(
            $("<label />", { text: " " + $text.val() }).appendTo(
              $("<li />").appendTo($ul)
            )
          );
        }
        $form.remove();
      }
      else {
        $("<p />", {
          "class": "error",
          text: "Please enter a category name"
        }).insertBefore($text);
      }
      return false;
    };
    var $e = $(this),
        $ul = $(this).prev("ul"),
        $form = $("<div />", { "class": "add_category" }).insertBefore($e);
        $text = $("<input />", {
          type: "text",
          keydown: function(e) {
            if (e.keyCode === 13) {
              submitNewCategory();
              return false;
            }
          }
        }).appendTo($form),
        $submit = $("<input />", {
          type: "submit",
          click: submitNewCategory
        }).appendTo($form),
        $cancel = $("<a />", {
          href: "#",
          text: "Cancel",
          click: function() {
            $form.remove();
            return false;
          }
        }).appendTo($form);
    return false;
  });
}

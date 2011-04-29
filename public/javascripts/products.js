$(function() {
  $("a.upload").click(function() {
    $(this).closest("article").find(".uploads").toggle();
    return false;
  });

  $(".uploads").delegate(":file", "change", function() {
    var $e = $(this);
    if ($e[0].files.length) {
      $("<input />", {
        type: "file",
        name: "product[images_attributes][" + new Date().getTime() + "][attachment]"
      }).appendTo($("<li />").appendTo($e.closest("ul")));
    }
  });
});

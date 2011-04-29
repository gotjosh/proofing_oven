$(function() {
  $("input.multiple[type=file]").change(function(e) {
    var $e = $(this),
        new_id =  +$e.attr("name").match(/\[\d\]/).toString().replace(/\[|\]/g, "");
    $("<li />").appendTo($e.closest("ul"));
    $("<input />", {
      type: "file",
      name: $e.attr("name").replace(/\[\d\]/, "[" + (++new_id) + "]"),
      change: e.handler
    }).appendTo($e.closest("ul").find("li").eq(-1));
  });

  $("input[placeholder]").each(function() {
    var $e = $(this),
        placeholder = $e.attr("placeholder");
    $e.removeAttr("placeholder").val(placeholder);
    $e.bind("focus blur", function(e) {
      if (e.type === "focus" && $e.val() === placeholder) { $e.val(""); }
      else { if (!$e.val()) { $e.val(placeholder); } }
    });
  });
});

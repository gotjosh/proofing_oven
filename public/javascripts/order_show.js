$(function() {
  $("#toggle_all").change(function() {
    if ($(this).is(":checked")) {
      $("table.standard tbody :checkbox").attr("checked", "checked");
    } else {
      $("table.standard tbody :checkbox").removeAttr("checked");
    }
  });
});

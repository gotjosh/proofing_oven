$(function() {
  $(".cart_item input").blur(function() {
    var $e = $(this),
        qty = +$e.val().replace(/\D/g, ""),
        cost = +$e.closest(".cart_item").find(".cost").text().replace(/\$/g, ""),
        $total = $e.closest(".cart_item").find(".line_total");
    $total.text("$" + ((cost * 100 * qty) / 100));
    $e.val(qty);
    updateTotals();
  });

  var cart = {
    $totals: $(".cart_totals"),
  };
  $.extend(cart, {
    $sub: cart.$totals.find("dd.subtotal"),
    $tax: cart.$totals.find("dd.tax"),
    $shipping: cart.$totals.find("dd.shipping"),
    $total: cart.$totals.find(".total dd"),
    $discount: cart.$totals.find("dd.discount")
  });

  function updateTotals() {
    var total, tax, discount,
        zipcode = $(".shipping_calculator :text").val();
    var roundPrice = function(p) {
      return Math.round(p / 100) / 100;
    };
    var formatPrice = function(p) {
      if (p) {
        if (typeof p === "number") { p += ""; }
        var decimal_places = p.substring(p.search(/\./) + 1).length;
        if (decimal_places === p.length) { p += ".00"; }
        else if (decimal_places === 1) { p += "0"; }
      }
      return "$" + p;
    };
    total = tax = discount = 0;
    cart.$totals.closest("form").find(".cart_item").each(function() {
      total = (total * 100 + +$(this).find(".line_total").text().replace(/\$/g, "") * 100) / 100;
    });
    cart.$sub.text(formatPrice(total));
    tax = roundPrice(total * 100 * ("tax" in cart ? cart.tax : 0));
    console.log(cart.tax);
    discount = roundPrice(total * 100 * cart.discount);
    total = Math.round((tax - discount + total + cart.shipping) * 100) / 100;
    cart.$tax.text(formatPrice(tax));
    cart.$discount.text(formatPrice(discount));
    cart.$total.text(formatPrice(total));
  }

  // Will need to write a call to fetch discount.
  cart.discount = 10;
  cart.shipping = 0;

  (function($calculator) {
    $calculator.find("button").click(function() {
      var $calculator = $(this).closest(".shipping_calculator");
      cart.zipcode = +$calculator.find(":text").val().replace(/\D/g, "");
      // $.ajax({
        // url: "url_to/shipping_options",
        // method: "GET",
        // data: $zip.attr("name") + "=" + $zip.val(),
        // success: function(html) {
          // $calculator.find(".options").replaceWith(html);
        // }
      // });
      cart.tax = 7;
      updateTotals();
      $calculator.find(".options").show();
      cart.$tax.show().prev("dt").show().find("small").text("to " + cart.zipcode);
      return false;
    });
    $calculator.find(":text").keydown(function(e) {
      if (e.keyCode === 13) {
        $calculator.find("button").click();
        return false;
      }
    });
    $calculator.delegate(":radio", "change", function() {
      var $e = $(this);
      cart.$shipping.show().text($e.closest("dt").next("dd").text());
      cart.$shipping.prev("dt").show().html($e.closest("dt").find("label").html())
          .find("small").text("to " + cart.zipcode);
      cart.shipping = parseFloat($e.val());
      updateTotals();
    });
  })($(".shipping_calculator"));
});

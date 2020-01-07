$(function() {
  $("li").click(function(e) {
    $("li").removeClass("selected");
    $(this).addClass("selected");
  });
});

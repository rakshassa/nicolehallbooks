document.addEventListener("turbolinks:load", function() {
  //------- Activate froala html editor -----//
  new FroalaEditor('#example', {toolbarInline: false});

  //------- Active Nice Select --------//
  $('select').niceSelect();

   // -------   Active Mobile Menu-----//
  $(".menu-bar").click(function(e) {
      e.preventDefault();
      $("nav").toggleClass('hide');
      $("span", this).toggleClass("lnr-menu lnr-cross");
      $(".main-menu").addClass('mobile-menu');
  });
});

$(function() {
  $('.item_show').on("mouseover", function() {
    var ImgSrc = $(this).attr("src");
    $("img#mainphoto").attr({src:ImgSrc});
    $("img#mainphoto").hide();
    $("img#mainphoto").fadeIn();
        return false;
    });
  });
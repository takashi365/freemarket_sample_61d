$(function(){
  $("#input").on("keyup", function(){
    var input = ($("#input").val());
    var commission = input * 0.1;
    var profits = input - commission;
    $('.exhibit_box__list__fees__fee__right').text("¥" + commission);
    $('.exhibit_box__list__profits__profit__right').text("¥" + profits);

  });
});
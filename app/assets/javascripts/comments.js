$(document).on('turbolinks:load', function(){
  var maxLength = 100
  $('#comment_content').keyup(function(){
    var length = $(this).val().length;
    var minlength = maxLength - length;
    var limit = "你还可以输入"+minlength+"个字";
    $('.limit').text(limit);
  });
});
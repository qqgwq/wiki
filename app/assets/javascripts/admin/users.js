$(document).ready(function(){
  var str = $('#hidden_four').html();
  var hidden = str.substr(0,3)+"****"+str.substr(7);
  $('#hidden_four').html(hidden);
})
$(document).on('turbolinks:load', function(){
  now = new Date()
  hour = now.getHours()
  if(hour < 6){
    $('.greetings').html("凌晨好！")
  }
  else if (hour < 9){
    $('.greetings').html("早上好！")
  } 
  else if (hour < 12){
    $('.greetings').html("上午好！")
  } 
  else if (hour < 14){
    $('.greetings').html("中午好！")
  } 
  else if (hour < 17){
    $('.greetings').html("下午好！")
  } 
  else if (hour < 19){
    $('.greetings').html("傍晚好！")
  } 
  else if (hour < 22){
    $('.greetings').html("晚上好！")
  } 
  else {
    $('.greetings').html("夜里好！")
  }
});

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

$(document).on('turbolinks:load', function(){
  var lunar = chineseLunar.solarToLunar(new Date());
  var lunar_day = "农历: " + lunar.year + "年" + lunar.month + "月" + lunar.day
  $('.lunar_date').html(lunar_day);
  $('.lunar_date').css({'color': 'red', 'font-size': '20px'});
})

$(document).on('turbolinks:load', function(){
  var solar = new Date();
  var solar_day = "今天是" + solar.getFullYear() + "年" + (solar.getMonth() + 1) + "月" + solar.getDate() + "日" + "星期" + solar.getDay();
  $('.solar_date').html(solar_day);
  $('.solar_date').css({'color': 'red', 'font-size': '18px'});
})

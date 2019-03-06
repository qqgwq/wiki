$(document).on('turbolinks:load', function(){
  $('.form-group').on("keyup", function(){
    setTimeout(function(){
      var name = $('#name').val();
      $.ajax({
        url: '/check_name',
        type: 'GET',
        data: {name: name},
        dataType: 'json',
        success: function(data){
          $('#name_taken').html(data.errors);
          $('#name_taken').css('color','red');
          $('#name_taken').show();
        },
        error: function(data){
          $('#name_taken').hide();
        }
      });
    },1000);
  });
})

$(document).on('turbolinks:load', function(){
  $('.form-group').on("keyup", function(){
    setTimeout(function(){
      var email = $('#email').val();
      $.ajax({
        url: '/check_email',
        type: 'GET',
        data: {email: email},
        dataType: 'json',
        success: function(data){
          $('#email_taken').html(data.errors);
          $('#email_taken').css('color','red');
          $('#email_taken').show();
        },
        error: function(data){
          $('#email_taken').hide();
        }
      });
    },1000);
  });
})

$(document).on('turbolinks:load', function(){
  $('.form-group').on("keyup", function(){
    setTimeout(function(){
      var phone = $('#phone').val();
      $.ajax({
        url: '/check_phone',
        type: 'GET',
        data: {phone: phone},
        dataType: 'json',
        success: function(data){
          $('#phone_taken').html(data.errors);
          $('#phone_taken').css('color','red');
          $('#phone_taken').show();
        },
        error: function(data){
          $('#phone_taken').hide();
        }
      });
    },1000);
  });
})

$(document).ready(function(){
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


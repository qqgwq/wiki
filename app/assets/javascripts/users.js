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
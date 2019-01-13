//= require jquery
//= require jquery_ujs
//= require simditor
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .
//= require rails_emoji_picker
//= require Chart.bundle
//= require chartkick
//= require select2-full
// 性能检测
//= require nprogress
//= require nprogress-turbolinks
// 表单验证
//= require jquery.validate
//= require jquery.validate.localization/messages_es
//= require jquery.validate.localization/messages_de

//= require bootstrap-filestyle
// 表单/按钮提示工具
//= require bootstrap/bootstrap-tooltip
// 模态框
//= require bootstrap-modal
//= require bootstrap-modalmanager
//社交分享按钮
//= require social-share-button
//= require social-share-button/wechat

javascript:
  $(function(){
    $("#ps_info").tooltip()
    $(".notification").tooltip()
  });

  $(document).ready(function(){
    $("#image").on('change', function(event){
      var files = event.target.files;
      var image = files[0]
      var reader = new FileReader();
      reader.onload = function(file) {
        var img = new Image();
        console.log(file);
        img.src = file.target.result;
        img.width = "120";
        $('#target').html(img);
        $('.delete_file').show();
      }
      reader.readAsDataURL(image);
      console.log(files);
    });
  });

  //password visible
  $(document).on("turbolinks:load",function(){
    $(".blink").click(function(){
      if($("#password").attr("type") == "password"){
        $("#password").attr("type", "text");
        $(this).toggleClass("fa-eye-slash");
      } else{
        $("#password").attr("type", "password");
        $(this).toggleClass("fa-eye-slash");
      }
    });
  });

  //sidebar
  $(document).on("turbolinks:load", function(){
    $('#menu-toggle').click(function(e){
      e.preventDefault();
      $('#wrapper').toggleClass('toggled');
    });
  });

  //mode
  $(document).on("turbolinks:load", function(){
    $('#mode').click(function(){
      $('body').toggleClass('night')
      $('.navbar-wiki').toggleClass('night')
      $('.night-icon').toggleClass('fa-moon-o fa-moon')
    });
  });

//ajax搜索匹配，不用点击搜索按钮
$(function(){
  $(".article_search input").keyup(function(){
    // $.get作为ajax require, form’s action as the URL for the AJAX request 
    //the form’s data by using $(this).serialize, null as we don’t want a callback function and then 'script'
    $.get($(".article_search").attr('action'), $(".article_search").serialize(), null, "script");
    return false
  });
});

$(document).ready(function(){
  $(window).scroll(function(){
    var top = $(window).scrollTop();
    if (top >= 30){
      $('.header').addClass('navbar-fixed-active');
    } else{
      $('.header').removeClass('navbar-fixed-active');
    }
  });
});


//Return to Top Arrow
$(document).on('turbolinks:load', function(){
  $(window).scroll(function(){
    if ($(this).scrollTop() >= 10){
      $('#back-to-top').fadeIn(1000);
    } else{
      $('#back-to-top').fadeOut(1000);
    }
  });
  $('#back-to-top').click(function() {      // When arrow is clicked
    $('html, body').animate({scrollTop : 0},500);
    return false;
  });
});
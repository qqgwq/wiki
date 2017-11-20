// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require simditor
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .
//= require rails_emoji_picker
//= require Chart.bundle
//= require chartkick
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

//ajax搜索匹配，不用点击搜索按钮
$(function(){
  $(".article_search input").keyup(function(){
    // $.get作为ajax require, form’s action as the URL for the AJAX request 
    //the form’s data by using $(this).serialize, null as we don’t want a callback function and then 'script'
    $.get($(".article_search").attr('action'), $(".article_search").serialize(), null, "script");
    return false
  });
});
  
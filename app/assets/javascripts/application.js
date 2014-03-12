// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require underscore
//= require gmaps/google
//= require_tree .


$(function(){ $(document).foundation(); });

$(document).ready(init);

function init(){
  $(document).foundation();
  $('.next-step').click(clickNextStep);
}

function clickNextStep(e) {
  e.preventDefault();
  if (this.parentElement.id == "question-6"){
    $('#submit-search-breed').show();
  }
  $('section').hide();
  if (this.parentElement.id){
    var num = parseInt(this.parentElement.id.substring(9));
    var progressPercentage = (100 / 7) * num;
    num += 1
    var id = this.parentElement.id.substring(0,9) + num;
    $('#' + id).show();
  }else{
    $('#question-1').show();
  }
  addToProgressBar(progressPercentage);
}

function addToProgressBar(percentage) {
  var containerWidth = $('#progress-bar-container').css('width');
  var width = (parseInt(containerWidth) / 100) * percentage;
  $('#progress').animate({width: width}, 500);
}
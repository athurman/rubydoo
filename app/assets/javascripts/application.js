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
//= require_tree .

$(function(){ $(document).foundation(); });

$(document).ready(initialize);

function initialize(){
  $('#submit-zipcode').click(clickValidateZip);
  initMap(36, -86, 5);
}

function clickValidateZip() {
  var zipCode = getValue('#zip');

  if (zipCode == null || zipCode == "") {
    alert("Zip code must be filled out.");
    return false;
  } else if (zipCode.length < 5 || zipCode.length >5) {
    alert("Zip code must be 5 digits.");
    return false;
  }
}

// function initMap(lat, lng, zoom){
//   var mapOptions = {center: new google.maps.LatLng(lat, lng), zoom: zoom, mapTypeId: google.maps.MapTypeId.ROADMAP};
//   db.map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
// }

// --------------------------------------------- //
// --------------------------------------------- //
// --------------------------------------------- //

function getValue(selector, fn){
  var value = $(selector).val();
  $(selector).val('');

  if(fn){
    value = fn(value);
  }

  return value;
}
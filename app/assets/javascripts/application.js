//= require jquery
//= require jquery_ujs
//= require jquery.ui.datepicker
//= require foundation
//= require chosen-jquery
//= require global
//= require filters
//= require teams
//= require games
//= require totals
//= require mixpanel
//= require ckeditor/init
//= require_tree .

$(function() {
  $('.toggle').click(function() {
    $(this).toggleClass('expanded').siblings('div').slideToggle();
  });
});

// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets
$(document).ready(function() {

  // smooth scrolling

  $('a[href*=#]:not([href=#])').click(function() {
    if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
      if (target.length) {
        $('html,body').animate({
          scrollTop: target.offset().top
        }, 400);
        return false;
      }
    }
  });

  // tooltip on videos.show

  $('[data-toggle="tooltip"]').tooltip()

  // $('tr.study_video_instance td:first-child input[type=radio]').hide();
  $('tr.study_video_instance:nth-child(2) td:first-child input[type=radio]').prop("checked", true);
  $('tr.study_video_instance:nth-child(2)').addClass('active');

  $('tr.study_video_instance').on('click', function() {
    $(this).addClass('active').siblings().removeClass('active');
    $(this).children('td:first-child').children('input[type=radio]').prop("checked", true);
  })

  $('body > div > div > form').on('submit', function(e) {
    var study_time_val = $('#foo_study_time').val()
    if (!isInt(study_time_val)) {
      console.log("not an int");
    }
  })

  // scripts
  $('.scripts .script').hide();
  $('.scripts #japanese_script').show();

  // script tabs
  $('.script_tabs li').on('click', function(e) {
    e.preventDefault();
    $('.scripts .script').hide();
    $(this).addClass('active').siblings().removeClass('active');
    if (this.id == "japanese_script_tab") {
      $('.scripts #japanese_script').show();
    } else if (this.id == "english_script_tab") {
      $('.scripts #english_script').show();
    } else if (this.id == "na") {
      $('.scripts #empty_script_tab').show();
    } else if (this.id == "collocations_tab") {
      $('.scripts #collocations').show();
    }
  })

  var shadowingPopoverContent = "<p>While listening, try to repeat — to \"shadow\" — what you hear as quickly as you hear it.</p><a href=\"#\">Learn more about shadowing</a><br><a href=\"#\">View example</a>";
  var speakingPopoverContent = "<p>While listening, try to repeat — to \"shadow\" — what you hear as quickly as you hear it.</p><a href=\"#\">Learn more about shadowing</a><br><a href=\"#\">View example</a>";
  var listeningPopoverContent = "<p>While listening, try to repeat — to \"shadow\" — what you hear as quickly as you hear it.</p><a href=\"#\">Learn more about shadowing</a><br><a href=\"#\">View example</a>";
  var writingPopoverContent = "<p>While listening, try to repeat — to \"shadow\" — what you hear as quickly as you hear it.</p><a href=\"#\">Learn more about shadowing</a><br><a href=\"#\">View example</a>";
  var submitWritingPopoverContent = "<p>While listening, try to repeat — to \"shadow\" — what you hear as quickly as you hear it.</p><a href=\"#\">Learn more about shadowing</a><br><a href=\"#\">View example</a>";

  $('#shadowingPopover').popover({
    html: true,
    container: 'body',
    toggle: 'popover',
    placement: 'bottom',
    content: shadowingPopoverContent
  })

  $('#speakingPopover').popover({
    html: true,
    container: 'body',
    toggle: 'popover',
    placement: 'bottom',
    content: speakingPopoverContent
  })

  $('#listeningPopover').popover({
    html: true,
    container: 'body',
    toggle: 'popover',
    placement: 'bottom',
    content: listeningPopoverContent
  })

  $('#writingPopover').popover({
    html: true,
    container: 'body',
    toggle: 'popover',
    placement: 'bottom',
    content: writingPopoverContent
  })

  $('#submitWritingPopover').popover({
    html: true,
    container: 'body',
    toggle: 'popover',
    placement: 'bottom',
    content: submitWritingPopoverContent
  })

  // collocations form

  // $("form#new_collocation").on("submit", function(event) {

  $('#account_settings').on('ajax:complete', function(event, xhr, status, error) {
    // insert the failure message inside the "#account_settings" element
    // $(this).append(xhr.responseText)
    console.log('you did it');
  });

  // });

  // $.ajax({
  //   method: "POST",
  //   url: "/collocations/create",
  //   data: {
  //     id: //the id,
  //     collocation: // the text,
  //     context: // the context
  //   }
  // })

  // writing

  $('#charNum').text("0");
  $('#writingTextField').keyup(function() {
    var len = $(this).val().length;
    $('#charNum').text(len);
  });

  var subLen = $('#message').val().length
  $('#submit_length').text(subLen)




});

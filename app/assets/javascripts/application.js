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
//= require bootstrap-sprockets
//= require_tree .


$(document).on('page:change', function()
{
  'use strict';


  // smooth scrolling
  $('a[href*=#]:not([href=#])').click(function()
  {
    if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname)
    {
      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
      if (target.length)
      {
        $('html,body').animate(
        {
          scrollTop: target.offset().top
        }, 400);
        return false;
      }
    }
  });


  // $('tr.study_video_instance td:first-child input[type=radio]').hide();
  $('tr.study_video_instance:first-child td:first-child input[type=radio]').prop("checked", true);
  $('tr.study_video_instance:first-child').addClass('active');

  $('tr.study_video_instance').on('click', function()
  {
    $(this).addClass('active').siblings().removeClass('active');
    $(this).children('td:first-child').children('input[type=radio]').prop("checked", true);
  })

  $('body > div > div > form').on('submit', function(e)
  {
    var study_time_val = $('#foo_study_time').val()
    if (!isInt(study_time_val))
    {
      console.log("not an int");
    }
  })

  // scripts
  $('.script').hide();
  $('#japanese_script').show();


  // script tabs
  $('.script_tabs li').on('click', function(e)
  {
    e.preventDefault();
    $('.script').hide();
    $(this).addClass('active').siblings().removeClass('active');
    if (this.id == "japanese_script_tab")
    {
      $('#japanese_script').show();
    }
    else if (this.id == "english_script_tab")
    {
      $('#english_script').show();
    }
    else if (this.id == "spanish_script_tab")
    {
      $('#spanish_script').show();
    }
    else if (this.id == "na")
    {
      $('#empty_script_tab').show();
    }
    else if (this.id == "collocations_tab")
    {
      $('#collocations').show();
    }
  })

  var shadowingPopoverContent = "<p>While listening, try to repeat — to \"shadow\" — what you hear as quickly as you hear it.</p><a href=\"#\">Learn more about shadowing</a><br><a href=\"#\">View example</a>";
  var speakingPopoverContent = "<p>While listening, try to repeat — to \"shadow\" — what you hear as quickly as you hear it.</p><a href=\"#\">Learn more about shadowing</a><br><a href=\"#\">View example</a>";
  var listeningPopoverContent = "<p>While listening, try to repeat — to \"shadow\" — what you hear as quickly as you hear it.</p><a href=\"#\">Learn more about shadowing</a><br><a href=\"#\">View example</a>";
  var writingPopoverContent = "<p>While listening, try to repeat — to \"shadow\" — what you hear as quickly as you hear it.</p><a href=\"#\">Learn more about shadowing</a><br><a href=\"#\">View example</a>";
  var submitWritingPopoverContent = "<p>While listening, try to repeat — to \"shadow\" — what you hear as quickly as you hear it.</p><a href=\"#\">Learn more about shadowing</a><br><a href=\"#\">View example</a>";


  $('#shadowingPopover').popover(
  {
    title: "Shadowing",
    html: true,
    container: 'body',
    toggle: 'popover',
    placement: 'bottom',
    content: shadowingPopoverContent
  })

  $('#speakingPopover').popover(
  {
    title: "Speaking",
    html: true,
    container: 'body',
    toggle: 'popover',
    placement: 'bottom',
    content: speakingPopoverContent
  })

  $('#listeningPopover').popover(
  {
    title: 'Listening',
    html: true,
    container: 'body',
    toggle: 'popover',
    placement: 'bottom',
    content: listeningPopoverContent
  })

  $('#writingPopover').popover(
  {
    title: 'Writing',
    html: true,
    container: 'body',
    toggle: 'popover',
    placement: 'bottom',
    content: writingPopoverContent
  })

  $('#submitWritingPopover').popover(
  {
    html: true,
    container: 'body',
    toggle: 'popover',
    placement: 'bottom',
    content: submitWritingPopoverContent
  })

  // tooltip on videos.show
  $('[data-toggle="tooltip"]').tooltip()
  $('.collapse').collapse()

  // on clicking of pause button
  $('button.play_pause').on('click', function()
  {
    // check to see if popover is visible
    var isVisible = $('.ppover').data('bs.popover').tip().hasClass('in');
    // if it's visible, hide it
    if (isVisible)
    {
      $('.ppover').popover('hide');
    }
    else
    {
      return false;
    }
  })

  // writing
  $('#charNum').text("0");
  $('#writingTextField').keyup(function()
  {
    var len = $(this).val().length;
    $('#charNum').text(len);
  });



});

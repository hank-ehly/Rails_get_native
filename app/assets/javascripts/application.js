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

  $('body > div > div > form').on('submit', function(e)
  {
    var study_time_val = $('#foo_study_time').val()
    if (!isInt(study_time_val))
    {
      console.log("not an int");
    }
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

});

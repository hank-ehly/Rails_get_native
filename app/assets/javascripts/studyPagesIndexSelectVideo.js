$(document).on('page:change', function() 
{
	'use strict';

  $('tr.study_video_instance:first-child td:first-child input[type=radio]').prop("checked", true);
  $('tr.study_video_instance:first-child').addClass('active');

  $('tr.study_video_instance').on('click', function()
  {
    $(this).addClass('active').siblings().removeClass('active');
    $(this).children('td:first-child').children('input[type=radio]').prop("checked", true);
  })
  
})
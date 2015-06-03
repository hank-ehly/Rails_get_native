$(document).on('page:change', function() 
{
	'use strict';

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

})
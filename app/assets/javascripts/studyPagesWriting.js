$(document).on('page:change', function() 
{
	'use strict';

  // writing
  $('#charNum').text("0");
  $('#writingTextField').keyup(function()
  {
    var len = $(this).val().length;
    $('#charNum').text(len);
  });

})
$(document).on("page:change", function()
{

  $( ".select_language #language_id" ).change(function() 
  {

  	var selectedLanguageName;

  	selectedLanguageName = $(".select_language #language_id option:selected").html();

  	window.location.href = "study_pages?lang=" + selectedLanguageName;

	});

});

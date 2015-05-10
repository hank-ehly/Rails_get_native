$(document).on("page:change", function()
{

  $("select#language_id").change(function()
  {

    var str = "";

    $("select#language_id option:selected").each(function()
    {
      str += $(this).text();
    });

  });

});

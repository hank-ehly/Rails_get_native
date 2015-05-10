$(document).on('page:change', function()
{

  var output;


  /*====================================
   =            INQUIRY AJAX            =
   ====================================*/

  $('form#new_collocation').on('ajax:success', function(e, data, status, xhr)
  {

    output = "";
    $('div.collocationsMessage').html("");

    /**
     *
     * if ERROR
     *
     **/

    if (data['error'])
    {
      output += "<div class=\"alert alert-danger alert-dismissable fade in\" role=\"alert\">";
      output += "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">";
      output += "<span aria-hidden=\"true\">&times;</span>";
      output += "</button>";
      output += "<h3>エラー <span class=\"glyphicon glyphicon-exclamation-sign\" aria-hidden=\"true\"></span></h3>";
      for (var i = data['error'].length - 1; i >= 0; i--)
      {
        output += "<p>• ";
        output += data['error'][i];
        output += "</p>";
      };
      output += "</div>";
      $('div.collocationsMessage').append(output);
    }

    /**
     *
     * if SUCCESS
     *
     **/

    else if (data['success'])
    {
      output += "<div class=\"alert alert-success alert-dismissable fade in\" role=\"alert\">";
      output += "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">";
      output += "<span aria-hidden=\"true\">&times;</span>";
      output += "</button>";
      output += "<p>";
      output += data['success'];
      output += "</p>";
      output += "</div>";
      document.getElementById('collocation_collocation').value = "";
      $('ul#collocation_list').append("<li class=\"collocation_first\">" + data['collocation'] + "</li><li class=\"well well-sm collocation_well\"></li>");
    }

  });

  /*-----  End of INQUIRY AJAX  ------*/


  $("a[data-remote]").on('ajax:success', function(e, data, status, xhr)
  {
    output = "";

    /**
     *
     * if ERROR
     *
     **/

    if (data['error'])
    {

    }

    /**
     *
     * if SUCCESS
     *
     **/

    else if (data['success'])
    {
      output += "<div class=\"alert alert-success alert-dismissable fade in\" role=\"alert\">";
      output += "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">";
      output += "<span aria-hidden=\"true\">&times;</span>";
      output += "</button>";
      output += "<p>";
      output += data['success'];
      output += "</p>";
      output += "</div>";
      $('div.collocationsMessage').append(output); // just to check
      var collocation_id = data['collocation_id'];
      $('#collocation'+collocation_id)[0].remove();
    }
  })







});

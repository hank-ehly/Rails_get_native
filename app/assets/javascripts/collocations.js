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
      console.log('error');
    }

    /**
     *
     * if SUCCESS
     *
     **/

    else if (data['success'])
    {
      // see views/collocations/create.js.erb
    }

  });

  /*-----  End of INQUIRY AJAX  ------*/


  $("a[data-remote]").on('ajax:success', function(e, data, status, xhr)
  {
    console.log('collocations.js > destroy success');
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
      var collocation_id = data['collocation_id'];
      var collocationBlock = document.getElementById('collocation' + collocation_id);

      var profileCollocationBlock = $('div.info_column.col-md-6.col-sm-7 > ul#collocation' + collocation_id);

      colBlocks = [collocationBlock, profileCollocationBlock]

      colBlocks.forEach(function(element, index)
      {
        element.remove();
      });

      /* remove collocation block */
      while (collocationBlock.firstChild)
      {
        collocationBlock.removeChild(collocationBlock.firstChild);
      }
    }
  })


});

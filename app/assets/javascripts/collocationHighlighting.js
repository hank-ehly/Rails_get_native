$(document).on('page:change', function() 
{
	'use strict';

	if ($('.collocation_instance')) {
		$.each($('.collocation_instance'), function(index, val) {

			var col, well;

			col = val.children[0];
			well = val.children[1];

			var start, end, embededCollocation;
			start = val.children[1].innerHTML.indexOf(val.children[0].innerHTML);
			end = start + val.children[0].innerHTML.length;

			jQuery.fn.addSpan = function (elName, str, offset, length)
			{
			    if(this.innerHTML = str)
			    {
			        return this.each(function ()
			        {

			            this.innerHTML = 

			            this.innerHTML.substring(0,start) +  // up to beginning of col

			            "<span class=\"embededCollocation\">" + 

			            this.innerHTML.substring(start, start+col.innerHTML.length) + // get's collocation

			            "</span>" + 

			            this.innerHTML.substring(end, end+20); // get's end of col

			        });
			    }
			};


			$(well).addSpan(col.innerHTML, 15, col.length);


		});
	};
})
$(document).on('page:change', function() {
	if ($('.collocation_instance')) {
		$.each($('.collocation_instance'), function(index, val) {
			 // console.log(val.children[0].innerHTML);
			 // console.log(val.children[1].innerHTML);

			 var start, end, embededCollocation;

			 start = val.children[1].innerHTML.indexOf(val.children[0].innerHTML);
			 end = start + val.children[0].innerHTML.length;

			 embededCollocation = val.children[1].innerHTML.substring(start, end);

		});
	};
})
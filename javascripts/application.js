$('.link-box').live('click', function(event){	
	window.open("http://" + $(this).attr('target'), '_blank');
});

$('.link').live('click', function(event) {
	if ($(this).attr('target').match(/^\/.*$/)) {
		window.location = window.location.origin + $(this).attr('target');
	} else {
		window.location = "http://" + $(this).attr('target');
	}
});
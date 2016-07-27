var init_friend_lookup;

init_friend_lookup = function(){
	$('#friend-lookup-form').on('ajax:before', function(event, data, status){
	})
	$('#friend-lookup-form').on('ajax:after', function(event, data, status){
	})
	$('#friend-lookup-form').on('ajax:success', function(event, data, status){
		$('#friend-lookup').replaceWith(data);
		init_friend_lookup();
	});

	$('#friend-lookup-form').on('ajax:error', function(event, xhr, status, error){
		$('#friend-lookup-results').replaceWith(' ');
		$('#friend-lookup-errors').replaceWith('<p class="lead col-md-12">No people matched this search criteria.</p>');
	});
}

$(document).ready(function(){
	init_friend_lookup();

});
var init_player_lookup;

init_player_lookup = function(){
	$('#player_lookup_form').on('ajax:success', function(event.data,status){
		$('#stats-table').replaceWith(data);
		init_player_lookup();
	})
}

$(document).ready(function(){
	alert('cat');
	init_player_lookup();
})
$(document).ready(function(){
	$("#mes").change(function(){
		var link = $("td a").attr("href");
		var data = {mes: $("#mes").val()};
		var newLink = link.replace(/\?.*$/, "") + "?" + jQuery.param(data);
		$("td a").attr("href", newLink);
	});
});

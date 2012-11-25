$(function(){
	$("#menu img").hover(
		function(){ this.src = this.src.replace(96, 128); },
		function(){ this.src = this.src.replace(128, 96); }
	);
});
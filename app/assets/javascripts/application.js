// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require jquery_ujs
//= require jquery.raty.js
//= require turbolinks
//= require_tree .
$(document).ready(function(e){
    //Only changes the name of the selected tem in the drop down
    $('.search-panel .dropdown-menu').find('a').click(function(e) {
		//prevents the page from refreshing when clicking an item
        e.preventDefault(); 
		$('.search-panel span#search_concept').text($(this).text());
	});


    //When the mouse goes off the navbar toggle button, it will not be highlighted
    $(".navbar-toggle").mouseup(function(){
    	$(this).blur();
	})
});
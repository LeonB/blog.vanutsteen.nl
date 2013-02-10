//= require "vendor/jquery-1.9.1"
//= require "vendor/jquery.fancybox-2.1.4"

jQuery.noConflict();

jQuery(document).ready(function(){
	jQuery('.entry-content').find('a[href$=".jpg"], a[href$=".png"]').find('img').each(function(i, img){
		var img = jQuery(img);
		var a = img.parent();
		a.fancybox({});

	});
})
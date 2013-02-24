//= require "vendor/jquery-1.9.1"
//= require "vendor/jquery.fancybox-2.1.4"
//= require "vendor/jquery.ba-hashchange.min.js"
//= require "vendor/jquery.swiftype.search.js"

jQuery.noConflict();

jQuery(document).ready(function(){
	jQuery('.entry-content').find('a[href$=".jpg"], a[href$=".png"]').find('img').each(function(i, img){
		var img = jQuery(img);
		var a = img.parent();
		a.fancybox({});
	});

	jQuery('#st-search-input').swiftypeSearch({
    	engineKey: 'rkpFqoWSMw9vXMnz3NPw',
        perPage: 20
	});
})



// var Swiftype = window.Swiftype || {};
// (function() {
// 	Swiftype.key = 'rkpFqoWSMw9vXMnz3NPw';
// 	Swiftype.inputElement = '#st-search-input';
// 	Swiftype.resultContainingElement = '#st-results-container';
// 	Swiftype.attachElement = '#st-search-input';
// 	Swiftype.renderStyle = "inline";
// 	Swiftype.resultPageURL = '/search/';

// 	var script = document.createElement('script');
// 	script.type = 'text/javascript';
// 	script.async = true;
// 	script.src = "//swiftype.com/embed.js";
// 	var entry = document.getElementsByTagName('script')[0];
// 	entry.parentNode.insertBefore(script, entry);
// }());

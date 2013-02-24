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

	var customPreRenderFunction = function(data) {
		var config = this.getContext().config;
		if (data.info.page.total_result_count) {
			jQuery('#st-no-results').hide();
		} else {
			jQuery('#st-no-results').show();
		}

		jQuery('.st-search-summary').remove();
		var summary = '';
		var from = (data.info.page.current_page * data.info.page.per_page) - data.info.page.per_page + 1;
		var to = from + data.records.page.length - 1;
		summary += '<div class="st-search-summary">';
			summary += '<h2>';
				summary += 'Results <strong>' + from + '&nbsp;-&nbsp;' + to + '</strong> of <strong>' + data.info.page.total_result_count + '</strong> ';
				summary += 'for <span class="st-query">ruby</span>';
			summary += '</h2>';
		summary += '</div>';

		// jQuery(config.resultContainingElement).insertBefore(summary);
		// jQuery('.search').insertAfter(summary);
		jQuery(summary).insertAfter('.search');

		jQuery('.st-search-input').val(data.info.page.query);
	}

	var customRenderFunction = function(document_type, item) {
		var out = '';
		out += '<article class="st-result" data-doc-id="' + item['external_id'] + '" data-dest-url="' + item['url'] + '">';
			out += '<div class="st-result-text">';
				out += '<h3 class="entry-title"><a href="' + item['url'] + '" class="st-search-result-link">' + item['title'] + '</a></h3>';
				out += '<div class="entry-content st-metadata">';
					out += '<span class="st-snippet">' + item['info'] + '</span>';
				out += '</div>';
			out += '</div>';
			out += '<div class="clearfix"></div>';
			// out += '<footer><a class="readmore" title="TIL about SSH agent forwarding" href="/2013/02/19/til-ssh-agent-forwarding/">Read more</a></footer>';
		out += '</article>';
		return out;
	};

	var customLoadingFunction = function(query, $resultContainer) {
		jQuery('#st-no-results').hide();
		$resultContainer.html('<p class="st-loading-message">loading...</p>');
    };

	jQuery('#st-search-input').swiftypeSearch({
    	engineKey: 'rkpFqoWSMw9vXMnz3NPw',
    	fetchFields: {'page': ['title','info']},
    	searchFields: {'page': ['body', 'title', 'sections']},
        perPage: 9999999,
        resultContainingElement: '#st-results-container',
        preRenderFunction: customPreRenderFunction,
        renderFunction: customRenderFunction,
        loadingFunction: customLoadingFunction
	});

	jQuery('aside .st-search-input').parent('form').submit(function(event){
		event.preventDefault();
		var value = jQuery(this).find('.st-search-input').first().val();
		jQuery('.st-search-input').val(value);
		window.location = '/search/?#stq=' + encodeURIComponent(value) + '&stp=1';
		return false;
	});
})

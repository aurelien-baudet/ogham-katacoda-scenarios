(function() {
	// p img[1px][___]
	// h2
	// ...
	// h2
	// ...
	// p img[1px][___]
	var process = function() {
		var tabContainerSeparators = $('p > img[alt="___"]').parent();
		$('img[alt="___"]').removeAttr('data-featherlight');
		
		
		// var tabContainerStarts = $('p img[src~="1px"][alt="___"]').parent();
		// var tabContainerEnds = $('p img[src~="1px"][alt="___"]');
		if(tabContainerSeparators.length % 2 != 0) {
			throw new Error("The number of tab-container is different from tab-container-end");
		}
		for(var i=0 ; i<tabContainerSeparators.length ; i+=2) {
			generateTabContainer(i, tabContainerSeparators[i], tabContainerSeparators[i+1]);
		}
	}
	
	var generateTabContainer = function(/*int*/group, /*Node*/start, /*Node*/end) {
		var tabs = $(start).nextUntil(end, 'h2');
		var height = 0;
		for(var i=0 ; i<tabs.length ; i++) {
			var tab = tabs[i];
			var tabTitleNodes = $(tab).children()
			var contentNodes = $(tab).nextUntil(tabs[i+1] || end);
			$(tab).addClass('tab');
			$(tab).prepend('<label class="tab-label" for="tab-'+group+'-'+i+'"></label>');
			$(tab).find('label').append(tabTitleNodes);
			$(tab).prepend('<input type="radio" id="tab-'+group+'-'+i+'" name="tab-group-'+group+'" '+(i==0 ? 'checked' : '')+'>');
			$(tab).append('<div class="tab-content">');
			var tabContentNode = $(tab).find('.tab-content');
			$(tabContentNode).append(contentNodes);
			$(tab).append(tabContentNode);
			$(start).append(tab);
			// track the height of the biggest tab
			var contentHeight = computeHeight($(contentNodes));
			if(contentHeight>height) {
				height = contentHeight;
			}
		}
		$(start).addClass('tab-container')
		$(start).css('height', (height+60+42)+'px');			// TODO: height of tab... This is really bad :(
		$(end).remove();
	}
	
	var computeHeight = function(/*Node[]*/nodes) {
		var totalHeight = 0;
		for(var i=0 ; i<nodes.length ; i++) {
			var overflow = $(nodes[i]).css('overflow', 'hidden');
			totalHeight += $(nodes[i]).outerHeight(true);
			$(nodes[i]).css('overflow', overflow);
		}
		return totalHeight;
	}
	
	$(document).ready(process);
})();
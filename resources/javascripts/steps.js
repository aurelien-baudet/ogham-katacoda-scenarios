(function() {
	var makeSteps = function() {
		$('[href="step"]')
			.click((e) => {e.preventDefault(); e.stopPropagation(); return false})
			.parent().parent().addClass('steps')
	}
	
	$(document).ready(makeSteps);
})();
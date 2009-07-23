var tags = {
	setup : function(){
		$('.tag_selector input[type=text]').autocomplete(
			{ serviceUrl : '/categories.json', delimiter: ',', minChars : 2 }
		);
	}
};
$(tags.setup);

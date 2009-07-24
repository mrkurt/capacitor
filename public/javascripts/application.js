var tags = {
	setup : function(){
		$('.tag_selector input[type=text]').autocomplete(
			{ serviceUrl : '/categories.json', delimiter: ',', minChars : 2 }
		);
	}
};
$(tags.setup);

try { mpmetrics.init("6e2841a24bf3df2ad9554e55c89ccd2d");} catch(err) {}

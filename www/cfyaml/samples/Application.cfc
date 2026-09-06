component{

    this.name="cf-yaml-examples";
	
	this.javaSettings = {
		loadPaths: [
			expandPath( "../libs/snakeyaml/current/" ),
		],
		loadColdFusionClassPath: true,
		reloadOnChange: true,
		watchInterval: 5,
		watchExtensions: "jar,class"
	};


    this.customTagPaths = "";
	this.customTagPaths = this.customTagPaths.listAppend( expandPath( "../tags/" ) );
    
}
<cfscript>

if( ! thistag.hasEndTag || thistag.executionMode == "end" ){

    
    
    switch( attributes.action ?: "" ){

        case "read-file":

            thistag.generatedContent=""
            variables.yamlObj = createObject("java", "org.yaml.snakeyaml.Yaml").init();
            variables.yamlStr = fileRead( attributes.path );
            caller[ attributes.variable ?: 'cfyaml_generated_struct' ] = variables.yamlObj.load(variables.yamlStr);

        break;

        case "read-string":
        break;

        case "generate":
        break;

        default:

        break;

    }


}

</cfscript>
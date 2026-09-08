<cfscript>
options = new cfyaml.DumperOptions();
//writeDump(options.unwrap());
yaml = new cfyaml.SnakeYAML();

writeOutput("<pre>");
writeOutput( yaml.dump([{"fname":"Anna", "lname"="Barbera"},{"fname":"Tex", "lname"="Avery"}]) )
writeOutput("</pre>");




lbTypes = ["MAC","WIN","UNIX","PLATFORM"];

lbTypes.each(
    (name,i)=>{
        writeOutput( "Calling setLineBreak with type parameter = #name#<br>" );
        options.setLineBreak(name);
        writeOutput( "Current line break is #options.getLineBreak()#<br>" );
        options.getLineBreak() == name ? writeOutput("Success") : writeOutput("Failure");
        writeOutput("<hr>");

        writeOutput( "Calling setLineBreak with type parameter = #lbTypes[i]#<br>" );
        options.setLineBreak(#lbTypes[i]#);
        writeOutput( "Current line break is #options.getLineBreak()#<br>" );
        options.getLineBreak() == #lbTypes[i]# ? writeOutput("Success") : writeOutput("Failure");
        writeOutput("<hr>");
    }
);

flowTypes = ["AUTO", "BLOCK", "FLOW"];

flowTypes.each(
    (name,i)=>{
        writeOutput( "Calling setFlowStyle with type parameter = #name#<br>" );
        options.setFlowStyle(name);
        writeOutput( "Current flow style is #options.getFlowStyle()#<br>" );
        options.getFlowStyle() == name ? writeOutput("Success") : writeOutput("Failure");
        writeOutput("<hr>");

        writeOutput( "Calling setFlowStyle with type parameter = #flowTypes[i]#<br>" );
        options.setFlowStyle(#flowTypes[i]#);
        writeOutput( "Current flow style break is #options.getFlowStyle()#<br>" );
        options.getFlowStyle() == #flowTypes[i]# ? writeOutput("Success") : writeOutput("Failure");
        writeOutput("<hr>");
    }
);

</cfscript>                             
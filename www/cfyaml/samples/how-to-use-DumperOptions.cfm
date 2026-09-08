<cfscript>
options = new cfyaml.DumperOptions();

lbTypes = ["MAC","WIN","UNIX","PLATFORM"];

lbTypes.each(
    (name,i)=>{
        writeOutput( "Calling setLineBreak with type parameter = #name#<br>" );
        options.setLineBreak(name);
        writeOutput( "Current line break is #options.getLineBreak()#<br>" );
        options.getLineBreak() == name ? writeOutput("Success") : writeOutput("Failure");
        writeOutput("<hr>");

        writeOutput( "Calling setLineBreak with type parameter = #i#<br>" );
        options.setLineBreak(#i#);
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

        writeOutput( "Calling setFlowStyle with type parameter = #i#<br>" );
        options.setFlowStyle(#i#);
        writeOutput( "Current flow style break is #options.getFlowStyle()#<br>" );
        options.getFlowStyle() == #flowTypes[i]# ? writeOutput("Success") : writeOutput("Failure");
        writeOutput("<hr>");
    }
);


styles = listToArray("DOUBLE_QUOTED,FOLDED,JSON_SCALAR_STYLE,LITERAL,PLAIN,SINGLE_QUOTED")

styles.each(
    (name,i)=>{
        writeOutput( "Calling setScalarStyle with type parameter = #name#<br>" );
        options.setScalarStyle(name);
        writeOutput( "Current Scalar style is #options.getScalarStyle()#<br>" );
        options.getScalarStyle() == name ? writeOutput("Success") : writeOutput("Failure");
        writeOutput("<hr>");

        writeOutput( "Calling setScalarStyle with type parameter = #i#<br>" );
        options.setScalarStyle(i);
        writeOutput( "Current Scalar style break is #options.getScalarStyle()#<br>" );
        options.getScalarStyle() == #styles[i]# ? writeOutput("Success") : writeOutput("Failure");
        writeOutput("<hr>");
    }
);


</cfscript>                             
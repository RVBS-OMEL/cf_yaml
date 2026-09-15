<html>
    <head>
        <cfinclude template="style.cfm" runonce="true" />
    </head>
    <body>
        <cfinclude template="navbar.cfm" runonce="true" />
<cfscript>
options = new cfyaml.DumperOptions();


enums = [
    {
        names: ["MAC","WIN","UNIX","PLATFORM"],
        cfSetterFunctionCalled = "setLineBreak",
        cfGetterFunctionCalled = "getLineBreak",
        propertyDescription = "line break"
    },
    {
        names: ["AUTO", "BLOCK", "FLOW"],
        cfSetterFunctionCalled = "setFlowStyle",
        cfGetterFunctionCalled = "getFlowStyle",
        propertyDescription = "flow style"
    },
    {
        names: listToArray("DOUBLE_QUOTED,FOLDED,JSON_SCALAR_STYLE,LITERAL,PLAIN,SINGLE_QUOTED"),
        cfSetterFunctionCalled = "setScalarStyle",
        cfGetterFunctionCalled = "getScalarStyle",
        propertyDescription = "scalar style"
    },
    {
        names: listToArray("BINARY,ESCAPE"),
        cfSetterFunctionCalled = "setNonPrintableStyle",
        cfGetterFunctionCalled = "getNonPrintableStyle",
        propertyDescription = "printable style"
    }
];

enums.each(
    (obj,idx) => {
        writeOutput("<hr>");
        writeOutput("Testing #obj.propertyDescription#<br />");
        obj.names.each(
            ( name, idxName ) => {
                var fName = obj.cfSetterFunctionCalled;
                writeOutput( "Calling #fName# with type parameter = #name#<br>" );
                options[  fName ](name);
                
                var fName = obj.cfGetterFunctionCalled;
                writeOutput( "Calling #fName# must return #name#<br>" );
                options[fName]() == name ? writeOutput("Success") : writeOutput("Failure");
                writeOutput("<br>");
            }
        );

    }
);
</cfscript>    
    </body>
</html>
                         
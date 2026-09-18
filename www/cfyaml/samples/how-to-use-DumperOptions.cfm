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
    },
    {
        names: listToArray("V1_0,V1_1"),
        cfSetterFunctionCalled = "setVersion",
        cfGetterFunctionCalled = "getVersion",
        propertyDescription = "version"
    }
];
chr1310 = "#chr(13)##chr(10)#"
enums.each(
    (obj,idx) => {
        writeOutput("<hr>");

        if(obj.propertyDescription == "version"){
           writeOutput("<h1>Neither setVersion nor getVersion should be used !</h1>") 
        }

        writeOutput("Testing #obj.propertyDescription#<br />");
        obj.names.each(
            ( name, idxName ) => {
                var setter = obj.cfSetterFunctionCalled;

                writeOutput( "<pre>//Calling #local.setter# with type parameter = #name##chr1310#" );
                writeOutput( "options = new cfyaml.DumperOptions();#chr1310#options.#local.setter#(""#name#"")#chr1310#" );
                options[  setter ](name);
                
                var getter = obj.cfGetterFunctionCalled;
                

                if( obj.propertyDescription == 'version' ){
                    var expectedValue = (name == "V1_0" ||name == 1 ) ? "1.0" : "1.1";
                    writeOutput( "//Calling #getter# must return #expectedValue##chr1310#" );
                    writeOutput( "options.#getter#()" );
                    options[getter]() == expectedValue ? writeOutput("Success") : writeOutput("Failure");
                }
                else if( obj.propertyDescription == 'line break' && name=="platform"){
                    writeOutput( "//Calling #getter# must return ""UNIX""#chr1310#" );
                    options[getter]() == "UNIX" ? writeOutput("Success") : writeOutput("Failure");
                }
                else{
                    writeOutput( "//Calling #getter# must return #name##chr1310#" );
                    options[getter]() == name ? writeOutput("Success") : writeOutput("Failure");
                }


                writeOutput( "#chr1310#//=======================================================================================#chr1310#" );
                writeOutput( "//Calling #local.setter# with type parameter = #idxName##chr1310#" );
                writeOutput( "options = new cfyaml.DumperOptions();#chr1310#options.#local.setter#(#idxName#)#chr1310#" );
                options[ setter ](idxName);
                writeOutput( "//Calling #getter# must return #name##chr1310#" );
                writeOutput( "//Calling #getter# must return #name##chr1310#" );
                options[getter]() == name ? writeOutput("Success") : writeOutput("Failure");
                
                writeOutput("</pre><br>");
            }
        );

    }
);



</cfscript>    

    <hr/>
    <cfset options.setVersion(1) />
    <cfdump var="#options.getVersion()#">

    </body>
</html>
                         
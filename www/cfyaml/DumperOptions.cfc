component{

    static{
        static.CLASSPATH_DUMPEROPTIONS                      = "org.yaml.snakeyaml.DumperOptions";
        static.CLASSPATH_DUMPEROPTIONS_LINEBREAK            = "org.yaml.snakeyaml.DumperOptions$LineBreak";
        static.CLASSPATH_DUMPEROPTIONS_FLOWSTYLE            = "org.yaml.snakeyaml.DumperOptions$FlowStyle";
        static.CLASSPATH_DUMPEROPTIONS_SCALARSTYLE          = "org.yaml.snakeyaml.DumperOptions$ScalarStyle";
        static.CLASSPATH_DUMPEROPTIONS_NONPRINTABLESTYLE    = "org.yaml.snakeyaml.DumperOptions$NonPrintableStyle";
        static.CLASSPATH_DUMPEROPTIONS_VERSION              = "org.yaml.snakeyaml.DumperOptions$Version";
    }

    public DumperOptions function init(){
        variables.dumperOptions = static.new();
        return this;
    }

    public static any function new(){
        return createObject("java", static.CLASSPATH_DUMPEROPTIONS ).init();
    }

    public any function unwrap(){
        return variables.dumperOptions;
    }

    /**
    Line breaks
    */

    public any function setLineBreak( required any type ){
        
        var lbClassPath="org.yaml.snakeyaml.DumperOptions$LineBreak";
        var types = ["MAC","WIN","UNIX","PLATFORM"];
        
        switch(arguments.type){
            case "MAC": case "WIN": case "UNIX":
                var lb = createObject("java", static.CLASSPATH_DUMPEROPTIONS_LINEBREAK).valueOf( ucase(arguments.type) );
                local.found=true;
            break;

            case 4: case "PLATFORM":
                var lb = createObject("java", static.CLASSPATH_DUMPEROPTIONS_LINEBREAK).getPlatformLineBreak();
            break;

            case 1: case 2: case 3:
                var lb = createObject("java", static.CLASSPATH_DUMPEROPTIONS_LINEBREAK).valueOf( local.types[ arguments.type ] );
            break;

            default:
                throw( 
                    type="CFYAML_DUMPEROPTIONS_WRONG_LB_TYPE", 
                    message="Line break can be 'MAC' (or 1), 'UNIX' (or 2 (default used by SnakeYaml)), 'WIN' (or 3), 'PLATFORM' (or 4 = server platform LB)" 
                );
            break;
        }

        unwrap().setLineBreak( local.lb );
        return this;

    }

    public string function getLineBreak(){
        return unwrap().getLineBreak().name();
    }


    /**
    Flow style
    */

    public DumperOptions function setFlowStyle( required any flowStyle){

        var styles = ["AUTO", "BLOCK", "FLOW"];

        switch( arguments.flowStyle ){

            case "AUTO": case "FLOW": case "BLOCK":
                var name = uCase(arguments.flowStyle);
            break;

            case 1: case 2: case 3:
                var name = styles[arguments.flowStyle];
            break;

            default:
                throw( 
                    type="CFYAML_DUMPEROPTIONS_WRONG_FLOW_STYLE", 
                    message="Flow style can be 'AUTO' (or 1), 'FLOW' (or 2), 'BLOCK' (or 3)" 
                );
            break;

        }

        unwrap().setDefaultFlowStyle( createObject( "java", static.CLASSPATH_DUMPEROPTIONS_FLOWSTYLE ).valueOf( local.name ) );
        return this;
    }

    public string function getFlowStyle(){

        return unwrap().getDefaultFlowStyle().name();
    }

    /**
    Scalar Style
    */

    public DumperOptions function setScalarStyle( required any style ){
        
        var styles = listToArray("DOUBLE_QUOTED,FOLDED,JSON_SCALAR_STYLE,LITERAL,PLAIN,SINGLE_QUOTED");

        if( arrayFindNoCase( styles, arguments.style ) ){
            unwrap().setDefaultScalarStyle(
                createObject("java", static.CLASSPATH_DUMPEROPTIONS_SCALARSTYLE).valueOf( ucase(arguments.style) )
            );
            return this;
        }

        if( isNumeric(arguments.style) ){

            var name="";
            try{
                local.name = styles[arguments.style];
            }catch(any e){}

            unwrap().setDefaultScalarStyle(
                createObject("java", static.CLASSPATH_DUMPEROPTIONS_SCALARSTYLE).valueOf( local.name )
            );
            return this;
        }

        throw( 
            type="CFYAML_DUMPEROPTIONS_WRONG_SCALAR_STYLE", 
            message="Scalar Style must be one of these values in #serializeJson(styles)#" 
        );
    }

    public string function getScalarStyle(){

        return unwrap().getDefaultScalarStyle().name();
    }

    /**
    NON PRINTABLE STYLE
    */

    public any function getNonPrintableStyle(){
        return unwrap().getNonPrintableStyle();
    }

    public DumperOptions function setNonPrintableStyle( required string style ){
        var styles = listToArray("BINARY,ESCAPE");

        if( arrayFindNoCase( styles, arguments.style ) ){
            unwrap().setNonPrintableStyle(
                createObject("java", static.CLASSPATH_DUMPEROPTIONS_NONPRINTABLESTYLE).valueOf( ucase(arguments.style) )
            );
            return this;
        }

        if( isNumeric(arguments.style) ){

            var name="";
            try{
                local.name = styles[arguments.style];
            }catch(any e){}

            unwrap().setNonPrintableStyle(
                createObject("java", static.CLASSPATH_DUMPEROPTIONS_NONPRINTABLESTYLE).valueOf( local.name )
            );
            return this;
        }

        throw( 
            type="CFYAML_DUMPEROPTIONS_WRONG_NONPRINTABLESTYLE", 
            message="Non Printable Style must be one of these values in #serializeJson(styles)#" 
        );
    }

    /**
    VERSION
    */
    public string function getVersion(){
        return unwrap().getVersion().getRepresentation();
    }

    public DumperOptions function setVersion( required string version ){
        
        var styles = listToArray("V1_0,V1_1");
        var name="";

        switch(  arguments.version ){

            case "V1_0":
            case "V1_1":
                local.name = arguments.version;
            break;

            case 1:
            case 2:
                name = styles[arguments.version];
            break;

            default:
        }

        if( local.name == "" ){
            throw( 
                type="CFYAML_DUMPEROPTIONS_WRONG_VERSION", 
                message="Version must be one of these values in #serializeJson(styles)#" 
            );
        }

        unwrap().setVersion( createObject("java", static.CLASSPATH_DUMPEROPTIONS_VERSION).valueOf(local.name) );

        return this;

    }

    




}
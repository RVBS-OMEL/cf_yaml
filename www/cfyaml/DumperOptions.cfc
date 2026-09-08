component{

    public DumperOptions function init(){
        variables.dumperOptions = static.new();
        return this;
    }

    public static any function new(){
        return createObject("java", "org.yaml.snakeyaml.DumperOptions").init();
    }

    public any function unwrap(){
        return variables.dumperOptions;
    }

    public any function setLineBreak( required any type ){

        

        var lbClassPath="org.yaml.snakeyaml.DumperOptions$LineBreak";
        var types = ["MAC","WIN","UNIX","PLATFORM"];
        
        switch(arguments.type){
            case "MAC":
            case "WIN":
            case "UNIX":
                var lb = createObject("java", lbClassPath).valueOf( ucase(arguments.type) );
                local.found=true;
            break;

            case 4:
            case "PLATFORM":
                var lb = createObject("java", lbClassPath).getPlatformLineBreak();
            break;

            case 1:
            case 2:
            case 3:
                var lb = createObject("java", lbClassPath).valueOf( local.types[ arguments.type ] );
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


    /*
    Flow style
    */

    public DumperOptions function setFlowStyle( required any flowStyle){

        var styles = ["AUTO", "BLOCK", "FLOW"];
        var flowStyleClassPath = "org.yaml.snakeyaml.DumperOptions$FlowStyle";

        switch( arguments.flowStyle ){

            case "AUTO":
            case "FLOW":
            case "BLOCK":
                var name = uCase(arguments.flowStyle);
            break;

            case 1:
            case 2:
            case 3:
                var name = styles[arguments.flowStyle];
            break;

            default:
                throw( 
                    type="CFYAML_DUMPEROPTIONS_WRONG_FLOW_STYLE", 
                    message="Flow style can be 'AUTO' (or 1), 'FLOW' (or 2), 'BLOCK' (or 3)" 
                );
            break;

        }

        unwrap().setDefaultFlowStyle( createObject( "java", flowStyleClassPath ).valueOf( local.name ) );
        return this;
    }

    public string function getFlowStyle(){
        return unwrap().getDefaultFlowStyle().name();
    }

}
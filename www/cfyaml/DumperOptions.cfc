component{

    static{
        static.LB_UNIX_INSTANCE = createObject("java", "org.yaml.snakeyaml.DumperOptions$LineBreak").UNIX;
        static.LB_MAC_INSTANCE = createObject("java", "org.yaml.snakeyaml.DumperOptions$LineBreak").MAC;
        static.LB_WIN_INSTANCE = createObject("java", "org.yaml.snakeyaml.DumperOptions$LineBreak").WIN;
    }

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

        local.jtype = 0;
        

        switch(arguments.type){

            case "MAC":
            case 1:
                local.jtype = static.LB_MAC_INSTANCE;
            break;

            case "UNIX":
            case 2:
                local.jtype = static.LB_UNIX_INSTANCE;
            break;

            case "WIN":
            case 3:
                local.jtype = static.LB_WIN_INSTANCE;
            break;

            case "PLATFORM":
            case 4:
                local.jtype = createObject("java",local.classPath).getPlatformLineBreak();
            break;

            default:
                throw( 
                    type="CFYAML_DUMPEROPTIONS_WRONG_LB_TYPE", 
                    message="Line break can be 'MAC' (or 1), 'UNIX' (or 2 (default used by SnakeYaml)), 'WIN' (or 3), 'PLATFORM' (or 4 = server platform LB)" 
                    );
            break;
        }
        unwrap().setLineBreak(jtype);
        return this;
    }


    

    public string function getLineBreak(){

        var lb = unwrap().getLineBreak();

        if( lb == static.LB_WIN_INSTANCE ){
            return "WIN";
        }

        if( lb == static.LB_UNIX_INSTANCE ){
            return "UNIX";
        }  
        
        if( lb == static.LB_MAC_INSTANCE ){
            return "MAC";
        } 

    }

}
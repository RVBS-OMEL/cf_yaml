<html>
    <head>
        <cfinclude template="style.cfm" />
    </head>
    <body>
    <cfinclude template="navbar.cfm" runonce=true />
<h1>
    How to use SnakeYaml.cfc
</h1>

<pre>
    snake = new cfyaml.SnakeYaml();
    cfvarFromYaml = snake.fromFile( expandPath("./test1.yaml") );
    writeDump(cfvarFromYaml);
</pre>

<cfscript>
    snake = new cfyaml.SnakeYaml();
    cfvarFromYaml = snake.fromFile( expandPath("./test1.yaml") );
    writeDump(cfvarFromYaml);

</cfscript>

<pre>
    snake = new cfyaml.SnakeYaml();
    cfvarFromYaml = snake.fromString( "firstName: Olivier" );
    writeDump(cfvarFromYaml);
</pre>

<cfscript>
    //snake = new cfyaml.SnakeYaml();
    cfvarFromYaml = snake.fromString( "firstName: Olivier" );
    writeDump(cfvarFromYaml);

     cfvarFromYaml = snake.fromString( "- firstName: Olivier" );
    writeDump(cfvarFromYaml);

</cfscript>
    </body>
</html>




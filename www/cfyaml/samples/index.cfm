<pre>
cf_yaml(
    action="read-file",
    path = expandPath("./test1.yaml"),
    variable="generated_struct_from_yaml"
);
writedump(variables.generated_struct_from_yaml);
</pre>

<cfscript>

    cf_yaml(
        action="read-file",
        path = expandPath("./test1.yaml"),
        variable="generated_struct_from_yaml"
    );
    writedump(variables.generated_struct_from_yaml);
    //writedump(variables.cfyaml_generated_struct);

</cfscript>
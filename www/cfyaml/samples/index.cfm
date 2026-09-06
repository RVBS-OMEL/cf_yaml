<style>

    pre, h3{
        font-family:verdana;
        font-size:x-small;
    }

    pre{
        background-color: lightgrey;
    }
</style>

<pre>
//content of test1.yaml
last_name: Doe
first_name: Jane
age: 28
</pre>


<h3>Calling cf_yaml to parse a Yaml file and convert it a Coldfusion structure in cfscript style ( with no end tag )</h3>

<cfset varname="generated_struct_from_yaml_with_cfscript_hasEndTagFalse" >
<cfoutput>
<pre>
cf_yaml(
    action="read-file",
    path = expandPath("./test1.yaml"),
    variable="#varname#"
);
writedump(var=variables.#varname# label="#varname#");
</pre>
</cfoutput>

<cfscript>

cf_yaml(
    action="read-file",
    path = expandPath("./test1.yaml"),
    variable="#varname#"
);
writedump(
    var=variables['#varname#'],
    label="#varname#"
);

</cfscript>

<hr>
<h3>Calling cf_yaml to parse a Yaml file and convert it a Coldfusion structure in cfscript style with an empty generatedContent )</h3>
<cfset varname="generated_struct_from_yaml_with_cfscript_hasEmptyGeneratedContent" >

<cfoutput>
<pre>
cf_yaml(
    action="read-file",
    path = expandPath("./test1.yaml"),
    variable="#varname#"
){};
writedump(
    var=variables.#varname#,
    label="#varname#"
);
</pre>
</cfoutput>

<cfscript>

    cf_yaml(
        action="read-file",
        path = expandPath("./test1.yaml"),
        variable="#varname#"
    ){};
    writedump(var="#variables[varname]#",  label="#varname#")
    

</cfscript>

<hr>
<h3>Calling cf_yaml to parse a Yaml file and convert it a Coldfusion structure in cfscript style with an NON empty generatedContent )</h3>

<cfset varname="generated_struct_from_yaml_with_cfscript_with_non_empty_content">
<cfoutput>
<pre>
cf_yaml(
    action="read-file",
    path = expandPath("./test1.yaml"),
    variable="#varname#"
){
    writeOutput("This call has a generated content that will NEVER be shown because it is erased by the custom tag.");
};
writedump(
    var=variables.#varname#,
    label="#varname#"
);
</pre>
</cfoutput>
<cfscript>

    cf_yaml(
        action="read-file",
        path = expandPath("./test1.yaml"),
        variable="#varname#"
    ){
        writeOutput("This call has a generated content that will NEVER be shown because it is erased by the custom tag.");
    };
    writedump(var="#variables[varname]#",  label="#varname#")
</cfscript>

<hr>
<h3>Calling &ltcf_yaml&gt; to parse a Yaml file and convert it a Coldfusion structure in CFML style with no end tag</h3>

<cfset varname="generated_struct_from_cfyaml_cfml_noendtag"/>
<cfoutput>
<pre>
&lt;cf_yaml 
    variable="#varname#"
    path = "##expandPath("./test1.yaml")##"
    action="read-file"
&gt;
</pre>


<cf_yaml 
    variable="#varname#"
    path = "#expandPath("./test1.yaml")#"
    action="read-file"
>
<cfdump var="#variables[varname]#" label="#varname#" />
</cfoutput>

<hr>
<h3>Calling &ltcf_yaml&gt; to parse a Yaml file and convert it a Coldfusion structure in CFML style WITH EMPTY generatedContent</h3>
<cfset varname="generated_struct_from_cfyaml_cfml_with_empty_generatedcontent" />
<cfoutput>
<pre>
&lt;cf_yaml 
    variable="#varname#"
    path = "##expandPath("./test1.yaml")##"
    action="read-file"
&gt;&lt;/cf_yaml&gt;
</pre>
</cfoutput>
<cf_yaml 
    variable="#varname#"
    path = "#expandPath("./test1.yaml")#"
    action="read-file"
></cf_yaml>
<cfdump var="#variables[varname]#" label="#varname#" />

<hr>
<h3>Calling &ltcf_yaml&gt; to parse a Yaml file and convert it a Coldfusion structure in CFML style WITH NON-EMPTY generatedContent</h3>
<cfset varname="generated_struct_from_cfyaml_cfml_with_nonempty_generatedcontent" />
<cfoutput>
<pre>
&lt;cf_yaml 
    variable="#varname#"
    path = "##expandPath("./test1.yaml")##"
    action="read-file"
&gt;
&lt;cfoutput&gt;
This call has a generated content that will NEVER be shown because it is erased by the custom tag.
&lt;/cfoutput&gt;
&lt;/cf_yaml&gt;
</pre>
</cfoutput>
<cf_yaml 
    variable="#varname#"
    path = "#expandPath("./test1.yaml")#"
    action="read-file"
>
<cfoutput>
This call has a generated content that will NEVER be shown because it is erased by the custom tag.
</cfoutput>
</cf_yaml>
<cfdump var="#variables[varname]#" label="#varname#" />
## CF_YAML
### Description
cf_yaml helps you use YAML within coldfusion applications.
It integrates SnakeYaml library. [Click here](https://mvnrepository.com/artifact/org.yaml/snakeyaml) for more information on SnakeYAML





```javascript
//Application.cfc

this.javaSettings = {
    loadPaths: [
        expandPath( "../libs/snakeyaml/current/" ),
    ],
    loadColdFusionClassPath: true,
    reloadOnChange: true,
    watchInterval: 5,
    watchExtensions: "jar,class"
};
```

### How to read a Yaml file and convert it into a Coldfusion variable.
#### Cfscript syntax
```javascript
//Read a YAML and convert it into a Coldfusion variable
snake = new cfyaml.SnakeYaml();
//or old fashion
//snake = createObject("component", "cfyaml.SnakeYaml").init();

cfvarFromYaml = snake.fromFile( expandPath("./test1.yaml") );
```
#### CFML syntax
```xml
<!--- Read a YAML and convert it into a Coldfusion variable --->
<cfset snake = new cfyaml.SnakeYaml() />
<cfset cfvarFromYaml = snake.fromFile( expandPath("./test1.yaml") ) />
```

### How to convert a Yaml String into a Coldfusion variable.
```javascript
//Read a YAML String and convert it into a Coldfusion variable
//get an instance
snake = new cfyaml.SnakeYaml();

//get a coldfusion variable from provided string [ here will return a CF structure ]
cfvarFromYaml = snake.fromString( "firstName: John" );
```
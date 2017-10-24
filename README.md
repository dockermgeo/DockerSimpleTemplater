# DockerSimpleTemplater

### Installation
```
git clone https://github.com/git-mgeo/DockerSimpleTemplater
cd DockerSimpleTemplater
make install
```

#### Dependencies
* jq

on
*  Ubuntu: apt get install -yq
*  Alpine: apk add -yq


### Using

1. Define Jsonfile
2. Bind Templates 
3. Call docker-templater

#### Command:
```
 /usr/local/bin/docker-templater <jsonfile>
```


### Define Sets/Configurations
JSON
```
[
 {
   'template':'/src/index.tpl.html',
   'target':'/usr/share/nginx/html/index.html',
   'set':[ "ENV_FIRSTNAME", "ENV_LASTNAME", "ENV_STREET", "ENV_PLACE" ]
  },
  {....}
]
```

### Template
```
 < h1 >Hallo %%ENV_FIRSTNAME%%!< /h1 >
```

### Docker special
You can use docker-templater on Dockerbootstrap. Put this File into DockerBootstrap -up.d/.
More Info to [DockerBootstrap] [1].

[1] https://github.com/git-mgeo/DockerBootstrap

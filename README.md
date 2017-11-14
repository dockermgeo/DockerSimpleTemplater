# DockerSimpleTemplater

### Installation
```
git clone https://github.com/dockermgeo/DockerSimpleTemplater
cd DockerSimpleTemplater
make
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
 /usr/local/bin/docker-simple-templater <jsonfile>
```


### Define Sets/Configurations
JSON
```
[
 {
   'template':'/src/index.tpl.html',
   'target':'/usr/share/nginx/html/index.html',
   'set':[ "ENV_FIRSTNAME", "ENV_LASTNAME", "ENV_STREET", "ENV_RUNPORT" ],
   'keystore': {
     'server_adress': 'redis:6379'
     'group': 'de.cloud.key_value_group_id'
   }
  },
  {....}
]
```
- Wenn das Object keystore null ist, werden keine ENV-Variablen aus dem Keystore verwendet. D.h. alle nötigen ENVs aus set müssen von aussen beigesteuert werden.
- Ansonsten wird eine Variable nach "groupid.varname" aufgelöst. Beispiel:
```
  #get de.cloud.your_product.your_env_variable
  get de.cloud.helloworldapp.ENV_RUNPORT
```

### Template
```
 < h1 >Hallo %%ENV_FIRSTNAME%%!< /h1 >
```

### Docker integration on boot
You can use docker-templater on Dockerbootstrap. Put this File into DockerBootstrap -up.d/.
More Info to [DockerBootstrap](https://github.com/dockermgeo/DockerBootstrap).

#### Snipplet from a Dockerfile
```
RUN apt-get update && apt-get install -qj jq git && cd /tmp && \
    git clone https://github.com/dockermgeo/DockerSimpleTemplater && \
    cd DockerSimpleTemplater && make && \
    mv /usr/local/bin/docker-simple-templater /etc/docker/up.d/010_docker-simple-templater.sh

#you can add json also as volume -v /tmp/myproject-app_template.json:/template.json
COPY src/app_template.json /template.json
```

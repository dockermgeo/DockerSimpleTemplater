# DockerSimpleTemplater

Define needed Variables and replace Variables in Files on startup.
Filling Variables can come from boot (composition) or automaticly from a Keystore as redis.

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
- If the Object keystore are null, no connection will startet to keystore. All ENV-Variables must come from boot.
- On Connection. All Env-Variables will load by syntax "groupid.varname".

```
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
    mv /bin/docker-env-redis /etc/docker/up.d/009_docker-keystore-loader.sh && \
    mv /bin/docker-simple-templater /etc/docker/up.d/010_docker-simple-templater.sh


#you can add json also as volume -v /tmp/myproject-app_template.json:/template.json
COPY src/app_template.json /template.json
```

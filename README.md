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


### Using Docker-Simple-Templater

1. Define Jsonfile (Sets/Configurations)
2. Bind Templates
3. Call docker-templater

#### Command:
```
 /usr/local/bin/docker-simple-templater <jsonfile>
```


### Define JSON (Sets/Configurations)
JSON
```
[
 {
   'template':'/src/index.tpl.html',
   'target':'/usr/share/nginx/html/index.html',
   'set':[ "ENV_FIRSTNAME", "ENV_LASTNAME", "ENV_STREET", "DB_ADDRESS" ],
   'keyqualifier': 'de.cloud.key_value_group_id'
  },
  {....}
]
```
- **OBJECT**: Docker-Simple-Templater works on each Object. You can define any...
- **keyqualifier**: Group, Name or ID as PREFIX before variablename ("keyqualifier.varname"). Depends by keystores!
- **set**: Set of needed variables
- **template**: Templatefile
- **target**: Destination, in which Templatefile will copy and replaced all variables from set.


### Bind Template
Edit your Templatefile and set Variablename between "%%" at start and end of targetposition.
```
 < h1 >Hallo %%ENV_FIRSTNAME%%!< /h1 >
```

### Docker integration on boot
You can use docker-templater on Dockerbootstrap. Put this File into DockerBootstrap -up.d/.
More Info to [DockerBootstrap](https://github.com/dockermgeo/DockerBootstrap).

![Architecture](docs/dst-architektur.png)


#### Snipplet from a Dockerfile
```
ENV REDIS_HOST 192.1.168.32
RUN apt-get update && apt-get install -qj jq git && cd /tmp && \
    git clone https://github.com/dockermgeo/DockerSimpleTemplater && \
    cd DockerSimpleTemplater && make && \
    mv /bin/docker-simple-templater /etc/docker/up.d/010_docker-simple-templater.sh

# nexst: enabling loading from keystore
#RUN mv /bin/docker-env-redis /etc/docker/up.d/009_docker-keystore-loader.sh

#you can add json also as volume -v /tmp/myproject-app_template.json:/template.json
COPY src/app_template.json /template.json
```

#### Special Redis
A RedisDB-Dockerimage you'll find on Dockerhub "[dockermgeo/redisdb](https://hub.docker.com/r/dockermgeo/redisdb/)".

# DockerSimpleTemplater

### Installation
```
git clone https://github.com/git-mgeo/DockerSimpleTemplater
cd DockerSimpleTemplater
make install
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

### RUN
```
 /usr/local/bin/DockerSimpleTemplater <jsonfile>
```



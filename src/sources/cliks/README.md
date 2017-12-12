# Cliks
***Cliks*** is a client for handling keystores as vault or redis.

## Install

### Linux & Docker
```
RUN cd /tmp && \
    git clone https://github.com/dockermgeo/Cliks && \
    cd /tmp/Cliks && \
    make install && \
    rm -Rf /tmp/Cliks
```


## Configure Redis or Vault
If Environmentvariable **VAULT_ADDR** is set, **cliks** will us vault as keystoreengine.


### Environmentvariables

#### Vault
- VAULT_ADDR
- VAULT_TOKEN

#### Redis
- REDIS_ADDR
- REDIS_PASSWORD


## Using

### Get a Value from keystore
cliks get 'KEYNAME'

### Setting a Value in keystore
cliks set 'KEYNAME' 'VALUE'


#### Example
```
#>: cliks set de.dockermgeo.services.app.name "This is from HelloWorld!"
#>: Secret de.dockermgeo.services.app.name stored!
#>: cliks get de.dockermgeo.services.app.name
#>: This is from HelloWorld!
```

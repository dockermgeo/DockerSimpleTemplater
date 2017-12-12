## VAULT

### VAULT ENV-Variables
```
export VAULT_ADDR='http://0.0.0.0:8200'
export VAULT_TOKEN='token123'
```
#### Vault login
```
vault auth ${VAULT_ADDR} ${$VAULT_TOKEN}
```

#### Vault logging
```
vault audit-enable -address=${VAULT_ADDR} file file_path=/vault/logs/audit.log
```

#### Vault set
```
vault write -address=${VAULT_ADDR} secret/de/mydomain/keyname value='hello world!''
```

#### Vault get
```
vault read -address=${VAULT_ADDR} secret/de/mydomain/keyname
```

#### Vault write policy
```
vault policy-write -address=${VAULT_ADDR} web-policy /policies/web-policy.hcl
```

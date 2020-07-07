docker/.env\
What variables mean

`GW_HOST_FRONTEND`
```
Current hostname, for local dev can be empty
```

`ENV`
```
Environment. For example, used for selecting certitcate path
```

`WITH_INSTALL`
```
if WITH_INSTALL=true, after starting container vendor installation will take place (npm, composer)
```

`WITH_SSL`
```
Use ssl or not
```

`FRONT_MODE`
```
static or dev.\
If static, then static html will be built and placed in shared volume.
If not, then vue serve will be used
For building static front just make docker-compose up -d --force-recreate gigwire-frontend 
```


`GMAPS_API_KEY`
```
Key for GMaps API  
```